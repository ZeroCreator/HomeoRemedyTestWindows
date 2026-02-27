"""
Version information for HomeoRemedyTest Windows Installer
"""

from pathlib import Path

# Read version from a file or set it here
VERSION = "1.0.0"
VERSION_INFO = {
    'CompanyName': 'zerocreator',
    'FileDescription': 'HomeoRemedyTest - Приложение для тестирования знаний по гомеопатии',
    'FileVersion': VERSION,
    'InternalName': 'HomeoRemedyTest',
    'LegalCopyright': '© 2024 zerocreator. All rights reserved.',
    'OriginalFilename': 'HomeoRemedyTest.exe',
    'ProductName': 'HomeoRemedyTest',
    'ProductVersion': VERSION,
}

def get_version_info():
    return VERSION_INFO

if __name__ == '__main__':
    print(f"HomeoRemedyTest Version: {VERSION}")
