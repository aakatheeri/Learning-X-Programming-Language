try:
    from setuptools import  setup

except ImportError:
    from distutils.code import setup

config = {
    'description': 'My Project description',
    'author': 'My Name',
    'url': 'http://example.com',
    'download_url': 'http://example.com/download/',
    'author_email': 'My email',
    'version': '0.1',
    'install_requires': ['nose'],
    'packages': ['NAME'],
    'scripts': [],
    'name': 'projectname'
}

setup(**config)
