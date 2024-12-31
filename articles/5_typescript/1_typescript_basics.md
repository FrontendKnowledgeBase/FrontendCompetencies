# Основы TypeScript: типы, интерфейсы, generics

TypeScript расширяет JavaScript, добавляя строгую типизацию, что делает код более предсказуемым и поддерживаемым. В этой статье рассмотрим основные концепции: типы, интерфейсы и обобщения (generics).

---

## 1. Типы в TypeScript

### Основные типы
1. **Примитивные типы**:
   - `number`: Числа.
   - `string`: Строки.
   - `boolean`: Логические значения.
   - `null` и `undefined`.
   
   #### Пример
   ```typescript
   let age: number = 30;
   let name: string = "John";
   let isActive: boolean = true;
   ```

2. **Массивы**:
   - Используйте `type[]` или `Array<type>`.

   #### Пример
   ```typescript
   let numbers: number[] = [1, 2, 3];
   let strings: Array<string> = ["a", "b", "c"];
   ```

3. **Кортежи (Tuple)**:
   - Фиксированное количество элементов разного типа.

   #### Пример
   ```typescript
   let tuple: [string, number] = ["Alice", 25];
   ```

4. **Тип `any`**:
   - Может содержать значения любого типа. Рекомендуется использовать осторожно.

   #### Пример
   ```typescript
   let variable: any = "Hello";
   variable = 42;
   ```

5. **Тип `unknown`**:
   - Более безопасная альтернатива `any`, требует проверки типа перед использованием.

   #### Пример
   ```typescript
   let value: unknown = "Hello";
   if (typeof value === "string") {
     console.log(value.toUpperCase());
   }
   ```

---

## 2. Интерфейсы

### Что такое интерфейсы?
Интерфейсы определяют структуру объекта. Они помогают описывать форму данных и проверять их на этапе компиляции.

### Объявление интерфейсов
#### Пример
```typescript
interface User {
  id: number;
  name: string;
  email?: string; // необязательное свойство
}

const user: User = {
  id: 1,
  name: "Alice",
};
```

### Интерфейсы для функций
Интерфейсы также могут описывать функции.
#### Пример
```typescript
interface AddFunction {
  (a: number, b: number): number;
}

const add: AddFunction = (x, y) => x + y;
```

### Наследование интерфейсов
Интерфейсы можно расширять, чтобы описывать более сложные структуры.
#### Пример
```typescript
interface Person {
  name: string;
}

interface Employee extends Person {
  employeeId: number;
}

const employee: Employee = {
  name: "John",
  employeeId: 123,
};
```

---

## 3. Generics (Обобщения)

### Что такое generics?
Generics позволяют создавать компоненты, которые работают с разными типами данных, сохраняя строгую типизацию.

### Пример с функцией
```typescript
function identity<T>(value: T): T {
  return value;
}

console.log(identity<number>(42)); // 42
console.log(identity<string>("Hello")); // Hello
```

### Generics в интерфейсах
Интерфейсы могут быть обобщёнными.
#### Пример
```typescript
interface Box<T> {
  content: T;
}

const stringBox: Box<string> = { content: "Hello" };
const numberBox: Box<number> = { content: 42 };
```

### Ограничения типов (Type Constraints)
Generics можно ограничивать определённым типом.
#### Пример
```typescript
function getLength<T extends { length: number }>(value: T): number {
  return value.length;
}

console.log(getLength("Hello")); // 5
console.log(getLength([1, 2, 3])); // 3
```

---

## Итоговые вопросы для подготовки

1. Чем отличаются типы `any` и `unknown`?
2. Как объявить интерфейс с необязательными свойствами?
3. В чём преимущества использования generics?
4. Как использовать ограничения типов в generics?
5. Какие преимущества даёт использование интерфейсов?

**Совет:** Практикуйтесь с типами, интерфейсами и generics в небольших проектах, чтобы лучше понять их особенности и научиться эффективно применять в реальной разработке.

