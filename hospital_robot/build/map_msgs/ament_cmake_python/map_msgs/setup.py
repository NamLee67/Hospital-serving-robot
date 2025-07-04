from setuptools import find_packages
from setuptools import setup

setup(
    name='map_msgs',
    version='2.1.0',
    packages=find_packages(
        include=('map_msgs', 'map_msgs.*')),
)
