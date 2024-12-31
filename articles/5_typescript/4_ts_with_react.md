# Типизация React-компонентов в TypeScript: props, state, хуки

TypeScript значительно упрощает работу с React, предоставляя строгую типизацию для props, state и хуков. Это делает код более предсказуемым, уменьшает количество ошибок и улучшает читаемость. В этой статье рассмотрим основные подходы к типизации React-компонентов.

---

## 1. Типизация props

Props (свойства) передаются в компонент для настройки его поведения и содержимого.

### Типизация функционального компонента

#### Пример
```typescript
interface ButtonProps {
  label: string;
  onClick: () => void;
}

const Button: React.FC<ButtonProps> = ({ label, onClick }) => {
  return <button onClick={onClick}>{label}</button>;
};

<Button label="Click me" onClick={() => console.log("Clicked")}/>
```

### Типизация props с использованием children

#### Пример
```typescript
interface CardProps {
  title: string;
  children: React.ReactNode;
}

const Card: React.FC<CardProps> = ({ title, children }) => {
  return (
    <div>
      <h2>{title}</h2>
      <div>{children}</div>
    </div>
  );
};

<Card title="My Card">
  <p>This is card content.</p>
</Card>
```

---

## 2. Типизация state

### Использование `useState` с типами

#### Пример
```typescript
const Counter: React.FC = () => {
  const [count, setCount] = React.useState<number>(0);

  const increment = () => setCount(count + 1);

  return (
    <div>
      <p>Count: {count}</p>
      <button onClick={increment}>Increment</button>
    </div>
  );
};
```

### Типизация сложного состояния

#### Пример
```typescript
interface Todo {
  id: number;
  task: string;
  completed: boolean;
}

const TodoList: React.FC = () => {
  const [todos, setTodos] = React.useState<Todo[]>([]);

  const addTodo = (task: string) => {
    setTodos([...todos, { id: Date.now(), task, completed: false }]);
  };

  return (
    <div>
      <button onClick={() => addTodo("New Task")}>Add Todo</button>
      <ul>
        {todos.map(todo => (
          <li key={todo.id}>{todo.task}</li>
        ))}
      </ul>
    </div>
  );
};
```

---

## 3. Типизация хуков

### `useEffect`
`useEffect` не требует явного указания типов, но полезно типизировать используемые переменные.

#### Пример
```typescript
const FetchData: React.FC = () => {
  const [data, setData] = React.useState<string | null>(null);

  React.useEffect(() => {
    fetch("/api/data")
      .then(response => response.json())
      .then(setData);
  }, []);

  return <div>{data ? data : "Loading..."}</div>;
};
```

### Пользовательские хуки

#### Пример
```typescript
function useFetch<T>(url: string): { data: T | null; error: string | null } {
  const [data, setData] = React.useState<T | null>(null);
  const [error, setError] = React.useState<string | null>(null);

  React.useEffect(() => {
    fetch(url)
      .then(response => response.json())
      .then(setData)
      .catch(err => setError(err.message));
  }, [url]);

  return { data, error };
}

const DataComponent: React.FC = () => {
  const { data, error } = useFetch<{ id: number; name: string }>("/api/items");

  if (error) return <p>Error: {error}</p>;
  if (!data) return <p>Loading...</p>;

  return <p>Item: {data.name}</p>;
};
```

---

## Итоговые вопросы для подготовки

1. Как типизировать props с использованием `React.FC`?
2. В чём преимущество явной типизации состояния в `useState`?
3. Какие типы использовать для `children` в React-компонентах?
4. Как типизировать пользовательский хук?
5. Какие проблемы могут возникнуть при отсутствии типизации?

**Совет:** Практикуйте типизацию в реальных проектах, чтобы лучше понять преимущества TypeScript в разработке React-приложений.

