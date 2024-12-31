# Redux Toolkit: createSlice, createAsyncThunk

Redux Toolkit — это официальная библиотека для упрощения работы с Redux. Она включает мощные инструменты для создания стейта и обработки асинхронных действий, такие как `createSlice` и `createAsyncThunk`.

---

## 1. Установка Redux Toolkit

Для начала установите Redux Toolkit и React-Redux:
```bash
npm install @reduxjs/toolkit react-redux
```

---

## 2. createSlice

### Что такое `createSlice`?
`createSlice` упрощает создание редьюсеров и экшенов. Он позволяет:
- Определять начальное состояние.
- Автоматически генерировать экшены.
- Объединять редьюсеры в одном месте.

### Синтаксис
```javascript
import { createSlice } from '@reduxjs/toolkit';

const slice = createSlice({
  name: 'sliceName',
  initialState: {},
  reducers: {
    actionName: (state, action) => {
      // Логика изменения состояния
    }
  }
});

export const { actionName } = slice.actions;
export default slice.reducer;
```

### Пример
```javascript
import { createSlice } from '@reduxjs/toolkit';

const counterSlice = createSlice({
  name: 'counter',
  initialState: { value: 0 },
  reducers: {
    increment: (state) => {
      state.value += 1;
    },
    decrement: (state) => {
      state.value -= 1;
    },
    incrementByAmount: (state, action) => {
      state.value += action.payload;
    }
  }
});

export const { increment, decrement, incrementByAmount } = counterSlice.actions;
export default counterSlice.reducer;
```

---

## 3. createAsyncThunk

### Что такое `createAsyncThunk`?
`createAsyncThunk` используется для обработки асинхронных операций, таких как запросы к API. Он автоматически создаёт экшены `pending`, `fulfilled` и `rejected`.

### Синтаксис
```javascript
import { createAsyncThunk } from '@reduxjs/toolkit';

export const asyncAction = createAsyncThunk(
  'sliceName/asyncAction',
  async (payload, thunkAPI) => {
    // Логика асинхронной операции
  }
);
```

### Пример
```javascript
import { createAsyncThunk, createSlice } from '@reduxjs/toolkit';

export const fetchUser = createAsyncThunk('user/fetchUser', async (userId) => {
  const response = await fetch(`/api/user/${userId}`);
  return response.json();
});

const userSlice = createSlice({
  name: 'user',
  initialState: { data: null, status: 'idle', error: null },
  reducers: {},
  extraReducers: (builder) => {
    builder
      .addCase(fetchUser.pending, (state) => {
        state.status = 'loading';
      })
      .addCase(fetchUser.fulfilled, (state, action) => {
        state.status = 'succeeded';
        state.data = action.payload;
      })
      .addCase(fetchUser.rejected, (state, action) => {
        state.status = 'failed';
        state.error = action.error.message;
      });
  }
});

export default userSlice.reducer;
```

---

## 4. Интеграция с React

### Настройка Store
```javascript
import { configureStore } from '@reduxjs/toolkit';
import counterReducer from './counterSlice';
import userReducer from './userSlice';

const store = configureStore({
  reducer: {
    counter: counterReducer,
    user: userReducer
  }
});

export default store;
```

### Оборачивание Provider
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

### Использование хуков

#### useSelector
```javascript
import { useSelector } from 'react-redux';

function Counter() {
  const count = useSelector((state) => state.counter.value);
  return <p>Count: {count}</p>;
}
```

#### useDispatch
```javascript
import { useDispatch } from 'react-redux';
import { increment, decrement } from './counterSlice';

function CounterButtons() {
  const dispatch = useDispatch();

  return (
    <div>
      <button onClick={() => dispatch(increment())}>+</button>
      <button onClick={() => dispatch(decrement())}>-</button>
    </div>
  );
}
```

---

## Итоговые вопросы для подготовки

1. Как `createSlice` упрощает создание редьюсеров и экшенов?
2. Чем полезен `createAsyncThunk`, и как он обрабатывает состояния `pending`, `fulfilled` и `rejected`?
3. Как настроить стор с использованием Redux Toolkit?
4. Как обрабатывать асинхронные операции в Redux Toolkit?
5. Какие преимущества предоставляет Redux Toolkit перед классическим Redux?

**Совет:** Реализуйте проект с использованием `createSlice` и `createAsyncThunk`, чтобы освоить возможности Redux Toolkit.

