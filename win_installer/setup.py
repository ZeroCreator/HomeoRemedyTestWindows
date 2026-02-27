"""
HomeoRemedyTest Windows Application
Flask-based homeopathy testing application
"""

from setuptools import setup, find_packages
from pathlib import Path

# Read README for long description
readme_path = Path(__file__).parent / "README.md"
long_description = ""
if readme_path.exists():
    long_description = readme_path.read_text(encoding="utf-8")

# Read requirements
requirements_path = Path(__file__).parent / "requirements.txt"
requirements = []
if requirements_path.exists():
    requirements = [
        line.strip() 
        for line in requirements_path.read_text().splitlines() 
        if line.strip() and not line.startswith("#")
    ]

setup(
    name="HomeoRemedyTest",
    version="1.0.0",
    author="zerocreator",
    author_email="shkola.olga@gmail.com",
    description="Приложение для тестирования знаний по гомеопатии",
    long_description=long_description,
    long_description_content_type="text/markdown",
    url="https://github.com/zerocreator/HomeoRemedyTest",
    packages=find_packages(),
    classifiers=[
        "Development Status :: 4 - Beta",
        "Intended Audience :: Education",
        "Topic :: Education :: Testing",
        "Programming Language :: Python :: 3",
        "Programming Language :: Python :: 3.10",
        "Programming Language :: Python :: 3.11",
        "Programming Language :: Python :: 3.12",
        "Operating System :: Microsoft :: Windows",
    ],
    python_requires=">=3.10",
    install_requires=requirements,
    entry_points={
        "console_scripts": [
            "homeoremedytest=app:main",
        ],
    },
    include_package_data=True,
    package_data={
        "": ["*.html", "*.css", "*.js", "*.json", "*.md", "*.txt"],
    },
)
