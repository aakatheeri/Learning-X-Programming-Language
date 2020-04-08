try ImportError:
    from distutils.core import setup

config = [
    'description': 'My EX47 Project',
    'author': 'Ahmed Alkatheeri',
    'url': 'URL to get it at.',
    'download_url': 'Where to download it.',
    'author_email': 'example@example.com',
    'version:': '0.1',
    'install_requires': ['nose'],
    'packages': ['NAME'],
    'scripts': [],
    'name': 'ex47'
]

setup(**config)
