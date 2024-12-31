# Маршрутизация: основы React Router (современная версия)

React Router — это библиотека для управления маршрутизацией в React-приложениях. Она позволяет создавать динамичные и многостраничные приложения, сохраняя их на одной странице (SPA).

---

## 1. Установка React Router

Для начала установите последнюю версию React Router:
```bash
npm install react-router-dom
```

---

## 2. Основные компоненты React Router

### 2.1 BrowserRouter
Обёртка для вашего приложения, которая должна быть верхним компонентом.

```javascript
import { BrowserRouter } from 'react-router-dom';

function App() {
  return (
    <BrowserRouter>
      <Routes />
    </BrowserRouter>
  );
}
```

### 2.2 Routes и Route
`Routes` заменяет устаревший компонент `Switch`. Он рендерит первый подходящий маршрут.

```javascript
import { Routes, Route } from 'react-router-dom';

function App() {
  return (
    <BrowserRouter>
      <Routes>
        <Route path="/" element={<Home />} />
        <Route path="/about" element={<About />} />
        <Route path="/contact" element={<Contact />} />
      </Routes>
    </BrowserRouter>
  );
}
```

### 2.3 Link
Компонент для навигации между страницами.

```javascript
import { Link } from 'react-router-dom';

function Navbar() {
  return (
    <nav>
      <Link to="/">Home</Link>
      <Link to="/about">About</Link>
      <Link to="/contact">Contact</Link>
    </nav>
  );
}
```

---

## 3. Динамические маршруты

### Использование параметров маршрута

Вы можете добавить динамические сегменты в маршруты с помощью `:param`.

#### Пример
```javascript
<Route path="/users/:id" element={<User />} />
```

#### Получение параметров
Используйте хук `useParams` для доступа к параметрам.

```javascript
import { useParams } from 'react-router-dom';

function User() {
  const { id } = useParams();
  return <div>User ID: {id}</div>;
}
```

---

## 4. Навигация программно

Используйте хук `useNavigate` для навигации без `Link`.

#### Пример
```javascript
import { useNavigate } from 'react-router-dom';

function Login() {
  const navigate = useNavigate();

  const handleLogin = () => {
    // Выполнить логику авторизации
    navigate('/dashboard');
  };

  return <button onClick={handleLogin}>Login</button>;
}
```

---

## 5. Защищённые маршруты

Создайте обёртку для маршрутов, которая проверяет условие (например, авторизацию).

#### Пример
```javascript
import { Navigate } from 'react-router-dom';

function ProtectedRoute({ isAuth, children }) {
  return isAuth ? children : <Navigate to="/login" />;
}

function App() {
  const isAuthenticated = true; // Пример проверки авторизации

  return (
    <BrowserRouter>
      <Routes>
        <Route path="/login" element={<Login />} />
        <Route
          path="/dashboard"
          element={
            <ProtectedRoute isAuth={isAuthenticated}>
              <Dashboard />
            </ProtectedRoute>
          }
        />
      </Routes>
    </BrowserRouter>
  );
}
```

---

## 6. Обработка отсутствующих маршрутов

Используйте `Route` с `path="*"` для отображения страницы ошибки или перенаправления.

#### Пример
```javascript
<Route path="*" element={<NotFound />} />
```

---

## Итоговые вопросы для подготовки

1. Чем отличается `Routes` от устаревшего `Switch`?
2. Как работают динамические маршруты в React Router?
3. Как использовать хук `useNavigate` для программной навигации?
4. Как реализовать защищённые маршруты?
5. Как настроить обработку 404 страниц?

**Совет:** Практикуйте создание SPA с несколькими страницами, динамическими маршрутами и защитой маршрутов, чтобы лучше освоить React Router.

