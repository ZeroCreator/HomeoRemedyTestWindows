# HomeoRemedyTest - Windows Installer

## 📦 Создание установщика для Windows

Эта папка содержит все необходимые файлы для создания Windows-установщика приложения HomeoRemedyTest.

---

## 🚀 Быстрый старт

### Для пользователей (готовый установщик)

Если у вас уже есть файл `HomeoRemedyTest-Setup.exe`:
1. Запустите установщик от имени администратора
2. Следуйте инструкциям мастера установки
3. Запустите приложение из меню Пуск

### Для разработчиков (сборка установщика)

#### Требования:
- Python 3.10 или выше
- Git (опционально)
- Inno Setup 6 (для создания .exe установщика)

#### Шаг 1: Подготовка

Откройте командную строку (cmd) или PowerShell в этой папке:

```bash
cd win_installer
```

#### Шаг 2: Сборка executable файла

```bash
build.bat
```

Этот скрипт:
- Создаст виртуальное окружение (`venv`)
- Установит все зависимости
- Соберёт executable с помощью PyInstaller

Результат: `dist\HomeoRemedyTest\HomeoRemedyTest.exe`

#### Шаг 3: Создание установщика (опционально)

Установите Inno Setup: https://jrsoftware.org/isdl.php#stable

Затем запустите:

```bash
build_installer.bat
```

Результат: `Output\HomeoRemedyTest-Setup.exe`

---

## 📁 Файлы

| Файл | Описание |
|------|----------|
| `build.bat` | Основной скрипт сборки executable |
| `build_installer.bat` | Скрипт создания Windows-установщика |
| `run.bat` | Быстрый запуск без сборки (для тестирования) |
| `homeoremedytest.spec` | Конфигурация PyInstaller |
| `homeoremedytest_installer.iss` | Скрипт Inno Setup |
| `launcher.py` | Python-лаунчер для приложения |
| `setup.py` | Setup script для Python packaging |
| `version_info.py` | Информация о версии приложения |
| `requirements-windows.txt` | Зависимости для Windows |
| `INSTALL_WINDOWS.md` | Подробная инструкция по установке |

---

## 🔧 Настройки

### Изменение версии

Откройте `version_info.py` и измените:

```python
VERSION = "1.0.0"
```

### Изменение иконки

1. Создайте файл иконки `icon.ico` в корневой папке
2. В `homeoremedytest.spec` раскомментируйте строку:
   ```python
   icon='icon.ico'
   ```

### Настройка установщика

Откройте `homeoremedytest_installer.iss` и измените:

```iss
#define MyAppName "HomeoRemedyTest"
#define MyAppVersion "1.0.0"
#define MyAppPublisher "zerocreator"
```

---

## 🏗️ Процесс сборки

### Что делает build.bat:

1. ✅ Проверяет наличие Python
2. ✅ Создаёт виртуальное окружение
3. ✅ Устанавливает зависимости
4. ✅ Очищает предыдущие сборки
5. ✅ Запускает PyInstaller
6. ✅ Создаёт executable в папке `dist`

### Что делает build_installer.bat:

1. ✅ Проверяет наличие Inno Setup
2. ✅ Проверяет наличие собранного executable
3. ✅ Компилирует ISS скрипт
4. ✅ Создаёт установщик в папке `Output`

---

## 📊 Структура выходных файлов

```
win_installer/
├── dist/
│   └── HomeoRemedyTest/
│       ├── HomeoRemedyTest.exe    # Главное executable
│       ├── *.dll                   # Библиотеки
│       ├── templates/              # HTML шаблоны
│       ├── public/static/          # CSS, JS, изображения
│       └── data/                   # Примеры данных
├── build/                          # Временные файлы сборки
└── Output/
    └── HomeoRemedyTest-Setup.exe   # Установщик Windows
```

---

## 🐛 Решение проблем

### Ошибка: "Python not found"

Установите Python 3.10+ с https://www.python.org/downloads/
При установке отметьте "Add Python to PATH"

### Ошибка: "Inno Setup not found"

Установите Inno Setup 6:
- https://jrsoftware.org/isdl.php#stable
- Или измените путь в `build_installer.bat`

### Ошибка при сборке

1. Удалите папки `build` и `dist`
2. Удалите `venv`
3. Запустите `build.bat` заново

### Приложение не запускается

1. Запустите `run.bat` для проверки работы
2. Проверьте логи в консоли
3. Убедитесь, что все зависимости установлены

---

## 📝 Дополнительная документация

- [INSTALL_WINDOWS.md](INSTALL_WINDOWS.md) - Подробная инструкция для пользователей
- [../README.md](../README.md) - Основная документация проекта
- [../docs/](../docs/) - Документация приложения

---

## 📞 Поддержка

- **GitHub**: https://github.com/zerocreator/HomeoRemedyTest/issues
- **Email**: shkola.olga@gmail.com

---

## 📄 Лицензия

ДАННОЕ ПРОГРАММНОЕ ОБЕСПЕЧЕНИЕ ПРЕДОСТАВЛЯЕТСЯ ИСКЛЮЧИТЕЛЬНО ДЛЯ ОЗНАКОМЛЕНИЯ.
Подробнее в файле LICENSE.

---

**Версия**: 1.0.0 | **Дата**: 2024
