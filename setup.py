from setuptools import find_packages, setup

setup(
    name='band_app',
    version='1.0.0',
    packages=find_packages(),
    include_package_data=True,
    zip_safe=False,
    install_requires=[
        'Flask==2.1.1',
        'click==8.1.2',
    ],
)