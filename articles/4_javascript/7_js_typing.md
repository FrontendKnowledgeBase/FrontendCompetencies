# Типизация в JavaScript: JSDoc, TypeScript (type, generics, guards, infer)

JavaScript, изначально созданный как динамически типизированный язык, часто нуждается в дополнительных инструментах для работы с типами. В этой статье рассмотрим инструменты типизации, такие как **JSDoc**, **TypeScript**, и ключевые концепции: типы, дженерики, type guards и infer.

## 1. JSDoc

### Что такое JSDoc?
**JSDoc** — это стандарт документирования JavaScript-кода, который позволяет указывать типы переменных и функций прямо в комментариях.

### Пример использования
```javascript
/**
 * Вычисляет сумму двух чисел.
 * @param {number} a - Первое число.
 * @param {number} b - Второе число.
 * @returns {number} Сумма чисел.
 */
function add(a, b) {
  return a + b;
}

console.log(add(2, 3)); // 5
```

### Преимущества
- Удобство документирования.
- Интеграция с IDE для предоставления подсказок.
- Улучшение читаемости кода.

---

## 2. TypeScript

**TypeScript** — это надмножество JavaScript, которое добавляет строгую типизацию и расширенные возможности для работы с типами.

### Пример базового типа
```typescript
let age: number = 25;
let name: string = 'John';
let isActive: boolean = true;
```

---

### 2.1 Типы в TypeScript

#### Примитивные типы
- **number**: Числа.
- **string**: Строки.
- **boolean**: Логические значения.
- **null** и **undefined**.
- **any**: Любой тип (не рекомендуется использовать).

#### Составные типы
1. **Union (объединение)**:
```typescript
let value: number | string;
value = 42;
value = 'Hello';
```

2. **Literal (литеральный тип)**:
```typescript
let direction: 'up' | 'down';
direction = 'up';
```

3. **Tuple (кортеж)**:
```typescript
let tuple: [string, number];
tuple = ['age', 30];
```

4. **Enum**:
```typescript
enum Status {
  Active,
  Inactive,
  Pending
}
let userStatus: Status = Status.Active;
```

---

### 2.2 Дженерики (Generics)

Дженерики позволяют создавать компоненты, которые работают с различными типами данных, сохраняя строгую типизацию.

#### Пример:
```typescript
function identity<T>(value: T): T {
  return value;
}

console.log(identity<number>(42)); // 42
console.log(identity<string>('Hello')); // 'Hello'
```

#### Использование с массивами
```typescript
function getFirst<T>(arr: T[]): T {
  return arr[0];
}
console.log(getFirst<number>([1, 2, 3])); // 1
```

---

### 2.3 Type Guards (Проверки типов)

Type Guards — это функции, которые проверяют, относится ли значение к определённому типу.

#### Пример с `typeof`:
```typescript
function isString(value: unknown): value is string {
  return typeof value === 'string';
}

const value: unknown = 'Hello';
if (isString(value)) {
  console.log(value.toUpperCase()); // 'HELLO'
}
```

#### Пример с `instanceof`:
```typescript
class Animal {}
class Dog extends Animal {}

function isDog(animal: Animal): animal is Dog {
  return animal instanceof Dog;
}
```

---

### 2.4 Infer (Выведение типов)

`infer` используется в TypeScript для извлечения типов внутри условных типов.

#### Пример:
```typescript
type ReturnType<T> = T extends (...args: any[]) => infer R ? R : never;

function getUser(): { name: string; age: number } {
  return { name: 'John', age: 25 };
}

type UserType = ReturnType<typeof getUser>;
// UserType будет { name: string; age: number }
```

---

## Итоговые вопросы для подготовки

1. Чем отличается JSDoc от TypeScript?
2. Какие типы поддерживает TypeScript?
3. Как работают дженерики?
4. Что такое Type Guards, и как их использовать?
5. Для чего используется `infer`?

**Совет:** Попробуйте реализовать свои примеры с использованием JSDoc и TypeScript, чтобы понять, как они упрощают работу с типами.

