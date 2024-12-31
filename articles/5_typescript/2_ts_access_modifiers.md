# Модификаторы доступа в TypeScript: public, private, protected

Модификаторы доступа в TypeScript используются для управления видимостью свойств и методов классов. Они позволяют создавать более структурированный и безопасный код, защищая внутренние детали реализации.

---

## 1. Public (Публичный доступ)

### Что это?
- Свойства и методы с модификатором `public` доступны везде: внутри класса, из подклассов и извне.
- **По умолчанию** все свойства и методы класса в TypeScript являются `public`.

### Пример
```typescript
class Person {
  public name: string;

  constructor(name: string) {
    this.name = name;
  }

  public greet(): void {
    console.log(`Hello, my name is ${this.name}`);
  }
}

const person = new Person("Alice");
console.log(person.name); // Доступно
person.greet(); // Доступно
```

---

## 2. Private (Приватный доступ)

### Что это?
- Свойства и методы с модификатором `private` доступны только внутри самого класса.
- Они недоступны извне или в подклассах.

### Пример
```typescript
class BankAccount {
  private balance: number;

  constructor(initialBalance: number) {
    this.balance = initialBalance;
  }

  public deposit(amount: number): void {
    this.balance += amount;
  }

  public getBalance(): number {
    return this.balance;
  }
}

const account = new BankAccount(1000);
account.deposit(500);
console.log(account.getBalance()); // 1500
// console.log(account.balance); // Ошибка: свойство "balance" недоступно
```

---

## 3. Protected (Защищённый доступ)

### Что это?
- Свойства и методы с модификатором `protected` доступны внутри класса и его подклассов, но недоступны извне.

### Пример
```typescript
class Vehicle {
  protected speed: number;

  constructor(speed: number) {
    this.speed = speed;
  }

  protected displaySpeed(): void {
    console.log(`Speed: ${this.speed} km/h`);
  }
}

class Car extends Vehicle {
  private brand: string;

  constructor(brand: string, speed: number) {
    super(speed);
    this.brand = brand;
  }

  public showDetails(): void {
    console.log(`Brand: ${this.brand}`);
    this.displaySpeed();
  }
}

const car = new Car("Toyota", 120);
car.showDetails();
// car.displaySpeed(); // Ошибка: метод "displaySpeed" недоступен извне
```

---

## 4. Сравнение модификаторов доступа

| Модификатор | Видимость в классе | Видимость в подклассах | Видимость извне |
|-------------|--------------------|------------------------|-----------------|
| `public`    | ✅                 | ✅                     | ✅               |
| `private`   | ✅                 | ❌                     | ❌               |
| `protected` | ✅                 | ✅                     | ❌               |

---

## 5. Использование модификаторов в конструкторах

TypeScript позволяет задавать модификаторы прямо в параметрах конструктора, что упрощает код.

### Пример
```typescript
class User {
  constructor(
    public username: string,
    private password: string,
    protected email: string
  ) {}

  public getEmail(): string {
    return this.email;
  }
}

const user = new User("john_doe", "securePass", "john@example.com");
console.log(user.username); // Доступно
// console.log(user.password); // Ошибка: свойство "password" недоступно
console.log(user.getEmail()); // Доступно
```

---

## Итоговые вопросы для подготовки

1. Чем отличаются `public`, `private` и `protected`?
2. В каких случаях использовать `protected`, а не `private`?
3. Как задать модификаторы доступа прямо в конструкторе?
4. Почему использование `private` повышает безопасность кода?
5. Какие ошибки могут возникнуть при неправильном применении модификаторов?

**Совет:** Экспериментируйте с разными модификаторами доступа, чтобы лучше понять их особенности и научиться эффективно применять их в реальных проектах.