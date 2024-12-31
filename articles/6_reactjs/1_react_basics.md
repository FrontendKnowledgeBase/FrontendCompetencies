# Основы React: JSX, компоненты, props

React — это популярная библиотека для создания пользовательских интерфейсов. Она основывается на использовании компонентов, JSX и props для построения динамичных и отзывчивых приложений.

---

## 1. JSX

### Что такое JSX?
JSX (JavaScript XML) — это синтаксис, позволяющий писать HTML-подобный код внутри JavaScript. React преобразует JSX в вызовы `React.createElement` во время компиляции.

### Пример JSX
```javascript
const element = <h1>Hello, world!</h1>;
ReactDOM.render(element, document.getElementById('root'));
```

### Особенности JSX
1. **Смешивание HTML и JavaScript**: Вы можете вставлять JavaScript-выражения с помощью `{}`.
   ```javascript
   const name = "Alice";
   const element = <h1>Hello, {name}!</h1>;
   ```

2. **Атрибуты как свойства**: Используйте camelCase для атрибутов.
   ```javascript
   const element = <button onClick={handleClick}>Click Me</button>;
   ```

3. **Фрагменты**: Позволяют возвращать несколько элементов без лишних обёрток.
   ```javascript
   const element = (
     <>
       <h1>Hello</h1>
       <p>Welcome to React</p>
     </>
   );
   ```

---

## 2. Компоненты

### Что такое компоненты?
Компоненты — это основные строительные блоки React-приложений. Они могут быть функциональными или классовыми.

### Функциональные компоненты
Функциональные компоненты — это простые функции, которые принимают props и возвращают JSX.

#### Пример
```javascript
function Welcome(props) {
  return <h1>Hello, {props.name}!</h1>;
}

ReactDOM.render(<Welcome name="Alice" />, document.getElementById('root'));
```

### Классовые компоненты
Классовые компоненты более сложные и используются для управления состоянием.

#### Пример
```javascript
class Welcome extends React.Component {
  render() {
    return <h1>Hello, {this.props.name}!</h1>;
  }
}

ReactDOM.render(<Welcome name="Alice" />, document.getElementById('root'));
```

### Когда использовать компоненты?
- Для повторяющихся частей интерфейса (например, карточки, кнопки).
- Для организации логики и структуры приложения.

---

## 3. Props

### Что такое props?
Props (properties) — это данные, передаваемые в компонент для его настройки. Они неизменяемы и задаются извне.

### Передача props
#### Пример
```javascript
function Greeting(props) {
  return <h1>Hello, {props.name}!</h1>;
}

ReactDOM.render(<Greeting name="Bob" />, document.getElementById('root'));
```

### Дефолтные значения props
#### Пример
```javascript
function Greeting({ name = "Guest" }) {
  return <h1>Welcome, {name}!</h1>;
}

ReactDOM.render(<Greeting />, document.getElementById('root'));
```

### Деструктуризация props
#### Пример
```javascript
function Greeting({ name, age }) {
  return (
    <p>
      Hello, {name}! You are {age} years old.
    </p>
  );
}

ReactDOM.render(<Greeting name="Alice" age={25} />, document.getElementById('root'));
```

---

## Итоговые вопросы для подготовки

1. Что такое JSX, и как он работает в React?
2. В чём разница между функциональными и классовыми компонентами?
3. Как передавать данные в компонент с помощью props?
4. Как задать значения props по умолчанию?
5. Какие ошибки могут возникнуть при неправильной передаче props?

**Совет:** Практикуйте создание компонентов и работу с props, чтобы уверенно применять эти концепции в реальных проектах.

