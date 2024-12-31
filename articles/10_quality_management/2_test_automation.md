# Автоматизация тестирования

Автоматизация тестирования помогает ускорить процесс проверки качества программного обеспечения, уменьшить количество ручной работы и обеспечить повторяемость тестов. Это ключевой аспект современных практик разработки, включая CI/CD.

---

## 1. Что такое автоматизация тестирования?

### Основные цели
- Снижение трудозатрат на выполнение рутинных тестов.
- Обеспечение стабильности кода при частых изменениях.
- Ускорение выпуска продукта за счёт быстрого обнаружения ошибок.

### Преимущества
- Быстрое выполнение тестов.
- Уменьшение человеческих ошибок.
- Легкость повторного запуска тестов.

---

## 2. Типы автоматизированных тестов

### 2.1 Unit-тесты
- Проверяют отдельные функции или модули.
- Быстрые и легко воспроизводимые.

#### Пример (Jest)
```javascript
function sum(a, b) {
  return a + b;
}

test('adds 1 + 2 to equal 3', () => {
  expect(sum(1, 2)).toBe(3);
});
```

### 2.2 Интеграционные тесты
- Проверяют взаимодействие между модулями.
- Обнаруживают проблемы интеграции.

#### Пример (Postman)
- Тест API на возврат корректного статуса и данных:
```json
{
  "info": {
    "name": "Integration Test",
    "schema": "https://schema.getpostman.com/json/collection/v2.1.0/collection.json"
  },
  "item": [
    {
      "name": "Test GET /users",
      "request": {
        "method": "GET",
        "url": "https://api.example.com/users"
      },
      "response": []
    }
  ]
}
```

### 2.3 End-to-End тесты
- Проверяют полные сценарии работы системы с точки зрения пользователя.

#### Пример (Cypress)
```javascript
describe('Login Test', () => {
  it('Should login successfully', () => {
    cy.visit('/login');
    cy.get('input[name="username"]').type('testuser');
    cy.get('input[name="password"]').type('password');
    cy.get('button[type="submit"]').click();
    cy.url().should('include', '/dashboard');
  });
});
```

---

## 3. Инструменты автоматизации

### 3.1 Для unit-тестов
- **Jest** (JavaScript/TypeScript).
- **JUnit** (Java).
- **NUnit** (.NET).

### 3.2 Для интеграционных тестов
- **Postman**.
- **SoapUI**.

### 3.3 Для E2E тестов
- **Cypress**.
- **Playwright**.
- **Selenium**.

---

## 4. Внедрение автоматизации в процесс разработки

### Основные шаги
1. Определение областей, которые можно автоматизировать (регрессия, критические функции).
2. Настройка тестового окружения.
3. Интеграция автоматизированных тестов в CI/CD пайплайн.

### Пример интеграции с CI/CD (GitHub Actions)
```yaml
name: Run Automated Tests

on:
  push:
    branches:
      - main

jobs:
  test:
    runs-on: ubuntu-latest

    steps:
      - name: Checkout code
        uses: actions/checkout@v3

      - name: Install dependencies
        run: npm install

      - name: Run tests
        run: npm test
```

---

## 5. Хорошие практики автоматизации тестирования

### 5.1 Принципы
- **DRY**: Не повторяйте код тестов.
- **Модульность**: Разделяйте тесты по уровням (unit, integration, e2e).
- **Детализация отчётов**: Логируйте результаты тестов.

### 5.2 Избегайте
- Чрезмерной зависимости от mock-данных.
- Автоматизации редко используемых сценариев.

---

## Итоговые вопросы для подготовки

1. Чем отличаются unit, integration и e2e тесты?
2. Какие инструменты подходят для каждого типа тестов?
3. Как настроить автоматизацию тестов в CI/CD?
4. Какие преимущества и ограничения имеет автоматизация тестирования?
5. Какие хорошие практики автоматизации вы знаете?

**Совет:** Начните с автоматизации критически важных сценариев, затем постепенно увеличивайте покрытие тестами.
