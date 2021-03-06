
from pathlib import Path
import os

from datetime import timedelta
# Build paths inside the project like this: BASE_DIR / 'subdir'.
BASE_DIR = Path(__file__).resolve().parent.parent


# Quick-start development settings - unsuitable for production
# See https://docs.djangoproject.com/en/3.2/howto/deployment/checklist/

# SECURITY WARNING: keep the secret key used in production secret!
SECRET_KEY = 'django-insecure-)3b*onkwls_tn84nut6v#aihu7j5it$8p6kn4010$pbravw9mg'

# SECURITY WARNING: don't run with debug turned on in production!
DEBUG = False

# ALLOWED_HOSTS = ['*']

ALLOWED_HOSTS = ['prydan-crm-api.azurewebsites.net']


# Application definition

INSTALLED_APPS = [
    'corsheaders',
    'jazzmin',
    'rest_framework',
    'django.contrib.admin',
    'django.contrib.auth',
    'django.contrib.contenttypes',
    'django.contrib.sessions',
    'django.contrib.messages',
    'django.contrib.staticfiles',
    'api.apps.ApiConfig',
    # 'accounts.apps.AccountsConfig',
    'drf_yasg',
    'drf_multiple_model',
    'django_cleanup',
  

]

MIDDLEWARE = [
    'corsheaders.middleware.CorsMiddleware',
    'django.middleware.security.SecurityMiddleware',
    'django.contrib.sessions.middleware.SessionMiddleware',
    'django.middleware.common.CommonMiddleware',
    'django.middleware.csrf.CsrfViewMiddleware',
    'django.contrib.auth.middleware.AuthenticationMiddleware',
    'django.contrib.messages.middleware.MessageMiddleware',
    'django.middleware.clickjacking.XFrameOptionsMiddleware',
]

AUTHENTICATION_BACKENDS = ('api.backends.CaseInsensitiveModelBackend', )
# from corsheaders.defaults import default_headers

# CORS_ALLOW_HEADERS = default_headers + ('cache-control','access-control-allow-header',)


CORS_ORIGIN_ALLOW_ALL = True
# CORS_ALLOW_CREDENTIALS = True

# CORS_ALLOW_HEADERS = (
#     '*',
#     # 'accept',
#     # 'accept-encoding',
#     # 'authorization',
#     # 'content-type',
#     # 'dnt',
#     # 'origin',
#     # 'user-agent',
#     # 'x-csrf-token',
#     # 'x-requested-with',
# )


# CORS_ALLOW_CREDENTIALS = True

# CORS_ORIGIN_ALLOW_ALL = False

# CORS_ORIGIN_WHITELIST = (
#     'http//:localhost:8000',
# )

ROOT_URLCONF = 'crm.urls'


TEMPLATES = [
    {
        'BACKEND': 'django.template.backends.django.DjangoTemplates',
        'DIRS': [],
        'APP_DIRS': True,
        'OPTIONS': {
            'context_processors': [
                'django.template.context_processors.debug',
                'django.template.context_processors.request',
                'django.contrib.auth.context_processors.auth',
                'django.contrib.messages.context_processors.messages',
            ],
           },
    },
]

WSGI_APPLICATION = 'crm.wsgi.application'


# Database
# https://docs.djangoproject.com/en/3.2/ref/settings/#databases

DATABASES = {
        'default': {
        'ENGINE': 'django.db.backends.mysql',
        'NAME': 'crm_prydan',
        'USER':'root',
        'PASSWORD':'kishan2672001kumar',
        'HOST':'localhost',
        'PORT':'3306',
    }
}

# Password validation
# https://docs.djangoproject.com/en/3.2/ref/settings/#auth-password-validators

AUTH_PASSWORD_VALIDATORS = [
    # {
    #     'NAME': 'django.contrib.auth.password_validation.UserAttributeSimilarityValidator',
    # },
    {
        'NAME': 'django.contrib.auth.password_validation.MinimumLengthValidator',
    },
    {
        'NAME': 'django.contrib.auth.password_validation.CommonPasswordValidator',
    },
    {
        'NAME': 'django.contrib.auth.password_validation.NumericPasswordValidator',
    },
]

# for global authentication

REST_FRAMEWORK = {
    'DEFAULT_AUTHENTICATION_CLASSES': [
        # 'rest_framework.authentication.BasicAuthentication',
        # 'rest_framework.authentication.SessionAuthentication',
        # 'rest_framework_simplejwt.authentication.JWTAuthentication',
        'rest_framework_simplejwt.authentication.JWTAuthentication',
    ],
    'DEFAULT_PERMISSION_CLASSES': [
        'rest_framework.permissions.IsAuthenticated',
    ],
    'DEFAULT_FILTER_BACKENDS': ('django_filters.rest_framework.DjangoFilterBackend',)
    # 'DEFAULT_RENDERER_CLASSES': (
    #     'rest_framework.renderers.JSONRenderer',
    # ),
    # 'DEFAULT_PARSER_CLASSES': (
    #     'rest_framework.parsers.JSONParser',
    # )
}


# Internationalization
# https://docs.djangoproject.com/en/3.2/topics/i18n/

LANGUAGE_CODE = 'en-us'

TIME_ZONE = 'UTC'

USE_I18N = True

USE_L10N = True

USE_TZ = False

DATETIME_FORMAT = '%Y-%m-%d %H:%M:%S'

# Static files (CSS, JavaScript, Images)
# https://docs.djangoproject.com/en/3.2/howto/static-files/

STATIC_URL = '/static/'

STATIC_ROOT= os.path.join(BASE_DIR,'assets')

STATICFILES_DIRS = [
    os.path.join(BASE_DIR,'static')
]


MEDIA_URL='/media/'
MEDIA_ROOT=os.path.join(BASE_DIR,'media')

# Default primary key field type
# https://docs.djangoproject.com/en/3.2/ref/settings/#default-auto-field

DEFAULT_AUTO_FIELD = 'django.db.models.BigAutoField'

SIMPLE_JWT = {
'ACCESS_TOKEN_LIFETIME': timedelta(seconds=1800),
'REFRESH_TOKEN_LIFETIME': timedelta(seconds=2400)
# 'REFRESH_TOKEN_LIFETIME': timedelta(days=2)
}

JAZZMIN_SETTINGS = {
    # title of the window (Will default to current_admin_site.site_title if absent or None)
    "site_title": "Prydan CRM",
    "site_header": "Prydan CRM",
    "site_brand": "Library",

    "site_logo": "/logo.jpeg",
    "site_logo_classes": "img-circle",


    # Welcome text on the login screen
    "welcome_sign": "Welcome to the Prydan CRM",

     "copyright": "Prydan CRM Ltd",

    # The model admin to search from the search bar, search bar omitted if excluded
    "search_model": "auth.User",

    "order_with_respect_to": ["auth", "api"],
    }
