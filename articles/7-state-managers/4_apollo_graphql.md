# Управление состоянием с помощью Apollo GraphQL

Apollo Client — это мощная библиотека для работы с GraphQL, которая позволяет управлять состоянием приложения с использованием данных из API GraphQL и локального кэша. В этой статье рассмотрим, как Apollo упрощает управление состоянием.

---

## 1. Установка Apollo Client

Для начала установите Apollo Client и зависимости:
```bash
npm install @apollo/client graphql
```

### Настройка Apollo Provider
Чтобы сделать Apollo доступным в приложении, используйте `ApolloProvider`.

#### Пример
```javascript
import React from 'react';
import { ApolloClient, InMemoryCache, ApolloProvider } from '@apollo/client';

const client = new ApolloClient({
  uri: 'https://example.com/graphql',
  cache: new InMemoryCache()
});

function App() {
  return (
    <ApolloProvider client={client}>
      <MainComponent />
    </ApolloProvider>
  );
}
```

---

## 2. Управление удалённым состоянием

Apollo позволяет извлекать данные из GraphQL API с помощью хуков, таких как `useQuery` и `useMutation`.

### useQuery
`useQuery` используется для получения данных с сервера.

#### Пример
```javascript
import { gql, useQuery } from '@apollo/client';

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
```

### useMutation
`useMutation` используется для отправки данных на сервер.

#### Пример
```javascript
import { gql, useMutation } from '@apollo/client';

const ADD_TODO = gql`
  mutation AddTodo($text: String!) {
    addTodo(text: $text) {
      id
      text
      completed
    }
  }
`;

function AddTodo() {
  const [addTodo, { data, loading, error }] = useMutation(ADD_TODO);

  const handleAddTodo = () => {
    addTodo({ variables: { text: 'New Todo' } });
  };

  if (loading) return <p>Adding...</p>;
  if (error) return <p>Error: {error.message}</p>;

  return <button onClick={handleAddTodo}>Add Todo</button>;
}
```

---

## 3. Управление локальным состоянием

### Apollo Cache
Apollo Cache позволяет управлять локальным состоянием без использования сторонних библиотек, таких как Redux.

#### Запись в кэш
```javascript
client.writeQuery({
  query: GET_TODOS,
  data: {
    todos: [
      { id: 1, text: 'Learn Apollo', completed: false }
    ]
  }
});
```

#### Чтение из кэша
```javascript
const data = client.readQuery({ query: GET_TODOS });
console.log(data.todos);
```

### Локальные резолверы
Локальные резолверы позволяют описывать поведение для запросов, не требующих взаимодействия с сервером.

#### Пример
```javascript
import { makeVar } from '@apollo/client';

const todosVar = makeVar([
  { id: 1, text: 'Learn Apollo', completed: false }
]);

function Todos() {
  const todos = useReactiveVar(todosVar);

  const addTodo = () => {
    todosVar([...todos, { id: 2, text: 'Write Docs', completed: false }]);
  };

  return (
    <div>
      <ul>
        {todos.map((todo) => (
          <li key={todo.id}>{todo.text}</li>
        ))}
      </ul>
      <button onClick={addTodo}>Add Todo</button>
    </div>
  );
}
```

---

## 4. Сравнение Apollo и Redux

| Функция                  | Apollo Client                                      | Redux                          |
|--------------------------|---------------------------------------------------|--------------------------------|
| Хранилище данных         | Графовая структура кэша                           | Редьюсеры и экшены            |
| Работа с серверными данными | Из коробки через хуки `useQuery` и `useMutation` | Требует дополнительных библиотек |
| Локальное состояние      | Управление через кэш и `makeVar`                  | Полная настройка через редьюсеры |

---

## Итоговые вопросы для подготовки

1. Как использовать `useQuery` для получения данных из GraphQL API?
2. Чем отличаются хуки `useQuery` и `useMutation`?
3. Как управлять локальным состоянием с помощью Apollo Cache?
4. Какие преимущества имеет Apollo перед Redux в управлении состоянием?
5. Как настроить Apollo Provider в приложении?

**Совет:** Практикуйтесь в создании компонентов с использованием удалённого и локального состояния через Apollo, чтобы лучше понять возможности библиотеки.

