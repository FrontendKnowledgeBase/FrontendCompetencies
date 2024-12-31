# Основы Redux: стор, экшены, редьюсеры

Redux — это библиотека для управления состоянием в приложениях JavaScript. Она предоставляет централизованный стор (хранилище), который упрощает управление состоянием и делает его предсказуемым.

---

## 1. Основные концепции Redux

### Стор (Store)
Стор — это объект, который содержит всё состояние приложения. В отличие от локального состояния компонентов, стор является глобальным и доступен из любого места приложения.

### Экшены (Actions)
Экшены — это объекты, описывающие, что произошло в приложении. Каждый экшен должен содержать поле `type`, определяющее его тип, и может включать дополнительные данные (payload).

### Редьюсеры (Reducers)
Редьюсеры — это чистые функции, которые принимают текущее состояние и экшен, а затем возвращают новое состояние.

---

## 2. Установка Redux

### Установка библиотек
Для начала установите Redux и инструменты для интеграции с React:
```bash
npm install redux react-redux
```

---

## 3. Создание Store

### Пример
```javascript
import { createStore } from 'redux';

// Начальное состояние
const initialState = {
  count: 0
};

// Редьюсер
function counterReducer(state = initialState, action) {
  switch (action.type) {
    case 'INCREMENT':
      return { ...state, count: state.count + 1 };
    case 'DECREMENT':
      return { ...state, count: state.count - 1 };
    default:
      return state;
  }
}

// Создание Store
const store = createStore(counterReducer);

export default store;
```

---

## 4. Экшены

Экшены используются для отправки изменений в стор.

### Пример экшенов
```javascript
const increment = {
  type: 'INCREMENT'
};

const decrement = {
  type: 'DECREMENT'
};
```

### Отправка экшенов
Для изменения состояния используйте метод `dispatch`.

#### Пример
```javascript
store.dispatch({ type: 'INCREMENT' });
console.log(store.getState()); // { count: 1 }
```

---

## 5. Использование React-Redux

React-Redux предоставляет хуки для интеграции Redux с React.

### Установка
```bash
npm install react-redux
```

### Provider
Оборачивает приложение, чтобы сделать стор доступным для компонентов.

#### Пример
```javascript
import React from 'react';
import { Provider } from 'react-redux';
import store from './store';
import App from './App';

const Root = () => (
  <Provider store={store}>
    <App />
  </Provider>
);

export default Root;
```

---

## 6. Хуки React-Redux

### useSelector
Используется для доступа к состоянию в сторе.

#### Пример
```javascript
import { useSelector } from 'react-redux';

function Counter() {
  const count = useSelector((state) => state.count);
  return <p>Count: {count}</p>;
}
```

### useDispatch
Используется для отправки экшенов в стор.

#### Пример
```javascript
import { useDispatch } from 'react-redux';

function CounterButtons() {
  const dispatch = useDispatch();

  return (
    <div>
      <button onClick={() => dispatch({ type: 'INCREMENT' })}>+</button>
      <button onClick={() => dispatch({ type: 'DECREMENT' })}>-</button>
    </div>
  );
}
```

---

## Итоговый пример

### Полный код
```javascript
import React from 'react';
import ReactDOM from 'react-dom';
import { Provider, useSelector, useDispatch } from 'react-redux';
import { createStore } from 'redux';

// Редьюсер
const initialState = { count: 0 };
function counterReducer(state = initialState, action) {
  switch (action.type) {
    case 'INCREMENT':
      return { ...state, count: state.count + 1 };
    case 'DECREMENT':
      return { ...state, count: state.count - 1 };
    default:
      return state;
  }
}

// Стор
const store = createStore(counterReducer);

function Counter() {
  const count = useSelector((state) => state.count);
  const dispatch = useDispatch();

  return (
    <div>
      <p>Count: {count}</p>
      <button onClick={() => dispatch({ type: 'INCREMENT' })}>+</button>
      <button onClick={() => dispatch({ type: 'DECREMENT' })}>-</button>
    </div>
  );
}

ReactDOM.render(
  <Provider store={store}>
    <Counter />
  </Provider>,
  document.getElementById('root')
);
```

---

## Итоговые вопросы для подготовки

1. Что такое стор в Redux, и зачем он нужен?
2. Какую роль играют экшены и редьюсеры?
3. Как настроить React-Redux для интеграции с приложением?
4. Какие хуки предоставляет React-Redux?
5. Чем `useSelector` отличается от `useDispatch`?

**Совет:** Попробуйте реализовать простой счетчик с использованием Redux, чтобы освоить основы работы со стором, экшенами и редьюсерами.

