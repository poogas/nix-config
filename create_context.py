import os

def get_repo_context(repo_path, output_file='repo_context.txt', ignore_list=None):
    """
    Собирает структуру и содержимое репозитория в один текстовый файл.

    :param repo_path: Путь к директории репозитория.
    :param output_file: Имя файла для вывода.
    :param ignore_list: Список файлов и папок для игнорирования.
    """
    if ignore_list is None:
        ignore_list = [
            '.git', '.vscode', '__pycache__', 'node_modules', 'dist', 'build',
            '.DS_Store', '*.pyc', '*.log', '*.tmp', '*.swp', 'assets' 
        ]

    with open(output_file, 'w', encoding='utf-8') as f:
        f.write(f"Структура репозитория по пути: {os.path.abspath(repo_path)}\n\n")

        # Сначала записываем структуру директорий
        f.write("Структура директорий:\n")
        for root, dirs, files in os.walk(repo_path):
            # Исключаем папки из ignore_list
            dirs[:] = [d for d in dirs if d not in ignore_list]
            
            level = root.replace(repo_path, '').count(os.sep)
            indent = ' ' * 4 * level
            f.write(f"{indent}📂 {os.path.basename(root)}/\n")
            
            sub_indent = ' ' * 4 * (level + 1)
            for file in files:
                if file not in ignore_list:
                    f.write(f"{sub_indent}📄 {file}\n")
        
        f.write("\n" + "="*80 + "\n\n")
        f.write("Содержимое файлов:\n\n")

        # Затем записываем содержимое каждого файла
        for root, dirs, files in os.walk(repo_path):
            # Снова исключаем папки
            dirs[:] = [d for d in dirs if d not in ignore_list]

            for file in files:
                if file in ignore_list:
                    continue

                file_path = os.path.join(root, file)
                relative_path = os.path.relpath(file_path, repo_path)
                
                f.write(f"--- Начинается файл: {relative_path} ---\n\n")
                try:
                    with open(file_path, 'r', encoding='utf-8', errors='ignore') as content_file:
                        f.write(content_file.read())
                except Exception as e:
                    f.write(f"Не удалось прочитать файл: {e}\n")
                f.write(f"\n--- Заканчивается файл: {relative_path} ---\n\n")

    print(f"Контекст репозитория успешно записан в файл: {output_file}")

if __name__ == '__main__':
    # Укажите путь к вашему репозиторию здесь
    # Например: '/Users/username/projects/my-awesome-project' или 'C:\\Users\\username\\Documents\\my-project'
    # Если скрипт находится в корне репозитория, можно использовать '.'
    path_to_repo = '.' 
    get_repo_context(path_to_repo)
