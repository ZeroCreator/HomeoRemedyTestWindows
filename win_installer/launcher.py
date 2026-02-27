"""
HomeoRemedyTest Windows Launcher
This script launches the Flask application in a browser
"""

import os
import sys
import webbrowser
import threading
import socket
from pathlib import Path

# Add the application directory to path
if getattr(sys, 'frozen', False):
    # Running as compiled executable
    application_path = sys._MEIPASS
    is_frozen = True
else:
    # Running as script
    application_path = Path(__file__).parent.parent.resolve()
    is_frozen = False

# Change to application directory
os.chdir(application_path)

# Import Flask app
if is_frozen:
    # When frozen, app is in the same directory
    sys.path.insert(0, application_path)

from app import app

def find_free_port():
    """Find a free port on localhost"""
    with socket.socket(socket.AF_INET, socket.SOCK_STREAM) as s:
        s.bind(('localhost', 0))
        s.listen(1)
        port = s.getsockname()[1]
    return port

def open_browser(port):
    """Open browser after a short delay"""
    import time
    time.sleep(1.5)  # Wait for server to start
    webbrowser.open(f'http://localhost:{port}')

def main():
    """Main entry point"""
    print("=" * 60)
    print("HomeoRemedyTest - Приложение для тестирования по гомеопатии")
    print("=" * 60)
    print()
    
    # Find a free port
    port = find_free_port()
    print(f"🚀 Запуск сервера на порту {port}...")
    print()
    print(f"📱 Откройте браузер: http://localhost:{port}")
    print()
    print("💡 Нажмите Ctrl+C для остановки сервера")
    print("=" * 60)
    print()
    
    # Open browser in a separate thread
    threading.Thread(target=open_browser, args=(port), daemon=True).start()
    
    # Run the Flask app
    # Disable reloader to avoid duplicate processes
    app.run(
        host='localhost',
        port=port,
        debug=False,
        use_reloader=False,
        threaded=True
    )

if __name__ == '__main__':
    main()
