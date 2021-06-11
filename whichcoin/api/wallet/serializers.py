from rest_framework import serializers
from categories.models import Collection
class ListCollectionsAPIView(serializers.ModelSerializer):
    class Meta:
        ordering = ['-id']
        model = Collection
        fields = [
            'id',
            'name',
            'img',
            'description',
            'slug',
            'meta_desc'
        ]

