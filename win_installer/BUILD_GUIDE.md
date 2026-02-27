# HomeoRemedyTest - Полное руководство по сборке для Windows

## 📋 Оглавление

1. [Требования](#требования)
2. [Быстрая сборка](#быстрая-сборка)
3. [Пошаговая инструкция](#пошаговая-инструкция)
4. [Создание установщика](#создание-установщика)
5. [Настройка и кастомизация](#настройка-и-кастомизация)
6. [Решение проблем](#решение-проблем)

---

## Требования

### Обязательные:
- **Python 3.10+** - https://www.python.org/downloads/
- **Windows 10/11** (64-бит)
- **2 ГБ ОЗУ** минимум
- **200 МБ** свободного места на диске

### Опциональные (для создания установщика):
- **Inno Setup 6** - https://jrsoftware.org/isdl.php#stable
- **Git** - https://git-scm.com/download/win

---

## Быстрая сборка

### 1. Откройте командную строку в папке проекта:

```bash
cd HomeoRemedyTest\win_installer
```

### 2. Запустите скрипт сборки:

```bash
build.bat
```

### 3. Готово!

Executable файл находится в: `dist\HomeoRemedyTest\HomeoRemedyTest.exe`

---

## Пошаговая инструкция

### Шаг 1: Установка Python

1. Скачайте Python 3.10 или выше с https://www.python.org/downloads/
2. Запустите установщик
3. ✅ **ВАЖНО**: Отметьте галочку "Add Python to PATH"
4. Нажмите "Install Now"

**Проверка установки:**
```bash
python --version
```
Должно показать: `Python 3.10.x` или выше

### Шаг 2: Подготовка проекта

```bash
# Если используете Git
git clone https://github.com/zerocreator/HomeoRemedyTest.git
cd HomeoRemedyTest

# Или перейдите в папку с распакованным проектом
cd HomeoRemedyTest\win_installer
```

### Шаг 3: Установка зависимостей

Скрипт `build.bat` автоматически установит все зависимости.

Или вручную:
```bash
# Создание виртуального окружения
python -m venv venv

# Активация виртуального окружения
venv\Scripts\activate

# Установка зависимостей
pip install -r requirements.txt
pip install pyinstaller==6.11.1
```

### Шаг 4: Сборка executable

```bash
# Запуск сборки
pyinstaller homeoremedytest.spec --clean
```

Или используйте готовый скрипт:
```bash
build.bat
```

**Время сборки:** 2-5 минут

**Результат:** `dist\HomeoRemedyTest\HomeoRemedyTest.exe`

### Шаг 5: Тестирование

```bash
# Запуск приложения
dist\HomeoRemedyTest\HomeoRemedyTest.exe
```

Приложение должно открыться в браузере по умолчанию.

---

## Создание установщика

### Шаг 1: Установка Inno Setup

1. Скачайте с https://jrsoftware.org/isdl.php#stable
2. Установите в папку по умолчанию: `C:\Program Files (x86)\Inno Setup 6\`

### Шаг 2: Сборка executable

Сначала убедитесь, что executable файл собран:
```bash
build.bat
```

### Шаг 3: Создание установщика

```bash
build_installer.bat
```

**Результат:** `Output\HomeoRemedyTest-Setup.exe`

### Шаг 4: Тестирование установщика

1. Запустите `HomeoRemedyTest-Setup.exe`
2. Следуйте инструкциям мастера
3. Проверьте, что приложение запускается

---

## Настройка и кастомизация

### Изменение версии

**Файл:** `version_info.py`

```python
VERSION = "1.0.1"  # Новая версия
```

### Изменение иконки приложения

1. Создайте файл иконки `icon.ico` (размеры: 256x256, 128x128, 64x64, 32x32, 16x16)
2. Положите в корневую папку проекта
3. В `homeoremedytest.spec` измените:
   ```python
   icon='icon.ico'  # Раскомментируйте и укажите путь
   ```

### Настройка установщика

**Файл:** `homeoremedytest_installer.iss`

```iss
; Основная информация
#define MyAppName "HomeoRemedyTest"
#define MyAppVersion "1.0.0"
#define MyAppPublisher "Ваше имя"
#define MyAppURL "https://ваш-сайт.com"

; Настройки установки
DefaultDirName={autopf}\{#MyAppName}  ; Папка установки
DefaultGroupName={#MyAppName}          ; Группа в меню Пуск

; Языки
Name: "russian"; MessagesFile: "compiler:Languages\Russian.isl"
Name: "english"; MessagesFile: "compiler:Default.isl"
```

### Изменение текста приветствия

Откройте `launcher.py` и измените текст в функции `main()`:

```python
print("=" * 60)
print("Ваше название приложения")
print("=" * 60)
```

### Настройка порта по умолчанию

В `launcher.py` измените функцию `find_free_port()` или установите фиксированный порт:

```python
port = 5001  # Фиксированный порт
```

---

## Решение проблем

### ❌ Ошибка: "Python not found"

**Решение:**
1. Установите Python с https://www.python.org/downloads/
2. При установке отметьте "Add Python to PATH"
3. Перезапустите командную строку

### ❌ Ошибка: "No module named 'flask'"

**Решение:**
```bash
venv\Scripts\activate
pip install -r requirements.txt
```

### ❌ Ошибка при сборке: "module not found"

**Решение:**
1. Убедитесь, что все зависимости установлены
2. Проверьте `homeoremedytest.spec` на наличие всех импортов
3. Добавьте недостающие модули в `hiddenimports`

### ❌ Ошибка: "Inno Setup not found"

**Решение:**
1. Установите Inno Setup 6
2. Или измените путь в `build_installer.bat`:
   ```batch
   set "INNO_SETUP=C:\Путь\К\Inno\Setup\ISCC.exe"
   ```

### ❌ Приложение не открывается в браузере

**Решение:**
1. Проверьте брандмауэр Windows
2. Откройте браузер вручную и перейдите на `http://localhost:5001`
3. Проверьте консоль на наличие ошибок

### ❌ Порт 5001 занят

**Решение:**
Приложение автоматически найдёт свободный порт. Или установите фиксированный порт в `launcher.py`.

### ❌ Слишком большой размер executable

**Оптимизация:**
1. В `homeoremedytest.spec` измените `upx=True` на `upx=False` (может уменьшить совместимость)
2. Исключите ненужные модули в секции `excludes`

### ❌ Антивирус блокирует приложение

**Решение:**
1. Добавьте папку с приложением в исключения
2. Подпишите приложение цифровой подписью (для распространения)

---

## Автоматизация сборки (CI/CD)

### GitHub Actions workflow

Создайте файл `.github/workflows/build-windows.yml`:

```yaml
name: Build Windows Installer

on:
  push:
    tags:
      - 'v*'

jobs:
  build:
    runs-on: windows-latest
    
    steps:
    - uses: actions/checkout@v3
    
    - name: Set up Python
      uses: actions/setup-python@v4
      with:
        python-version: '3.11'
    
    - name: Install dependencies
      run: |
        cd win_installer
        python -m pip install --upgrade pip
        pip install -r requirements.txt
        pip install pyinstaller==6.11.1
    
    - name: Build executable
      run: |
        cd win_installer
        pyinstaller homeoremedytest.spec
    
    - name: Upload artifact
      uses: actions/upload-artifact@v3
      with:
        name: HomeoRemedyTest
        path: win_installer/dist/HomeoRemedyTest
```

---

## Контрольный список перед релизом

- [ ] Все тесты проходят
- [ ] Версия обновлена в `version_info.py`
- [ ] Версия обновлена в `homeoremedytest_installer.iss`
- [ ] Executable файл собран
- [ ] Установщик создан
- [ ] Приложение тестируется на чистой Windows
- [ ] Документация обновлена
- [ ] CHANGELOG обновлён

---

## Дополнительные ресурсы

- **PyInstaller Documentation**: https://pyinstaller.org/en/stable/
- **Inno Setup Documentation**: https://jrsoftware.org/ishelp/
- **Flask Documentation**: https://flask.palletsprojects.com/

---

## Поддержка

- **GitHub Issues**: https://github.com/zerocreator/HomeoRemedyTest/issues
- **Email**: shkola.olga@gmail.com
- **Документация**: https://zerocreator.github.io/homeoremedytest/

---

**Версия руководства**: 1.0.0  
**Дата обновления**: 2024
