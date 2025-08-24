
import os

# --- НАСТРОЙКИ ---

# 1. Путь к директории вашего проекта. Точка '.' означает текущую директорию,
#    где будет запущен скрипт.
ROOT_DIRECTORY = '.'

# 2. Имя файла, в который будет сохранен результат.
OUTPUT_FILENAME = 'nix-config.txt'

# 3. Список директорий, которые нужно проигнорировать.
EXCLUDE_DIRS = {
    '.git',
    '.vscode',
    '__pycache__',
    'node_modules',
    'venv',
    '.idea',
    'dist',
    'build'
}

# 4. Список файлов, которые нужно проигнорировать.
EXCLUDE_FILES = {
    '.gitignore',
    'package-lock.json',
    'yarn.lock',
    '.env',
    OUTPUT_FILENAME  # Исключаем сам выходной файл
}

# 5. Список расширений файлов, которые нужно проигнорировать (в основном бинарные файлы).
EXCLUDE_EXTENSIONS = {
    '.pyc',
    '.pyo',
    '.pyd',
    '.so',
    '.dll',
    '.exe',
    '.o',
    '.a',
    '.jpg',
    '.jpeg',
    '.png',
    '.gif',
    '.bmp',
    '.tiff',
    '.ico',
    '.svg',
    '.zip',
    '.tar',
    '.gz',
    '.rar',
    '.pdf',
    '.doc',
    '.docx',
    '.xls',
    '.xlsx',
    '.ppt',
    '.pptx',
    '.odt',
    '.ods',
    '.odp',
    '.mp3',
    '.mp4',
    '.avi',
    '.mov',
    '.wav',
    '.flac',
    '.db',
    '.sqlite3'
}

# --- ОСНОВНОЙ КОД СКРИПТА ---

def create_repository_snapshot():
    """
    Рекурсивно обходит директорию проекта и создает единый текстовый файл
    с путями и содержимым всех неисключенных файлов.
    """
    # Открываем файл для записи с кодировкой UTF-8
    with open(OUTPUT_FILENAME, 'w', encoding='utf-8') as outfile:
        # Рекурсивно обходим все директории и файлы
        for dirpath, dirnames, filenames in os.walk(ROOT_DIRECTORY, topdown=True):
            # Исключаем ненужные директории из дальнейшего обхода
            # Мы изменяем список dirnames "на лету", чтобы os.walk не заходил в них
            dirnames[:] = [d for d in dirnames if d not in EXCLUDE_DIRS]

            for filename in filenames:
                # Пропускаем файлы по имени или расширению
                if filename in EXCLUDE_FILES:
                    continue
                
                file_extension = os.path.splitext(filename)[1]
                if file_extension in EXCLUDE_EXTENSIONS:
                    continue

                full_path = os.path.join(dirpath, filename)
                
                # Получаем относительный путь для красивого вывода
                relative_path = os.path.relpath(full_path, ROOT_DIRECTORY)

                # Записываем заголовок с путем к файлу
                header = f"--- Файл: {relative_path.replace(os.sep, '/')} ---\n\n"
                outfile.write(header)

                try:
                    # Читаем содержимое файла и записываем его
                    with open(full_path, 'r', encoding='utf-8', errors='ignore') as infile:
                        outfile.write(infile.read())
                    # Добавляем отступы для разделения файлов
                    outfile.write('\n\n' + '='*80 + '\n\n')
                except Exception as e:
                    outfile.write(f"Не удалось прочитать файл. Ошибка: {e}\n")
                    outfile.write('\n\n' + '='*80 + '\n\n')

    print(f"Готово! Снимок репозитория успешно сохранен в файл: {OUTPUT_FILENAME}")

if __name__ == '__main__':
    create_repository_snapshot()
