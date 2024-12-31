# Настройка TypeScript: tsconfig.json, ESLint

TypeScript предоставляет гибкие возможности настройки через файл `tsconfig.json`. Совместное использование TypeScript с ESLint помогает соблюдать стиль кода и предотвращать ошибки. В этой статье рассмотрим, как настроить `tsconfig.json` и ESLint для TypeScript-проекта.

---

## 1. Настройка tsconfig.json

### Что такое tsconfig.json?
`tsconfig.json` — это конфигурационный файл, который указывает компилятору TypeScript, как обрабатывать код.

### Создание tsconfig.json
1. Выполните команду для инициализации:
   ```bash
   npx tsc --init
   ```
2. Пример базового файла:
   ```json
   {
     "compilerOptions": {
       "target": "ES6",
       "module": "commonjs",
       "strict": true,
       "esModuleInterop": true,
       "skipLibCheck": true,
       "outDir": "./dist",
       "rootDir": "./src"
     },
     "include": ["src/**/*"],
     "exclude": ["node_modules", "dist"]
   }
   ```

### Основные параметры
- **`target`**: Указывает версию JavaScript, в которую будет транслироваться TypeScript.
  ```json
  "target": "ES6"
  ```

- **`module`**: Указывает систему модулей (например, `commonjs`, `ESNext`).
  ```json
  "module": "commonjs"
  ```

- **`strict`**: Включает строгую типизацию.
  ```json
  "strict": true
  ```

- **`outDir`**: Указывает папку для скомпилированных файлов.
  ```json
  "outDir": "./dist"
  ```

- **`rootDir`**: Указывает корневую папку исходных файлов.
  ```json
  "rootDir": "./src"
  ```

- **`include` и `exclude`**: Определяют, какие файлы включать или исключать при компиляции.

### Полезные настройки для крупных проектов
- **`baseUrl` и `paths`**: Упрощают работу с модулями.
  ```json
  "baseUrl": "./src",
  "paths": {
    "@components/*": ["components/*"]
  }
  ```
- **`resolveJsonModule`**: Позволяет импортировать JSON-файлы.
  ```json
  "resolveJsonModule": true
  ```

---

## 2. Настройка ESLint для TypeScript

### Установка ESLint
1. Установите ESLint:
   ```bash
   npm install eslint --save-dev
   ```
2. Установите плагины для TypeScript:
   ```bash
   npm install @typescript-eslint/parser @typescript-eslint/eslint-plugin --save-dev
   ```

### Настройка .eslintrc.json
1. Создайте файл `.eslintrc.json`:
   ```bash
   npx eslint --init
   ```
2. Пример конфигурации для TypeScript:
   ```json
   {
     "env": {
       "browser": true,
       "es2021": true
     },
     "extends": [
       "eslint:recommended",
       "plugin:@typescript-eslint/recommended"
     ],
     "parser": "@typescript-eslint/parser",
     "parserOptions": {
       "ecmaVersion": 12,
       "sourceType": "module"
     },
     "plugins": ["@typescript-eslint"],
     "rules": {
       "@typescript-eslint/no-unused-vars": "warn",
       "@typescript-eslint/explicit-function-return-type": "off"
     }
   }
   ```

### Полезные правила
- **`@typescript-eslint/no-unused-vars`**: Предупреждает об неиспользуемых переменных.
- **`@typescript-eslint/no-explicit-any`**: Запрещает использование типа `any`.
- **`@typescript-eslint/explicit-module-boundary-types`**: Требует указывать возвращаемый тип функций.

---

## 3. Интеграция ESLint с Prettier

Prettier помогает автоматически форматировать код, а ESLint проверяет его стиль и соблюдение правил.

### Установка Prettier
```bash
npm install prettier eslint-config-prettier eslint-plugin-prettier --save-dev
```

### Обновление .eslintrc.json
Добавьте расширение Prettier:
```json
"extends": [
  "eslint:recommended",
  "plugin:@typescript-eslint/recommended",
  "plugin:prettier/recommended"
]
```

### Добавление .prettierrc.json
Создайте файл `.prettierrc.json` для настройки Prettier:
```json
{
  "singleQuote": true,
  "semi": true
}
```

---

## Итоговые вопросы для подготовки

1. Какие ключевые параметры стоит настроить в `tsconfig.json`?
2. Как настроить ESLint для работы с TypeScript?
3. Какие правила TypeScript полезны для соблюдения качества кода?
4. Зачем интегрировать ESLint с Prettier?
5. Какие преимущества даёт строгая настройка компилятора TypeScript?

**Совет:** Настройте `tsconfig.json` и ESLint в своём проекте, чтобы понять, как эти инструменты улучшают процесс разработки.

