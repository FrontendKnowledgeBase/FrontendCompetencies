# Асинхронное программирование в JavaScript: Callback, Promise, Async/Await, EventLoop

Асинхронное программирование в JavaScript позволяет выполнять долгосрочные операции, такие как запросы к серверу или задержки, не блокируя основной поток. Основные инструменты асинхронного программирования — это **callback**, **Promise**, **async/await** и понимание **Event Loop**.

## 1. Callback

### Что такое Callback?
**Callback** — это функция, переданная в качестве аргумента другой функции, которая будет вызвана после завершения асинхронной операции.

### Пример использования
```javascript
function fetchData(callback) {
  setTimeout(() => {
    callback('Данные загружены');
  }, 1000);
}

fetchData((data) => {
  console.log(data); // 'Данные загружены'
});
```

### Недостатки
- **Callback Hell**: Вложенные колбэки создают сложный и трудно читаемый код.

Пример:
```javascript
setTimeout(() => {
  console.log('Сначала');
  setTimeout(() => {
    console.log('Потом');
    setTimeout(() => {
      console.log('Наконец');
    }, 1000);
  }, 1000);
}, 1000);
```

---

## 2. Promise

### Что такое Promise?
**Promise** — это объект, представляющий результат асинхронной операции. Он может находиться в одном из состояний:
- **Pending**: Ожидание выполнения.
- **Fulfilled**: Успешное выполнение.
- **Rejected**: Ошибка выполнения.

### Пример создания Promise
```javascript
const fetchData = new Promise((resolve, reject) => {
  setTimeout(() => {
    resolve('Данные загружены');
  }, 1000);
});

fetchData
  .then((data) => {
    console.log(data); // 'Данные загружены'
  })
  .catch((error) => {
    console.error(error);
  });
```

### Преимущества
- Устранение вложенности колбэков.
- Более читаемый и предсказуемый код.

### Метод `Promise.all`
Позволяет выполнять несколько промисов параллельно и получать результат, когда все они завершатся.
```javascript
const p1 = Promise.resolve(1);
const p2 = Promise.resolve(2);
const p3 = Promise.resolve(3);

Promise.all([p1, p2, p3])
  .then((values) => {
    console.log(values); // [1, 2, 3]
  });
```

---

## 3. Async/Await

### Что такое Async/Await?
**Async/Await** — это синтаксический сахар для работы с промисами, который делает асинхронный код более читаемым.

### Пример использования
```javascript
async function fetchData() {
  try {
    const data = await new Promise((resolve) => {
      setTimeout(() => {
        resolve('Данные загружены');
      }, 1000);
    });
    console.log(data); // 'Данные загружены'
  } catch (error) {
    console.error(error);
  }
}

fetchData();
```

### Преимущества
- Линейная структура кода.
- Упрощение обработки ошибок через `try/catch`.

---

## 4. Event Loop

### Что такое Event Loop?
**Event Loop** — это механизм, который обеспечивает выполнение кода, управление вызовами функций и обработку событий.

### Как работает?
1. **Call Stack**: Основной стек вызовов, где выполняются функции.
2. **Task Queue**: Очередь задач для выполнения после стека вызовов.
3. **Microtask Queue**: Очередь задач, которые имеют приоритет над Task Queue (например, `.then` и `catch` у промисов).

### Пример работы Event Loop
```javascript
console.log('Начало');

setTimeout(() => {
  console.log('setTimeout');
}, 0);

Promise.resolve().then(() => {
  console.log('Promise');
});

console.log('Конец');
```

**Результат:**
1. `Начало`
2. `Конец`
3. `Promise`
4. `setTimeout`

**Почему?**
- Сначала выполняется весь синхронный код (Call Stack).
- Затем выполняются задачи из Microtask Queue (Promise).
- В последнюю очередь — из Task Queue (setTimeout).

---

## Итоговые вопросы для подготовки

1. Чем отличается callback от Promise?
2. Как работает метод `Promise.all`?
3. В чём преимущества использования `async/await`?
4. Как Event Loop управляет асинхронным кодом?

**Совет:** Попробуйте реализовать свои примеры с использованием всех подходов, чтобы лучше понять, как работает асинхронное программирование.

