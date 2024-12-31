# Управление состоянием через Context API

Context API — это встроенный инструмент React для управления глобальным состоянием в приложении. Он позволяет передавать данные через дерево компонентов без необходимости явно передавать props на каждом уровне.

---

## 1. Что такое Context API?

Context API предоставляет способ передачи данных (например, темы, языка или аутентификации) через дерево компонентов без необходимости передавать props вручную на каждом уровне.

### Основные элементы Context API
1. **Создание контекста** с помощью `React.createContext`.
2. **Provider** — компонент, предоставляющий данные для дочерних компонентов.
3. **Consumer** — компонент, получающий данные из контекста (или `useContext` хук для функциональных компонентов).

---

## 2. Создание и использование контекста

### Шаги для использования Context API

#### 1. Создание контекста
```javascript
import React from 'react';

const ThemeContext = React.createContext('light');
```

#### 2. Обёртка с Provider
```javascript
function App() {
  return (
    <ThemeContext.Provider value="dark">
      <Toolbar />
    </ThemeContext.Provider>
  );
}
```

#### 3. Получение данных через Consumer
```javascript
function Toolbar() {
  return (
    <ThemeContext.Consumer>
      {(value) => <button className={value}>Click me</button>}
    </ThemeContext.Consumer>
  );
}
```

---

## 3. Использование `useContext`

### Пример с `useContext`
Хук `useContext` упрощает получение данных из контекста, устраняя необходимость использования Consumer.

```javascript
import React, { useContext } from 'react';

const ThemeContext = React.createContext('light');

function ThemedButton() {
  const theme = useContext(ThemeContext);
  return <button className={theme}>Click me</button>;
}

function App() {
  return (
    <ThemeContext.Provider value="dark">
      <ThemedButton />
    </ThemeContext.Provider>
  );
}
```

---

## 4. Пример: управление аутентификацией

### Создание контекста
```javascript
const AuthContext = React.createContext(null);
```

### Provider для аутентификации
```javascript
function AuthProvider({ children }) {
  const [user, setUser] = React.useState(null);

  const login = (username) => setUser({ username });
  const logout = () => setUser(null);

  return (
    <AuthContext.Provider value={{ user, login, logout }}>
      {children}
    </AuthContext.Provider>
  );
}
```

### Доступ к данным аутентификации через `useContext`
```javascript
function Navbar() {
  const { user, logout } = useContext(AuthContext);

  return (
    <div>
      {user ? (
        <>
          <span>Welcome, {user.username}</span>
          <button onClick={logout}>Logout</button>
        </>
      ) : (
        <span>Please log in</span>
      )}
    </div>
  );
}

function App() {
  return (
    <AuthProvider>
      <Navbar />
    </AuthProvider>
  );
}
```

---

## 5. Когда использовать Context API?

### Подходит для:
1. Управления глобальным состоянием (тема, язык, аутентификация).
2. Снижения сложности при передаче props через несколько уровней.

### Не подходит для:
1. Часто обновляемых данных (например, позиция мыши, время), так как это может вызывать лишние рендеры.
2. Сложных состояний — в таких случаях лучше использовать Redux, MobX или другие state-менеджеры.

---

## Итоговые вопросы для подготовки

1. Чем отличается Context API от передачи props?
2. Как использовать `useContext` для получения данных?
3. Какие задачи хорошо решает Context API?
4. Какие проблемы могут возникнуть при использовании Context API?
5. Как использовать несколько контекстов в одном компоненте?

**Совет:** Попробуйте реализовать приложение с темами (светлая/тёмная) или аутентификацией, чтобы освоить Context API на практике.

