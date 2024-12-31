# Работа с DOM: создание, поиск, вставка, удаление и перемещение элементов

Document Object Model (DOM) представляет собой интерфейс, позволяющий JavaScript взаимодействовать с HTML и XML-документами. Знание методов манипуляции DOM-элементами — ключевой навык для веб-разработчика.

## 1. Создание элементов

### Метод `document.createElement`
Позволяет создавать новые элементы DOM.

Пример:
```javascript
const newDiv = document.createElement('div');
newDiv.textContent = 'Привет, мир!';
newDiv.className = 'example';
console.log(newDiv); // <div class="example">Привет, мир!</div>
```

### Атрибуты и свойства элемента
- Используйте `setAttribute` и `getAttribute` для работы с атрибутами.
- Прямо изменяйте свойства объекта для работы со свойствами DOM.

Пример:
```javascript
const link = document.createElement('a');
link.setAttribute('href', 'https://example.com');
link.textContent = 'Перейти на сайт';
link.target = '_blank';
console.log(link); // <a href="https://example.com" target="_blank">Перейти на сайт</a>
```

---

## 2. Поиск элементов

### Основные методы
1. **`document.getElementById`**: Возвращает элемент по его `id`.
2. **`document.querySelector`**: Возвращает первый элемент, соответствующий CSS-селектору.
3. **`document.querySelectorAll`**: Возвращает все элементы, соответствующие CSS-селектору.

Примеры:
```javascript
const elementById = document.getElementById('header');
const firstParagraph = document.querySelector('p');
const allParagraphs = document.querySelectorAll('p');

console.log(elementById);
console.log(firstParagraph);
console.log(allParagraphs);
```

### Навигация по DOM
- **`parentNode`**: Родительский элемент.
- **`children`**: Прямые дочерние элементы.
- **`nextSibling`** и **`previousSibling`**: Соседние узлы.

Пример:
```javascript
const listItem = document.querySelector('li');
console.log(listItem.parentNode); // Родительский элемент
console.log(listItem.nextSibling); // Следующий узел
console.log(listItem.children); // Дочерние элементы
```

---

## 3. Вставка элементов

### Метод `append`
Добавляет элемент в конец родителя.
```javascript
const container = document.getElementById('container');
const newItem = document.createElement('div');
newItem.textContent = 'Новый элемент';
container.append(newItem);
```

### Метод `prepend`
Добавляет элемент в начало родителя.
```javascript
container.prepend(newItem);
```

### Метод `insertBefore`
Вставляет элемент перед указанным дочерним элементом.
```javascript
const referenceNode = container.firstElementChild;
container.insertBefore(newItem, referenceNode);
```

---

## 4. Удаление элементов

### Метод `remove`
Удаляет элемент из DOM.
```javascript
const elementToRemove = document.querySelector('.to-remove');
elementToRemove.remove();
```

### Метод `removeChild`
Удаляет дочерний элемент через родителя.
```javascript
const parent = document.getElementById('list');
const child = document.querySelector('li');
parent.removeChild(child);
```

---

## 5. Перемещение элементов

Перемещение в DOM осуществляется путём повторного добавления элемента в новое место.

### Пример перемещения
```javascript
const list = document.getElementById('list');
const itemToMove = document.querySelector('.item');

list.append(itemToMove); // Перемещение в конец списка
list.insertBefore(itemToMove, list.firstElementChild); // Перемещение в начало
```

---

## Итоговые вопросы для подготовки

1. Как создать элемент в DOM и задать ему атрибуты?
2. Какие методы используются для поиска элементов в DOM?
3. Как вставить элемент в начало или конец родителя?
4. Чем отличается `remove` от `removeChild`?
5. Как перемещать элементы внутри DOM?

**Совет:** Практикуйтесь с созданием, вставкой и удалением элементов в реальных проектах, чтобы лучше понять работу с DOM.

