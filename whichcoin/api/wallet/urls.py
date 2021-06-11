from django.urls import path,include

from .views import CategoryAdd,CategoryList, CategoryDelete,CategoryUpdate
# ,addCollection,deleteCollection
# ,CollectionProductList

urlpatterns = [
    path('' ,  CategoryList.as_view()  ,  name='categories'),
    path('add/',CategoryAdd.as_view()  ,  name='addcategory'),
    path('update/<slug>/',CategoryUpdate.as_view()  ,  name='updatecategory'),
    path('delete/<slug>/', CategoryDelete.as_view() ,  name='deletecategory'),
    
]
