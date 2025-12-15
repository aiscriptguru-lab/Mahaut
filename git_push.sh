#!/bin/bash

# --- Настройки ---
REPO_URL="https://github.com/aiscriptguru-lab/Mahaut.git"  # твой репозиторий
BRANCH="main"                                               # ветка: master или main

# Проверяем аргумент коммита
if [ -z "$1" ]; then
  echo "Использование: ./git_push.sh \"Commit message\""
  exit 1
fi
COMMIT_MSG="$1"

# --- Команды Git ---
# Инициализация репозитория, если ещё не инициализирован
if [ ! -d ".git" ]; then
  git init
  git remote add origin "$REPO_URL"
fi

# Добавляем все изменения
git add .

# Делаем коммит
git commit -m "$COMMIT_MSG"

# Пушим на GitHub
echo "Пушим на $BRANCH..."
git push -u origin $BRANCH
