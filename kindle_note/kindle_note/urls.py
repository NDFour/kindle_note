"""kindle_note URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/2.2/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.contrib import admin
from django.urls import path

from export import views as export_views


urlpatterns = [
    path('admin/', admin.site.urls),

    path('', export_views.index, name = 'index'),
    path('export/', export_views.index, name = 'export_views_index'),
    # path('export/upload_msg/', export_views.upload_msg, name = 'export_views_upload_msg'),
    path('get_file/', export_views.get_file, name = 'get_file'),
]
