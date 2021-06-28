#rest_framework
from rest_framework.generics import ListAPIView,CreateAPIView, RetrieveDestroyAPIView,RetrieveUpdateAPIView
from rest_framework.permissions import AllowAny, IsAuthenticated
from rest_framework.authentication import SessionAuthentication,TokenAuthentication
from rest_framework.permissions import AllowAny,IsAdminUser
from rest_framework.response import Response
from rest_framework.status import HTTP_400_BAD_REQUEST,HTTP_200_OK

from django_filters.rest_framework import DjangoFilterBackend
from rest_framework import filters

#serializers
from .serializers import ListWalletAPIView, WalletItemSerializer

#models
from Wallet.models import Wallet, WalletItem

class AllWalletList(ListAPIView):
    queryset = Wallet.objects.all()
    permission_classes = [IsAdminUser]
    authentication_classes = [SessionAuthentication,TokenAuthentication]
    serializer_class = ListWalletAPIView

class WalletList(ListAPIView):
    queryset = Wallet.objects.all()
    serializer_class = ListWalletAPIView
    permission_classes = [IsAuthenticated]
    authentication_classes = [SessionAuthentication,TokenAuthentication]

    filter_backends = [DjangoFilterBackend,filters.OrderingFilter]
    filterset_fields = ['id','name']
    ordering_fields = ['id']

    def get_queryset(self):
        user = self.request.user
        queryset = Wallet.objects.filter(user=user.id)
        return queryset

class WalletDetail(RetrieveUpdateAPIView):
    queryset = Wallet.objects.all()
    serializer_class = ListWalletAPIView
    permission_classes = [IsAuthenticated]
    authentication_classes = [SessionAuthentication, TokenAuthentication]
    lookup_field = 'id'
    
    def get_myWallet(self,id):
        wallet = Wallet.objects.filter(id=id)
        if wallet:
            result = wallet[0]
            return result
        else:
            return 0

    def get(self, request, *args, **kwargs):
        id = self.kwargs['id']
        myWallet = self.get_myWallet(id)
        if myWallet:
            if myWallet.user.id != self.request.user.id:
                return Response({"Error":"You do not have a permission to make this request." },status=HTTP_400_BAD_REQUEST)
        else:
            return Response({"Error":"There is no valid Wallet with this ID." },status=HTTP_400_BAD_REQUEST)
        return super().get(request, *args, **kwargs)

class AddToWallet(CreateAPIView):
    queryset = Wallet.objects.all()
    permission_classes = [IsAuthenticated]
    authentication_classes = [SessionAuthentication,TokenAuthentication]
    serializer_class = ListWalletAPIView

class RemoveFromWallet(RetrieveDestroyAPIView):
    queryset = Wallet.objects.all()
    permission_classes = [IsAuthenticated]
    authentication_classes = [SessionAuthentication,TokenAuthentication]
    serializer_class = ListWalletAPIView