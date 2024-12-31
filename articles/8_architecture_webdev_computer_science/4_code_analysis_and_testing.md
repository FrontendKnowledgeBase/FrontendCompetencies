# Интеграция статического анализа и тестирования кода: Linters, Formatters, Builds, Tests, Conventional Commits

Статический анализ и тестирование кода — ключевые практики для поддержания высокого качества проекта. Они помогают находить ошибки, стандартизировать код и автоматизировать процессы. В этой статье рассмотрим инструменты, подходы и принципы их интеграции.

## 1. Linters (Линтеры)

### Что такое линтеры?
Линтеры анализируют код, выявляя стилистические или синтаксические ошибки, не требующие запуска программы.

### Популярные линтеры
- **ESLint** (JavaScript/TypeScript): Проверка на соответствие стилям кода и правилам.
- **Stylelint** (CSS/SCSS): Анализ стилей.
- **Pylint** (Python): Проверка Python-кода.

### Пример настройки ESLint
1. Установите ESLint:
   ```bash
   npm install eslint --save-dev
   ```

2. Создайте конфигурационный файл:
   ```bash
   npx eslint --init
   ```

3. Пример `.eslintrc.json`:
   ```json
   {
     "env": {
       "browser": true,
       "es2021": true
     },
     "extends": "eslint:recommended",
     "parserOptions": {
       "ecmaVersion": 12,
       "sourceType": "module"
     },
     "rules": {
       "indent": ["error", 2],
       "quotes": ["error", "single"],
       "semi": ["error", "always"]
     }
   }
   ```

4. Запуск проверки:
   ```bash
   npx eslint .
   ```

---

## 2. Formatters (Форматтеры)

### Что это?
Форматтеры автоматически исправляют стиль кода в соответствии с заданными правилами.

### Популярные форматтеры
- **Prettier**: Форматирование JavaScript, HTML, CSS и других языков.
- **Black**: Форматирование Python-кода.

### Интеграция Prettier
1. Установка:
   ```bash
   npm install prettier --save-dev
   ```

2. Конфигурация (`.prettierrc`):
   ```json
   {
     "singleQuote": true,
     "semi": true,
     "tabWidth": 2
   }
   ```

3. Автоформатирование:
   ```bash
   npx prettier --write .
   ```

---

## 3. Builds (Сборка)

### Зачем нужны сборки?
Сборка объединяет ресурсы проекта (HTML, CSS, JS, изображения) для их оптимального выполнения в браузере или сервере.

### Популярные инструменты
- **Webpack**: Сборка модулей JavaScript.
- **Vite**: Быстрый инструмент для разработки и сборки.
- **Parcel**: Простая альтернатива Webpack.

### Пример настройки Webpack
1. Установка:
   ```bash
   npm install webpack webpack-cli --save-dev
   ```

2. Конфигурация (`webpack.config.js`):
   ```javascript
   const path = require('path');

   module.exports = {
     entry: './src/index.js',
     output: {
       filename: 'bundle.js',
       path: path.resolve(__dirname, 'dist')
     },
     mode: 'production'
   };
   ```

3. Запуск сборки:
   ```bash
   npx webpack
   ```

---

## 4. Tests (Тесты)

### Типы тестов
1. **Unit Tests** (модульные): Тестируют отдельные функции или компоненты.
2. **Integration Tests** (интеграционные): Проверяют взаимодействие между модулями.
3. **End-to-End Tests** (E2E): Тестируют весь поток приложения с точки зрения пользователя.

### Популярные библиотеки
- **Jest**: Модульное тестирование.
- **Cypress**: E2E тестирование.
- **Mocha**: Гибкая библиотека для тестов.

### Пример настройки Jest
1. Установка:
   ```bash
   npm install jest --save-dev
   ```

2. Конфигурация (`jest.config.js`):
   ```javascript
   module.exports = {
     testEnvironment: 'node',
   };
   ```

3. Пример теста:
   ```javascript
   // sum.js
   function sum(a, b) {
     return a + b;
   }
   module.exports = sum;

   // sum.test.js
   const sum = require('./sum');

   test('adds 1 + 2 to equal 3', () => {
     expect(sum(1, 2)).toBe(3);
   });
   ```

4. Запуск тестов:
   ```bash
   npx jest
   ```

---

## 5. Conventional Commits

### Что это?
**Conventional Commits** — это соглашение об именовании коммитов, которое улучшает читаемость истории изменений и автоматизацию.

### Пример формата коммитов
```plaintext
type(scope): краткое описание

[дополнительное описание]

BREAKING CHANGE: описание
```

### Основные типы
- **feat**: Добавление новой функциональности.
- **fix**: Исправление ошибок.
- **chore**: Обновления без изменения функционала (например, настройки).
- **docs**: Изменения в документации.

### Интеграция
1. Используйте **Commitlint** для проверки коммитов.
   ```bash
   npm install @commitlint/{config-conventional,cli} --save-dev
   ```

2. Конфигурация (`commitlint.config.js`):
   ```javascript
   module.exports = {
     extends: ['@commitlint/config-conventional'],
   };
   ```

---

## Итоговые вопросы для подготовки

1. Чем линтер отличается от форматтера?
2. Какие инструменты используются для сборки проекта?
3. Какие типы тестов бывают, и как они различаются?
4. Как Conventional Commits помогают в разработке?
5. Как настроить связку линтеров, тестов и сборки?

**Совет:** Интегрируйте все инструменты в CI/CD пайплайн, чтобы автоматизировать их выполнение при каждом коммите или пул-реквесте.

