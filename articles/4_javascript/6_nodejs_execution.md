# Как работает Node.js: Исполнение JavaScript кода (инициализация, EventLoop, модули, взаимодействие с ОС)

Node.js — это среда выполнения JavaScript вне браузера, которая используется для создания серверных приложений. Она основана на движке V8 и предоставляет дополнительные возможности, такие как взаимодействие с файловой системой, сетью и операционной системой.

## 1. Инициализация

### Что происходит при запуске Node.js?
1. **Загрузка интерпретатора V8**:
   - Node.js использует движок V8 для выполнения JavaScript-кода.
2. **Чтение и интерпретация кода**:
   - Загружается основной скрипт, переданный при запуске (`node script.js`).
3. **Инициализация модулей**:
   - Node.js инициализирует встроенные модули (`fs`, `http`, `path` и другие).
4. **Запуск Event Loop**:
   - Начинается основная обработка событий и задач.

Пример запуска:
```bash
node app.js
```

---

## 2. Event Loop

### Что такое Event Loop?
**Event Loop** — это механизм, который позволяет Node.js обрабатывать асинхронные операции, такие как запросы к базе данных или сетевые запросы, без блокировки основного потока выполнения.

### Как работает Event Loop в Node.js?
1. **Call Stack**:
   - Все функции помещаются в стек вызовов и выполняются синхронно.
2. **Task Queue**:
   - Асинхронные задачи добавляются в очередь задач после завершения выполнения.
3. **Microtask Queue**:
   - Обработка промисов имеет приоритет над Task Queue.

Пример:
```javascript
console.log('Start');

setTimeout(() => {
  console.log('Timeout');
}, 0);

Promise.resolve().then(() => {
  console.log('Promise');
});

console.log('End');
```
**Результат:**
```
Start
End
Promise
Timeout
```

---

## 3. Модули

### Система модулей в Node.js
Node.js использует стандарт CommonJS для работы с модулями.

### Экспорт и импорт модулей
1. **Экспорт модуля**:
```javascript
// math.js
function add(a, b) {
  return a + b;
}
module.exports = { add };
```

2. **Импорт модуля**:
```javascript
// app.js
const { add } = require('./math');
console.log(add(2, 3)); // 5
```

### Встроенные модули
Node.js предоставляет множество встроенных модулей:
- **fs**: Работа с файловой системой.
- **http**: Создание серверов.
- **path**: Работа с путями файлов.
- **os**: Взаимодействие с операционной системой.

Пример:
```javascript
const fs = require('fs');
fs.writeFile('example.txt', 'Hello, Node.js!', (err) => {
  if (err) throw err;
  console.log('Файл создан');
});
```

---

## 4. Взаимодействие с операционной системой

### Как Node.js взаимодействует с ОС?
1. **Файловая система**:
   - Чтение, запись и удаление файлов через модуль `fs`.
2. **Процессы**:
   - Управление процессами через модуль `child_process`.
3. **Системная информация**:
   - Получение информации об ОС через модуль `os`.

Пример получения информации об ОС:
```javascript
const os = require('os');

console.log('Платформа:', os.platform());
console.log('Архитектура:', os.arch());
console.log('Свободная память:', os.freemem());
```

Пример запуска дочернего процесса:
```javascript
const { exec } = require('child_process');
exec('ls', (error, stdout, stderr) => {
  if (error) {
    console.error(`Ошибка: ${error.message}`);
    return;
  }
  console.log(`Вывод: ${stdout}`);
});
```

---

## Итоговые вопросы для подготовки

1. Что происходит при инициализации Node.js?
2. Как работает Event Loop в Node.js?
3. Чем отличаются Task Queue и Microtask Queue?
4. Как работают встроенные модули Node.js?
5. Как взаимодействовать с файловой системой через Node.js?
6. Как запускать системные команды с помощью Node.js?

**Совет:** Исследуйте встроенные модули Node.js и изучите их документацию, чтобы понять их возможности.

