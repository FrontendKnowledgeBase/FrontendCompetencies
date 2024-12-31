# Хуки в React: все основные хуки

Хуки — это ключевая функциональность React, позволяющая использовать состояние и другие возможности React в функциональных компонентах. В этой статье рассмотрим основные хуки: `useState`, `useEffect`, `useMemo`, `useCallback`, `useRef`, `useContext`, `useReducer`, и `useLayoutEffect`.

---

## 1. useState

### Что такое `useState`?
`useState` позволяет добавлять состояние в функциональные компоненты. Оно возвращает массив из двух значений:
1. Текущего значения состояния.
2. Функции для его обновления.

### Синтаксис
```javascript
const [state, setState] = useState(initialState);
```

### Пример использования
```javascript
import React, { useState } from 'react';

function Counter() {
  const [count, setCount] = useState(0);

  const increment = () => setCount(count + 1);

  return (
    <div>
      <p>Count: {count}</p>
      <button onClick={increment}>Increment</button>
    </div>
  );
}
```

---

## 2. useEffect

### Что такое `useEffect`?
`useEffect` позволяет выполнять побочные эффекты в функциональных компонентах, такие как:
- Запросы к API.
- Подписки на события.
- Работа с DOM.

### Синтаксис
```javascript
useEffect(effectFunction, dependencies);
```

### Пример использования
#### Без зависимостей
Эффект вызывается после каждого рендера:
```javascript
useEffect(() => {
  console.log('Component rendered');
});
```

#### С зависимостями
Эффект вызывается только при изменении указанных зависимостей:
```javascript
useEffect(() => {
  console.log('Count changed:', count);
}, [count]);
```

---

## 3. useMemo

### Зачем нужна мемоизация?
Мемоизация предотвращает ненужные вычисления или повторный рендеринг компонентов, улучшая производительность.

### Синтаксис
```javascript
const memoizedValue = useMemo(() => computeExpensiveValue(a, b), [a, b]);
```

### Пример
```javascript
import React, { useState, useMemo } from 'react';

function ExpensiveCalculation({ num }) {
  const calculate = (n) => {
    console.log('Calculating...');
    return n * 2;
  };

  const result = useMemo(() => calculate(num), [num]);

  return <p>Result: {result}</p>;
}
```

---

## 4. useCallback

### Что такое `useCallback`?
`useCallback` мемоизирует функции, чтобы они не создавались заново при каждом рендере.

### Синтаксис
```javascript
const memoizedCallback = useCallback(() => doSomething(a, b), [a, b]);
```

### Пример
```javascript
import React, { useState, useCallback } from 'react';

function Button({ onClick }) {
  console.log('Button rendered');
  return <button onClick={onClick}>Click me</button>;
}

function App() {
  const [count, setCount] = useState(0);

  const increment = useCallback(() => {
    setCount(prevCount => prevCount + 1);
  }, []);

  return (
    <div>
      <p>Count: {count}</p>
      <Button onClick={increment} />
    </div>
  );
}
```

---

## 5. useRef

### Что такое `useRef`?
`useRef` создаёт объект, который сохраняет своё значение между рендерами.

### Пример
```javascript
import React, { useRef } from 'react';

function TextInput() {
  const inputRef = useRef(null);

  const focusInput = () => {
    inputRef.current.focus();
  };

  return (
    <div>
      <input ref={inputRef} type="text" />
      <button onClick={focusInput}>Focus Input</button>
    </div>
  );
}
```

---

## 6. useContext

### Что такое `useContext`?
`useContext` позволяет получать данные из контекста без использования `Context.Consumer`.

### Пример
```javascript
import React, { useContext } from 'react';

const ThemeContext = React.createContext('light');

function ThemedButton() {
  const theme = useContext(ThemeContext);
  return <button className={theme}>Click me</button>;
}
```

---

## 7. useReducer

### Что такое `useReducer`?
`useReducer` управляет сложным состоянием с помощью редьюсера.

### Пример
```javascript
import React, { useReducer } from 'react';

function reducer(state, action) {
  switch (action.type) {
    case 'increment':
      return { count: state.count + 1 };
    case 'decrement':
      return { count: state.count - 1 };
    default:
      throw new Error();
  }
}

function Counter() {
  const [state, dispatch] = useReducer(reducer, { count: 0 });

  return (
    <div>
      <p>Count: {state.count}</p>
      <button onClick={() => dispatch({ type: 'increment' })}>+</button>
      <button onClick={() => dispatch({ type: 'decrement' })}>-</button>
    </div>
  );
}
```

---

## 8. useLayoutEffect

### Что такое `useLayoutEffect`?
`useLayoutEffect` выполняется синхронно после всех изменений DOM.

### Пример
```javascript
import React, { useLayoutEffect, useRef } from 'react';

function LayoutEffectExample() {
  const ref = useRef();

  useLayoutEffect(() => {
    console.log('Layout effect:', ref.current.offsetHeight);
  });

  return <div ref={ref}>Hello, World!</div>;
}
```

---

## Итоговые вопросы для подготовки

1. Как работает `useState`, и какие типы данных можно хранить в состоянии?
2. В каких случаях использовать `useEffect` и чем он отличается от `useLayoutEffect`?
3. Когда применять `useMemo` и `useCallback`?
4. Какие задачи решает `useReducer`?
5. Как работает `useRef`, и где его лучше использовать?
6. Какие проблемы решает `useContext`?

**Совет:** Практикуйте использование всех основных хуков в небольших проектах, чтобы лучше понять их возможности и ограничения.

