# Паттерны проектирования: порождающие, структурные, поведенческие

Паттерны проектирования — это проверенные решения распространённых задач в разработке. Они помогают организовать код, сделать его читаемым, масштабируемым и удобным для поддержки. В этой статье рассмотрим основные группы паттернов: порождающие, структурные и поведенческие.

---

## 1. Порождающие паттерны
Порождающие паттерны отвечают за создание объектов, предоставляя гибкие механизмы их инстанцирования.

### 1.1 Singleton (Одиночка)
Обеспечивает создание только одного экземпляра класса и предоставляет глобальную точку доступа к нему.

#### Пример на JavaScript
```javascript
class Singleton {
  constructor() {
    if (Singleton.instance) {
      return Singleton.instance;
    }
    Singleton.instance = this;
  }

  getInstance() {
    return this;
  }
}

const instance1 = new Singleton();
const instance2 = new Singleton();
console.log(instance1 === instance2); // true
```

### 1.2 Factory Method (Фабричный метод)
Определяет интерфейс для создания объектов, позволяя подклассам изменять тип создаваемого объекта.

#### Пример
```javascript
class ShapeFactory {
  createShape(type) {
    switch (type) {
      case 'circle':
        return new Circle();
      case 'square':
        return new Square();
      default:
        throw new Error('Unknown shape type');
    }
  }
}
```

---

## 2. Структурные паттерны
Структурные паттерны помогают организовать классы и объекты в крупные структуры.

### 2.1 Decorator (Декоратор)
Добавляет новый функционал объекту без изменения его структуры.

#### Пример
```javascript
class Coffee {
  cost() {
    return 5;
  }
}

class MilkDecorator {
  constructor(coffee) {
    this.coffee = coffee;
  }

  cost() {
    return this.coffee.cost() + 2;
  }
}

const coffee = new Coffee();
const milkCoffee = new MilkDecorator(coffee);
console.log(milkCoffee.cost()); // 7
```

### 2.2 Facade (Фасад)
Предоставляет упрощённый интерфейс к сложной системе.

#### Пример
```javascript
class SubsystemA {
  operationA() {
    return 'SubsystemA: Ready!';
  }
}

class SubsystemB {
  operationB() {
    return 'SubsystemB: Go!';
  }
}

class Facade {
  constructor() {
    this.subsystemA = new SubsystemA();
    this.subsystemB = new SubsystemB();
  }

  operation() {
    return `${this.subsystemA.operationA()} and ${this.subsystemB.operationB()}`;
  }
}

const facade = new Facade();
console.log(facade.operation());
```

---

## 3. Поведенческие паттерны
Поведенческие паттерны отвечают за взаимодействие между объектами.

### 3.1 Observer (Наблюдатель)
Определяет зависимость типа "один ко многим", так что изменение состояния одного объекта уведомляет всех наблюдателей.

#### Пример
```javascript
class Subject {
  constructor() {
    this.observers = [];
  }

  addObserver(observer) {
    this.observers.push(observer);
  }

  notify() {
    this.observers.forEach(observer => observer.update());
  }
}

class Observer {
  update() {
    console.log('Observer notified!');
  }
}

const subject = new Subject();
const observer1 = new Observer();
const observer2 = new Observer();

subject.addObserver(observer1);
subject.addObserver(observer2);
subject.notify();
```

### 3.2 Mediator (Посредник)
Обеспечивает централизованное взаимодействие между объектами.

#### Пример
```javascript
class Mediator {
  notify(sender, event) {
    console.log(`Sender: ${sender}, Event: ${event}`);
  }
}

class Component {
  constructor(mediator) {
    this.mediator = mediator;
  }

  send(event) {
    this.mediator.notify(this.constructor.name, event);
  }
}

const mediator = new Mediator();
const component = new Component(mediator);
component.send('Action');
```

---

## Итоговые вопросы для подготовки

1. Чем отличается Singleton от Factory Method?
2. В каких случаях использовать Decorator, а не наследование?
3. Как Observer помогает реализовать реактивное поведение?
4. Чем Mediator отличается от прямого взаимодействия объектов?
5. В чём основные преимущества использования паттернов проектирования?

**Совет:** Практикуйте реализацию паттернов в небольших проектах, чтобы закрепить их понимание.

