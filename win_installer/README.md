# HomeoRemedyTest - Windows Build Tools

Эта папка содержит инструменты для сборки Windows-установщика.

## Быстрый старт

### Сборка executable:
```bash
build.bat
```

### Создание установщика (требуется Inno Setup):
```bash
build_installer.bat
```

## Файлы

| Файл | Описание |
|------|----------|
| `build.bat` | Сборка executable с помощью PyInstaller |
| `build_installer.bat` | Создание Windows `.exe` установщика |
| `run.bat` | Быстрый запуск без сборки |
| `homeoremedytest.spec` | Конфигурация PyInstaller |
| `homeoremedytest_installer.iss` | Скрипт Inno Setup |
| `launcher.py` | Лаунчер приложения |

## Требования

- Python 3.10+
- Inno Setup 6 (для создания установщика)

## Документация

Полная документация находится в [корневом README](../README.md).
