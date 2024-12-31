# CSS Анимация: Основы и Управление (Transition, Animation, JS)

## 1. Transition: Переходы

### Основы Transition
`Transition` используется для создания плавных переходов между состояниями элемента при изменении CSS-свойств.

### Ключевые свойства
- `transition-property`: Какие свойства анимировать.
- `transition-duration`: Длительность анимации.
- `transition-timing-function`: Скорость изменения (например, `ease`, `linear`).
- `transition-delay`: Задержка перед началом.

### Пример
```html
<button class="btn">Наведи</button>
```
```css
.btn {
  background-color: blue;
  color: white;
  transition: background-color 0.3s ease;
}

.btn:hover {
  background-color: red;
}
```
**Разбор:** При наведении на кнопку цвет меняется плавно за 0.3 секунды.

### Основные вопросы
1. Как работает `transition-property`?
2. Чем отличается `ease-in` от `ease-out`?

---

## 2. Animation: Ключевые кадры

### Основы Animation
`Animation` позволяет создавать более сложные эффекты с использованием ключевых кадров (`@keyframes`).

### Ключевые свойства
- `animation-name`: Имя анимации.
- `animation-duration`: Длительность анимации.
- `animation-iteration-count`: Количество повторений (или `infinite`).
- `animation-direction`: Направление (`normal`, `reverse`, `alternate`).

### Пример
```html
<div class="box"></div>
```
```css
@keyframes move {
  0% {
    transform: translateX(0);
  }
  100% {
    transform: translateX(100px);
  }
}

.box {
  animation: move 2s infinite;
}
```
**Разбор:** Элемент двигается вправо и повторяет анимацию каждые 2 секунды.

### Основные вопросы
1. Как остановить анимацию на последнем кадре?
2. Что делает `animation-fill-mode: forwards`?

---

## 3. Управление через JavaScript

### Основы управления
JavaScript позволяет динамически изменять стили, запускать и останавливать анимации.

### Пример с `transition`
```html
<div id="box"></div>
```
```css
#box {
  width: 100px;
  height: 100px;
  background-color: blue;
  transition: transform 0.5s;
}
```
```javascript
const box = document.getElementById('box');
box.addEventListener('click', () => {
  box.style.transform = 'scale(1.5)';
});
```
**Разбор:** При клике элемент увеличивается за 0.5 секунды.

### Пример с `animation`
```javascript
const circle = document.getElementById('circle');
circle.style.animation = 'grow 1s forwards';
```
**Разбор:** JS динамически добавляет анимацию к элементу.

### Основные вопросы
1. Как добавлять/удалять классы для управления анимацией?
2. Как использовать `requestAnimationFrame` вместо CSS-анимации?

---

## Итоговые вопросы для подготовки
1. Как работают `transition` и `animation` на уровне браузера?
2. В чем разница между `transition` и `animation`?
3. Как управлять анимациями в реальном времени с помощью JavaScript?

**Совет:** Отработайте примеры самостоятельно, чтобы понять поведение анимаций в разных условиях.

