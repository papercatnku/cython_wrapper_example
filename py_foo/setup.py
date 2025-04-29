# setup.py
from setuptools import setup, Extension, find_packages
from Cython.Build import cythonize
import numpy as np

static_libs = [
    '../lib/libfoo_sdk.a',
]

extensions = [
    Extension(
        "py_foo",
        sources=["py_foo_wrapper.pyx"],
        packages=["py_foo"],
        extra_objects=static_libs,
        language="c++",
        libraries=['pthread'],
        extra_compile_args=["-std=c++11", "-O3", "-fopenmp", "-fPIC"],
    )
]

setup(
    name="py_foo",
    py_modules=["py_foo_imp"],
    version="0.1",
    ext_modules=cythonize(extensions,compiler_directives={'language_level': "3"}),
    install_requires=['numpy',],
    include_package_data=True,
    zip_safe=False,
)
