# -*- mode: python ; coding: utf-8 -*-

"""
PyInstaller spec file for HomeoRemedyTest
Build command: pyinstaller homeoremedytest.spec
"""

import os
import sys
from pathlib import Path

# Project root directory
block_cipher = None
project_root = Path(__file__).parent.parent.resolve()

# Collect all data files and templates
datas = []

# Add templates folder
templates_dir = project_root / 'templates'
if templates_dir.exists():
    datas.append((str(templates_dir), 'templates'))

# Add public/static folder
static_dir = project_root / 'public' / 'static'
if static_dir.exists():
    datas.append((str(static_dir), 'public/static'))

# Add data folder (for default data)
data_dir = project_root / 'data'
if data_dir.exists():
    # Only include example/test data files, not user data
    for json_file in data_dir.glob('*.json'):
        datas.append((str(json_file), 'data'))

# Add docs folder
docs_dir = project_root / 'docs'
if docs_dir.exists():
    datas.append((str(docs_dir), 'docs'))

# Add backup manager and other modules
for py_file in project_root.glob('*.py'):
    if py_file.name not in ['app.py', 'wsgi.py']:
        datas.append((str(py_file), '.'))

# Add .env.example if exists
env_example = project_root / '.env.example'
if env_example.exists():
    datas.append((str(env_example), '.'))

# Add README
readme_file = project_root / 'README.md'
if readme_file.exists():
    datas.append((str(readme_file), '.'))

# Add requirements
requirements_file = project_root / 'requirements.txt'
if requirements_file.exists():
    datas.append((str(requirements_file), '.'))

# Excel utils folder
excel_utils_dir = project_root / 'excel_utils'
if excel_utils_dir.exists():
    datas.append((str(excel_utils_dir), 'excel_utils'))

# Storage folder
storage_dir = project_root / 'storage'
if storage_dir.exists():
    datas.append((str(storage_dir), 'storage'))

a = Analysis(
    [str(project_root / 'app.py')],
    pathex=[],
    binaries=[],
    datas=datas,
    hiddenimports=[
        'flask',
        'werkzeug',
        'openpyxl',
        'dotenv',
        'requests',
        'dateutil',
        'psutil',
        'jinja2',
        'markupsafe',
        'werkzeug.serving',
        'werkzeug.debug',
    ],
    hookspath=[],
    hooksconfig={},
    runtime_hooks=[],
    excludes=[],
    win_no_prefer_redirects=False,
    win_private_assemblies=False,
    cipher=block_cipher,
    noarchive=False,
)

pyz = PYZ(a.pure, a.zipped_data, cipher=block_cipher)

exe = EXE(
    pyz,
    a.scripts,
    [],
    exclude_binaries=True,
    name='HomeoRemedyTest',
    debug=False,
    bootloader_ignore_signals=False,
    strip=False,
    upx=True,
    console=False,  # Set to True for debugging
    disable_windowed_traceback=False,
    argv_emulation=False,
    target_arch=None,
    codesign_identity=None,
    entitlements_file=None,
    icon=None,  # Add icon path here if you have one: icon='icon.ico'
)

coll = COLLECT(
    exe,
    a.binaries,
    a.zipfiles,
    a.datas,
    strip=False,
    upx=True,
    upx_exclude=[],
    name='HomeoRemedyTest',
)

# Create app folder for distribution
# app = BUNDLE(
#     coll,
#     name='HomeoRemedyTest.exe',
#     icon=None,
#     version=None,
# )
