# Хуки Redux: useDispatch, useSelector

React-Redux предоставляет хуки `useDispatch` и `useSelector` для удобной работы с Redux. Они упрощают управление состоянием, устраняя необходимость использования `connect` и улучшая читаемость кода.

---

## 1. useDispatch

### Что такое `useDispatch`?
`useDispatch` — это хук, который возвращает функцию `dispatch`. Она используется для отправки экшенов в стор.

### Синтаксис
```javascript
const dispatch = useDispatch();
```

### Пример использования
#### Инкремент счётчика
```javascript
import React from 'react';
import { useDispatch } from 'react-redux';
import { increment } from './counterSlice';

function CounterButtons() {
  const dispatch = useDispatch();

  return (
    <div>
      <button onClick={() => dispatch(increment())}>Increment</button>
    </div>
  );
}
```

#### Асинхронный экшен
```javascript
import React from 'react';
import { useDispatch } from 'react-redux';
import { fetchUser } from './userSlice';

function FetchUserButton() {
  const dispatch = useDispatch();

  return (
    <button onClick={() => dispatch(fetchUser(1))}>Fetch User</button>
  );
}
```

---

## 2. useSelector

### Что такое `useSelector`?
`useSelector` — это хук, который позволяет извлекать данные из состояния Redux. Он подписывается на изменения стейта и повторно вызывает компонент, если нужное значение изменилось.

### Синтаксис
```javascript
const value = useSelector(selectorFunction);
```

### Пример использования
#### Получение значения из стейта
```javascript
import React from 'react';
import { useSelector } from 'react-redux';

function CounterDisplay() {
  const count = useSelector((state) => state.counter.value);

  return <p>Count: {count}</p>;
}
```

#### Фильтрация данных
```javascript
import React from 'react';
import { useSelector } from 'react-redux';

function CompletedTodos() {
  const completedTodos = useSelector((state) =>
    state.todos.filter((todo) => todo.completed)
  );

  return (
    <ul>
      {completedTodos.map((todo) => (
        <li key={todo.id}>{todo.text}</li>
      ))}
    </ul>
  );
}
```

---

## 3. Совместное использование useDispatch и useSelector

### Пример полного компонента
```javascript
import React from 'react';
import { useSelector, useDispatch } from 'react-redux';
import { increment, decrement } from './counterSlice';

function Counter() {
  const count = useSelector((state) => state.counter.value);
  const dispatch = useDispatch();

  return (
    <div>
      <p>Count: {count}</p>
      <button onClick={() => dispatch(increment())}>+</button>
      <button onClick={() => dispatch(decrement())}>-</button>
    </div>
  );
}
```

---

## 4. Особенности и рекомендации

### Особенности
- `useDispatch` всегда возвращает одну и ту же функцию `dispatch`.
- `useSelector` подписывается на изменения состояния и сравнивает результаты селектора для оптимизации рендера.

### Рекомендации
1. Используйте мемоизацию селекторов (например, с библиотекой `reselect`) для улучшения производительности.
2. Старайтесь извлекать минимальное количество данных из стейта, чтобы уменьшить количество перерисовок.
3. Разбивайте сложные компоненты на более мелкие, чтобы упростить тестирование и управление состоянием.

---

## Итоговые вопросы для подготовки

1. Чем отличается `useDispatch` от `useSelector`?
2. Как оптимизировать селекторы, чтобы избежать лишних ререндеров?
3. Какие данные лучше извлекать с помощью `useSelector`?
4. Как работать с асинхронными экшенами через `useDispatch`?
5. Какие ошибки могут возникнуть при неправильном использовании хуков React-Redux?

**Совет:** Практикуйтесь в создании компонентов с использованием обоих хуков, чтобы лучше понять их взаимодействие и возможности.

