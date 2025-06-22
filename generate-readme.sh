#!/bin/bash

# Скрипт для генерации оглавления в файле README.md
# на основе структуры директорий и файлов в 'articles/'.

# Функция для получения заголовка из markdown-файла.
# Принимает путь к файлу в качестве аргумента.
# Читает первую строку файла и удаляет символы '# '.
function get_title_from_file() {
    head -n 1 "$1" | sed 's/^# *//;s/[[:space:]]*$//'
}

# Инициализация переменной для оглавления (Table of Contents).
TOC="## Оглавление\n"

# Исходное содержимое для README.md, если файл не существует или пуст.
# Это гарантирует, что у файла всегда будет базовый заголовок.
README_HEADER="# FrontendCompetencies\n\n## Сборник статей по компетенциям фронтенд разработки\n\nСтатьи представлены в формате markdown.\nЕсть отдельный web ui проект [FrontendAssesmentUI](https://github.com/FrontendKnowledgeBase/FrontendAssesmentUI) для удобного просмотра."

# Получаем содержимое README.md до строки '## Оглавление'.
# Если эта строка отсутствует, используется содержимое всего файла.
# Если файл пуст или не существует, используется README_HEADER.
if [ -s README.md ]; then
    README_CONTENT=$(sed '/## Оглавление/Q' README.md)
else
    README_CONTENT="$README_HEADER"
fi

# Счетчик для нумерации разделов в оглавлении.
i=1

# Итерация по каждой директории в 'articles/', отсортированной по имени.
for D in $(ls -v articles); do
    # Формируем путь к файлу с заголовком раздела.
    SECTION_TITLE_FILE="articles/$D/0_*.md"
    
    # Получаем заголовок раздела из файла '0_*.md'.
    SECTION_TITLE=$(get_title_from_file $SECTION_TITLE_FILE)

    # Добавляем заголовок раздела в оглавление.
    TOC+=$(echo -e "\n### $i. $SECTION_TITLE")

    # Итерация по всем markdown-файлам в директории, исключая файл '0_*.md'.
    for F in $(ls -v "articles/$D" | grep -v '0_'); do
        FILE_PATH="articles/$D/$F"
        
        # Получаем заголовок статьи из файла.
        ARTICLE_TITLE=$(get_title_from_file "$FILE_PATH")
        
        # Добавляем отформатированную ссылку на статью в оглавление.
        TOC+=$(echo -e "\n- [$ARTICLE_TITLE](./$FILE_PATH)")
    done
    i=$((i+1))
done

# Записываем обновленное содержимое в README.md.
echo -e "$README_CONTENT\n\n$TOC" > README.md

echo "README.md был успешно обновлен." 