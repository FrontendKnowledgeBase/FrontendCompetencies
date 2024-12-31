# Альтернативы Redux: Context API, Zustand, Recoil, Apollo GraphQL

Redux — мощный инструмент для управления состоянием, но иногда он может быть излишним. Ниже представлена сравнительная таблица основных инструментов для управления состоянием в React-приложениях. В таких случаях на помощь приходят более лёгкие альтернативы, такие как Context API, Zustand, Recoil и Apollo GraphQL. В этой статье рассмотрим их особенности и применение.

---

## Общая сравнительная таблица

| Инструмент     | Тип данных             | Простота использования | Подходит для крупных приложений | Поддержка экосистемы | Ключевые особенности                     |
| -------------- | ---------------------- | ---------------------- | ------------------------------- | -------------------- | ---------------------------------------- |
| Redux          | Локальные и глобальные | Средняя                | Да                              | Развита              | Предсказуемое управление состоянием      |
| Context API    | Локальные              | Высокая                | Нет                             | Встроенная           | Подходит для небольших проектов          |
| Zustand        | Локальные              | Высокая                | Нет                             | Минимальная          | Простота API, реактивное состояние       |
| Recoil         | Локальные и атомарные  | Средняя                | Да                              | Развивающаяся        | Атомарное управление состоянием          |
| Apollo GraphQL | Локальные и удалённые  | Средняя                | Да                              | Развита              | Интеграция с GraphQL, кэширование данных |

## 1. Context API

### Что такое Context API?

Context API — это встроенный инструмент React для управления глобальным состоянием. Он позволяет избежать «пробрасывания» props через несколько уровней компонентов.

### Пример использования

```javascript
import React, { createContext, useContext, useState } from 'react';

const ThemeContext = createContext();

function ThemeProvider({ children }) {
  const [theme, setTheme] = useState('light');

  return (
    <ThemeContext.Provider value={{ theme, setTheme }}>
      {children}
    </ThemeContext.Provider>
  );
}

function ThemedButton() {
  const { theme, setTheme } = useContext(ThemeContext);

  return (
    <button
      onClick={() => setTheme(theme === 'light' ? 'dark' : 'light')}
    >
      Current theme: {theme}
    </button>
  );
}

function App() {
  return (
    <ThemeProvider>
      <ThemedButton />
    </ThemeProvider>
  );
}
```

### Плюсы и минусы

| Плюсы                           | Минусы                                             |
| ------------------------------- | -------------------------------------------------- |
| Простота и встроенность         | Производительность на больших деревьях компонентов |
| Нет дополнительных зависимостей | Ограниченность по функционалу                      |

---

## 2. Zustand

### Что такое Zustand?

Zustand — это минималистичный state-менеджер, основанный на хуках. Он предоставляет лёгкое и мощное решение для управления состоянием.

### Установка

```bash
npm install zustand
```

### Пример использования

```javascript
import create from 'zustand';

const useStore = create((set) => ({
  count: 0,
  increment: () => set((state) => ({ count: state.count + 1 })),
  decrement: () => set((state) => ({ count: state.count - 1 })),
}));

function Counter() {
  const { count, increment, decrement } = useStore();

  return (
    <div>
      <p>Count: {count}</p>
      <button onClick={increment}>+</button>
      <button onClick={decrement}>-</button>
    </div>
  );
}
```

### Плюсы и минусы

| Плюсы                           | Минусы                                                   |
| ------------------------------- | -------------------------------------------------------- |
| Простота API                    | Меньшая экосистема                                       |
| Поддержка реактивного состояния | Отсутствие встроенных инструментов для сложных сценариев |

---

## 3. Recoil

### Что такое Recoil?

Recoil — это библиотека для управления состоянием, разработанная Facebook. Она предлагает атомарный подход к управлению состоянием, позволяя работать с независимыми частями данных.

### Установка

```bash
npm install recoil
```

### Пример использования

```javascript
import React from 'react';
import { atom, selector, useRecoilState, useRecoilValue, RecoilRoot } from 'recoil';

const countState = atom({
  key: 'countState',
  default: 0,
});

const doubledCountState = selector({
  key: 'doubledCountState',
  get: ({ get }) => get(countState) * 2,
});

function Counter() {
  const [count, setCount] = useRecoilState(countState);
  const doubledCount = useRecoilValue(doubledCountState);

  return (
    <div>
      <p>Count: {count}</p>
      <p>Doubled Count: {doubledCount}</p>
      <button onClick={() => setCount(count + 1)}>+</button>
      <button onClick={() => setCount(count - 1)}>-</button>
    </div>
  );
}

function App() {
  return (
    <RecoilRoot>
      <Counter />
    </RecoilRoot>
  );
}
```

### Плюсы и минусы

| Плюсы                           | Минусы                        |
| ------------------------------- | ----------------------------- |
| Атомарное управление состоянием | Библиотека относительно новая |
| Лёгкость интеграции с React     | Меньшая популярность          |

---

## 4. Apollo GraphQL

### Что такое Apollo GraphQL?

Apollo — это библиотека для работы с GraphQL, которая предоставляет инструменты для управления состоянием, кэширования данных и выполнения запросов.

### Установка

```bash
npm install @apollo/client graphql
```

### Пример использования

```javascript
import React from 'react';
import { ApolloClient, InMemoryCache, ApolloProvider, gql, useQuery } from '@apollo/client';

const client = new ApolloClient({
  uri: 'https://example.com/graphql',
  cache: new InMemoryCache(),
});

const GET_TODOS = gql`
  query GetTodos {
    todos {
      id
      text
      completed
    }
  }
`;

function Todos() {
  const { loading, error, data } = useQuery(GET_TODOS);

  if (loading) return <p>Loading...</p>;
  if (error) return <p>Error: {error.message}</p>;

  return (
    <ul>
      {data.todos.map((todo) => (
        <li key={todo.id}>{todo.text}</li>
      ))}
    </ul>
  );
}

function App() {
  return (
    <ApolloProvider client={client}>
      <Todos />
    </ApolloProvider>
  );
}
```

### Плюсы и минусы

| Плюсы                         | Минусы                   |
| ----------------------------- | ------------------------ |
| Интеграция с GraphQL          | Требуется знание GraphQL |
| Кэширование данных из коробки | Более сложная настройка  |

---

## Сравнение альтернатив

| Функция                         | Context API  | Zustand     | Recoil        | Apollo GraphQL |
| ------------------------------- | ------------ | ----------- | ------------- | -------------- |
| Простота использования          | Высокая      | Высокая     | Средняя       | Средняя        |
| Подходит для крупных приложений | Нет          | Нет         | Да            | Да             |
| Гибкость                        | Ограниченная | Высокая     | Высокая       | Высокая        |
| Экосистема                      | Встроенная   | Минимальная | Развивающаяся | Развита        |

---

## Итоговые вопросы для подготовки

1. Чем отличается Context API от других альтернатив?
2. Как работает Zustand, и в каких сценариях он наиболее полезен?
3. Что такое атомы в Recoil, и как их использовать?
4. Какие возможности предоставляет Apollo GraphQL для управления состоянием?
5. Как выбрать подходящий инструмент для конкретного проекта?

**Совет:** Попробуйте реализовать небольшой проект с использованием каждой из этих библиотек, чтобы лучше понять их возможности и ограничения.

