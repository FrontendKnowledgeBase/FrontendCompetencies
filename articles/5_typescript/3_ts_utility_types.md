# Утилитарные типы в TypeScript: Pick, Omit, Partial

Утилитарные типы в TypeScript — это инструменты, которые позволяют модифицировать существующие типы для упрощения разработки и улучшения читаемости кода. Рассмотрим три наиболее часто используемых утилитарных типа: `Pick`, `Omit` и `Partial`.

---

## 1. Partial

### Что делает `Partial`?
`Partial` превращает все свойства типа в необязательные.

### Синтаксис
```typescript
Partial<Type>
```

### Пример использования
```typescript
interface User {
  id: number;
  name: string;
  email: string;
}

const updateUser = (user: Partial<User>): void => {
  console.log("User updated:", user);
};

updateUser({ name: "Alice" }); // Допустимо, так как все свойства стали необязательными
```

### Когда использовать?
- Когда нужно работать с частичными данными, например, при обновлении объектов.

---

## 2. Pick

### Что делает `Pick`?
`Pick` выбирает только указанные свойства из типа.

### Синтаксис
```typescript
Pick<Type, Keys>
```

### Пример использования
```typescript
interface User {
  id: number;
  name: string;
  email: string;
}

type UserPreview = Pick<User, "id" | "name">;

const user: UserPreview = {
  id: 1,
  name: "Alice",
};
```

### Когда использовать?
- Когда нужно создать новый тип, содержащий только определённые свойства из исходного.

---

## 3. Omit

### Что делает `Omit`?
`Omit` удаляет указанные свойства из типа.

### Синтаксис
```typescript
Omit<Type, Keys>
```

### Пример использования
```typescript
interface User {
  id: number;
  name: string;
  email: string;
}

type UserWithoutEmail = Omit<User, "email">;

const user: UserWithoutEmail = {
  id: 1,
  name: "Alice",
};
```

### Когда использовать?
- Когда нужно создать тип, исключив ненужные свойства из исходного.

---

## Сравнение утилитарных типов

| Тип    | Описание                                              | Пример использования                       |
|--------|------------------------------------------------------|--------------------------------------------|
| `Partial` | Делает все свойства необязательными                    | Обновление данных частично                |
| `Pick`    | Выбирает только указанные свойства                     | Создание упрощённого представления объекта |
| `Omit`    | Исключает указанные свойства                          | Исключение лишних данных                  |

---

## Итоговые вопросы для подготовки

1. Как `Partial` преобразует типы?
2. Чем `Pick` отличается от `Omit`?
3. Когда лучше использовать `Omit`, а когда `Pick`?
4. Какие преимущества дают утилитарные типы при работе с объектами?
5. Можете ли вы привести пример использования всех трёх типов в одном проекте?

**Совет:** Используйте утилитарные типы, чтобы сделать код более читаемым и избежать дублирования типов в проектах.
