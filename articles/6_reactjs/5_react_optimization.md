# Оптимизация в React: React.memo, Server Components

Оптимизация React-приложений помогает уменьшить количество ненужных рендеров, ускорить загрузку и улучшить общую производительность. В этой статье рассмотрим использование `React.memo` и Server Components.

---

## 1. React.memo

### Что такое `React.memo`?
`React.memo` — это HOC (Higher-Order Component), который мемоизирует компонент, предотвращая его повторный рендер, если props не изменились.

### Синтаксис
```javascript
const MemoizedComponent = React.memo(Component);
```

### Пример использования
```javascript
import React from 'react';

function Child({ count }) {
  console.log('Child rendered');
  return <p>Count: {count}</p>;
}

const MemoizedChild = React.memo(Child);

function Parent() {
  const [count, setCount] = React.useState(0);
  const [text, setText] = React.useState('');

  return (
    <div>
      <button onClick={() => setCount(count + 1)}>Increment</button>
      <input value={text} onChange={(e) => setText(e.target.value)} />
      <MemoizedChild count={count} />
    </div>
  );
}
```

### Когда использовать `React.memo`?
- Компоненты рендерятся часто с одинаковыми props.
- Рендер компонента затратный по времени.

### Особенности
- `React.memo` сравнивает props поверхностно. Для глубокого сравнения используйте вторую аргумент-функцию.

#### Пример с кастомным сравнением
```javascript
const MemoizedChild = React.memo(Child, (prevProps, nextProps) => {
  return prevProps.count === nextProps.count;
});
```

---

## 2. Server Components

### Что такое Server Components?
Server Components (Серверные компоненты) — это новая возможность React, которая позволяет выполнять рендеринг компонентов на сервере. Это снижает нагрузку на клиент и улучшает производительность за счёт отправки минимального JavaScript на клиентскую сторону.

### Основные преимущества
- Улучшение производительности за счёт рендеринга на сервере.
- Уменьшение размера загружаемого JavaScript.
- Возможность использования серверных ресурсов (например, базы данных) напрямую внутри компонентов.

### Пример структуры проекта
```
src/
  components/
    Header.server.js
    Footer.client.js
```

### Как работают Server Components?
1. Сервер рендерит компоненты и отправляет их в виде готовой HTML-структуры.
2. Клиентская часть React обрабатывает и монтирует компоненты.

#### Пример
```javascript
// Header.server.js
export default function Header() {
  return <h1>This is rendered on the server</h1>;
}

// Footer.client.js
export default function Footer() {
  return <p>This is rendered on the client</p>;
}

// App.js
import Header from './components/Header.server';
import Footer from './components/Footer.client';

function App() {
  return (
    <div>
      <Header />
      <Footer />
    </div>
  );
}
```

### Ограничения Server Components
- Нельзя использовать хуки, связанные с состоянием или эффектами (например, `useState`, `useEffect`).
- Подходит для задач, не требующих взаимодействия с клиентом.

---

## 3. Когда использовать эти подходы?

### React.memo
- Для оптимизации клиентских компонентов с неизменяемыми props.
- Когда производительность страдает из-за частых ререндеров.

### Server Components
- Для рендеринга больших объёмов данных, которые не требуют интерактивности.
- Для снижения размера клиентского JavaScript.

---

## Итоговые вопросы для подготовки

1. Как работает `React.memo`, и какие задачи он решает?
2. В чём разница между Server Components и стандартными клиентскими компонентами?
3. Какие ограничения существуют при использовании Server Components?
4. Когда следует избегать применения `React.memo`?
5. Как правильно комбинировать эти два подхода в одном проекте?

**Совет:** Экспериментируйте с использованием `React.memo` для оптимизации клиентской части и Server Components для ускорения серверного рендеринга.

