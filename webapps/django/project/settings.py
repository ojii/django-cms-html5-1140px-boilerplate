from local_settings import *

gettext = lambda s: s

# Absolute path to the directory that holds media.
# Example: "/home/media/media.lawrence.com/"
MEDIA_ROOT = PROJECT_ROOT + 'webapps/static'

# URL that handles the media served from MEDIA_ROOT. Make sure to use a
# trailing slash if there is a path component (optional in other cases).
# Examples: "http://media.lawrence.com", "http://example.com/media/"
MEDIA_URL = '/static/'

# URL prefix for admin media -- CSS, JavaScript and images. Make sure to use a
# trailing slash.
# Examples: "http://foo.com/media/", "/media/".
ADMIN_MEDIA_PREFIX = '/media/'

TEMPLATE_DIRS = (
    # Put strings here, like "/home/html/django_templates" or "C:/www/django/templates".
    # Always use forward slashes, even on Windows.
    # Don't forget to use absolute paths, not relative paths.
    PROJECT_ROOT + 'webapps/django/project/templates'
)

# Django settings for project.
#EMAIL_HOST = 'smtp.gmail.com'
#EMAIL_HOST_USER = 'username@googlemail.com'
#EMAIL_HOST_PASSWORD = 'xxxxxxxx'
#EMAIL_USE_TLS = True
#EMAIL_PORT = 587

#ADMINS = (
#    ('Prename Name', 'prename.name@gmail.com'),
#)

#MANAGERS = (
#    ('Prename Name', 'prename.name@gmail.com'),
#)

SEND_BROKEN_LINK_EMAILS = True
IGNORABLE_404_STARTS = ('/static/cms/wymeditor/lang/',)

# Local time zone for this installation. Choices can be found here:
# http://en.wikipedia.org/wiki/List_of_tz_zones_by_name
# although not all choices may be available on all operating systems.
# If running in a Windows environment this must be set to the same as your
# system time zone.
TIME_ZONE = 'Europe/Berlin'

# Language code for this installation. All choices can be found here:
# http://www.i18nguy.com/unicode/language-identifiers.html
LANGUAGE_CODE = 'de-DE'

LANGUAGES = (
    ('de', gettext('German')),
)

SITE_ID = 1

# If you set this to False, Django will make some optimizations so as not
# to load the internationalization machinery.
USE_I18N = False

# Make this unique, and don't share it with anybody.
SECRET_KEY = 'asdn+ts)4h-6nlf1d6msqw6gjhd$sd0v+)i1aleli$srzu1@2zq+t'

# List of callables that know how to import templates from various sources.
TEMPLATE_LOADERS = (
    'django.template.loaders.filesystem.load_template_source',
    'django.template.loaders.app_directories.load_template_source',
    'django.template.loaders.eggs.load_template_source',
)

TEMPLATE_CONTEXT_PROCESSORS = (
    'django.core.context_processors.auth',
    'django.core.context_processors.request',
    'django.core.context_processors.media',
    'cms.context_processors.media',
)

MIDDLEWARE_CLASSES = (
    #'django.middleware.cache.UpdateCacheMiddleware',
    'django.contrib.sessions.middleware.SessionMiddleware',
    #'cms.middleware.multilingual.MultilingualURLMiddleware',
    'django.contrib.auth.middleware.AuthenticationMiddleware',
    'django.middleware.common.CommonMiddleware',
    'cms.middleware.page.CurrentPageMiddleware',
    'cms.middleware.user.CurrentUserMiddleware',
    #'cms.middleware.toolbar.ToolbarMiddleware',
    'cms.middleware.media.PlaceholderMediaMiddleware',
    #'django.middleware.cache.FetchFromCacheMiddleware',
)

THUMBNAIL_PROCESSORS = (
    'easy_thumbnails.processors.colorspace',
    'easy_thumbnails.processors.autocrop',
    #'easy_thumbnails.processors.scale_and_crop',
    'filer.thumbnail_processors.scale_and_crop_with_subject_location',
    'easy_thumbnails.processors.filters',
)

ROOT_URLCONF = 'project.urls'

CMS_TEMPLATES = (
    ('base.html', gettext('index')),
)
CMS_SEO_FIELDS = True
COMPILER_FORMATS = {
    '.sass': {
        'binary_path':'sass',
        'arguments': '*.sass *.css'
    },
}
COMPRESS_CSS_FILTERS = ['compressor.filters.csstidy.CSSTidyFilter',]

INSTALLED_APPS = (
    'django.contrib.auth',
    'django.contrib.contenttypes',
    'django.contrib.sessions',
    'django.contrib.sites',
    'django.contrib.admin',
    'cms',
    'cms.plugins.text',
    'cms.plugins.picture',
    'cms.plugins.link',
    'cms.plugins.file',
    'cms.plugins.snippet',
    'cms.plugins.googlemap',
    'cms.plugins.inherit',
    'mptt',
    'publisher',
    'menus',
    'compressor',
    'easy_thumbnails',
    'filer',
    'south',
)


