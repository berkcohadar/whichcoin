#rest_framework
from rest_framework.generics import ListAPIView,CreateAPIView, RetrieveDestroyAPIView,RetrieveUpdateAPIView
from rest_framework.permissions import AllowAny
from rest_framework.authentication import SessionAuthentication,TokenAuthentication
from rest_framework.permissions import AllowAny,IsAdminUser

from django_filters.rest_framework import DjangoFilterBackend
from rest_framework import filters
#serializers
from .serializers import ListCollectionsAPIView

#models
from categories.models import Collection


class CategoryAdd(CreateAPIView):
    queryset = Collection.objects.all()
    permission_classes = [IsAdminUser]
    authentication_classes = [SessionAuthentication,TokenAuthentication]
    serializer_class = ListCollectionsAPIView
class CategoryList(ListAPIView):
    queryset = Collection.objects.all()
    serializer_class = ListCollectionsAPIView
    permission_classes = [AllowAny]

    filter_backends = [DjangoFilterBackend,filters.OrderingFilter]
    filterset_fields = ['id','name','img','description','slug','meta_desc']
    ordering_fields = ['id']
class CategoryUpdate(RetrieveUpdateAPIView):
    queryset = Collection.objects.all()
    serializer_class = ListCollectionsAPIView
    authentication_classes = [SessionAuthentication, TokenAuthentication]
    permission_classes = [IsAdminUser]
    lookup_field = 'slug'

class CategoryDelete(RetrieveDestroyAPIView):
    permission_classes = [IsAdminUser]
    authentication_classes = [SessionAuthentication, TokenAuthentication]
    serializer_class = ListCollectionsAPIView
    queryset = Collection.objects.all()
    lookup_field = 'slug'