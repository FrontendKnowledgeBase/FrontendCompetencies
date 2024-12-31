# Событийная модель в JavaScript: EventListener, Event Bubbling

JavaScript обеспечивает мощную событийную модель, которая позволяет взаимодействовать с элементами DOM. Основные понятия, которые необходимо понимать: **EventListener** и **всплытие событий (Event Bubbling)**.

## 1. EventListener

### Что такое EventListener?
**EventListener** — это механизм, который позволяет привязывать обработчики событий к элементам DOM. Эти обработчики выполняются при наступлении определённого события, например, клика мыши или нажатия клавиши.

### Основные методы
- **`addEventListener`**: Добавляет обработчик события.
- **`removeEventListener`**: Удаляет ранее добавленный обработчик.

### Пример использования
```javascript
const button = document.getElementById('myButton');

// Добавление обработчика события
button.addEventListener('click', () => {
  console.log('Button clicked!');
});

// Удаление обработчика события
const handler = () => {
  console.log('Handler removed');
};
button.addEventListener('click', handler);
button.removeEventListener('click', handler);
```

### Параметры `addEventListener`
1. **Тип события**: Например, `'click'`, `'keydown'`, `'submit'`.
2. **Функция-обработчик**: Код, который будет выполнен при наступлении события.
3. **Опции**:
   - `capture`: Указывает, должен ли обработчик работать на стадии захвата.
   - `once`: Выполнить обработчик только один раз.
   - `passive`: Указывает, что обработчик не будет вызывать `preventDefault`.

Пример с опциями:
```javascript
button.addEventListener('click', () => {
  console.log('Clicked once!');
}, { once: true });
```

---

## 2. Всплытие событий (Event Bubbling)

### Что такое всплытие?
События в JavaScript распространяются от целевого элемента к его родителям, доходя до корневого элемента (обычно `document`). Это называется **всплытием**.

### Пример всплытия
HTML:
```html
<div id="parent">
  <button id="child">Click me</button>
</div>
```

JavaScript:
```javascript
const parent = document.getElementById('parent');
const child = document.getElementById('child');

parent.addEventListener('click', () => {
  console.log('Parent clicked!');
});

child.addEventListener('click', () => {
  console.log('Child clicked!');
});
```

**Результат:** При клике на кнопку будет выведено:
1. `Child clicked!`
2. `Parent clicked!` (событие "всплыло" от дочернего элемента к родительскому).

### Как остановить всплытие?
С помощью метода `stopPropagation` можно предотвратить дальнейшее распространение события.

Пример:
```javascript
child.addEventListener('click', (event) => {
  console.log('Child clicked!');
  event.stopPropagation(); // Событие не "всплывает" к родителю
});
```

### Фазы событий
Событие проходит через три фазы:
1. **Захват (Capture phase)**: Событие идёт сверху вниз, от `document` к целевому элементу.
2. **Целевая фаза (Target phase)**: Событие достигает целевого элемента.
3. **Всплытие (Bubbling phase)**: Событие "всплывает" от целевого элемента к корневому.

Пример с фазами:
```javascript
parent.addEventListener('click', () => {
  console.log('Parent - capturing phase');
}, true); // Захват

child.addEventListener('click', () => {
  console.log('Child - target phase');
}); // Цель

parent.addEventListener('click', () => {
  console.log('Parent - bubbling phase');
}); // Всплытие
```

**Результат при клике на `child`:**
1. `Parent - capturing phase`
2. `Child - target phase`
3. `Parent - bubbling phase`

---

## Итоговые вопросы для подготовки

1. Что такое EventListener, и как его использовать?
2. Чем отличается всплытие событий от захвата?
3. Как остановить всплытие события?
4. Для чего используются опции `capture`, `once`, и `passive`?

**Совет:** Попробуйте реализовать примеры с разными фазами и опциями, чтобы лучше понять событийную модель.

