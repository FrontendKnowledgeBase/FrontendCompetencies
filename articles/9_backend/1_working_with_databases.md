# Работа с базами данных и ORM: PostgreSQL, MySQL, MongoDB, TypeORM, Prisma, Mongoose

Работа с базами данных — это один из ключевых аспектов бэкенд-разработки. Выбор подходящей базы данных и использование ORM (Object-Relational Mapping) помогает упростить управление данными, ускорить разработку и обеспечить масштабируемость приложения.

---

## 1. Типы баз данных

### 1.1 Реляционные базы данных
- Хранят данные в виде таблиц.
- Используют SQL (Structured Query Language) для работы с данными.
- Примеры: PostgreSQL, MySQL.

### 1.2 Документные базы данных
- Хранят данные в виде документов (JSON, BSON).
- Примеры: MongoDB.

---

## 2. Работа с реляционными базами данных

### Основные операции в SQL
1. **Создание таблиц**
```sql
CREATE TABLE users (
  id SERIAL PRIMARY KEY,
  name VARCHAR(100),
  email VARCHAR(100) UNIQUE
);
```

2. **Добавление данных**
```sql
INSERT INTO users (name, email) VALUES ('John Doe', 'john@example.com');
```

3. **Извлечение данных**
```sql
SELECT * FROM users;
```

4. **Обновление данных**
```sql
UPDATE users SET name = 'Jane Doe' WHERE id = 1;
```

5. **Удаление данных**
```sql
DELETE FROM users WHERE id = 1;
```

### Настройка PostgreSQL в Node.js
1. Установка модуля:
   ```bash
   npm install pg
   ```
2. Подключение к базе данных:
   ```javascript
   const { Pool } = require('pg');
   const pool = new Pool({
     user: 'user',
     host: 'localhost',
     database: 'testdb',
     password: 'password',
     port: 5432
   });

   pool.query('SELECT NOW()', (err, res) => {
     console.log(err, res);
     pool.end();
   });
   ```

---

## 3. Работа с документными базами данных

### MongoDB
1. Установка модуля:
   ```bash
   npm install mongoose
   ```
2. Определение схемы и модели:
   ```javascript
   const mongoose = require('mongoose');

   const userSchema = new mongoose.Schema({
     name: String,
     email: { type: String, unique: true }
   });

   const User = mongoose.model('User', userSchema);

   mongoose.connect('mongodb://localhost:27017/testdb');
   ```
3. CRUD операции:
   ```javascript
   const newUser = new User({ name: 'John Doe', email: 'john@example.com' });
   newUser.save().then(() => console.log('User saved!'));
   ```

---

## 4. ORM: Объектно-реляционное отображение

### Что такое ORM?
- ORM позволяет взаимодействовать с базой данных через объектно-ориентированный код вместо SQL-запросов.

### Популярные ORM
1. **TypeORM** (для TypeScript/JavaScript).
2. **Prisma** (модернизированное ORM с поддержкой схем).
3. **Mongoose** (для MongoDB).

---

## 5. Примеры использования ORM

### 5.1 TypeORM (PostgreSQL, MySQL)
1. Установка:
   ```bash
   npm install typeorm reflect-metadata
   ```
2. Создание сущности:
   ```typescript
   import { Entity, PrimaryGeneratedColumn, Column } from 'typeorm';

   @Entity()
   export class User {
     @PrimaryGeneratedColumn()
     id: number;

     @Column()
     name: string;

     @Column()
     email: string;
   }
   ```
3. Работа с данными:
   ```typescript
   const user = new User();
   user.name = 'John Doe';
   user.email = 'john@example.com';
   await dataSource.manager.save(user);
   ```

### 5.2 Prisma
1. Установка:
   ```bash
   npm install prisma
   ```
2. Инициализация:
   ```bash
   npx prisma init
   ```
3. Пример схемы (`prisma/schema.prisma`):
   ```prisma
   model User {
     id    Int    @id @default(autoincrement())
     name  String
     email String @unique
   }
   ```
4. Работа с данными:
   ```javascript
   const { PrismaClient } = require('@prisma/client');
   const prisma = new PrismaClient();

   async function main() {
     const user = await prisma.user.create({
       data: {
         name: 'John Doe',
         email: 'john@example.com'
       }
     });
     console.log(user);
   }

   main();
   ```

---

## Итоговые вопросы для подготовки

1. Чем отличаются реляционные базы данных от документных?
2. Какие преимущества даёт использование ORM?
3. Как работают основные операции CRUD?
4. Чем Prisma отличается от TypeORM?
5. Как выбрать подходящую базу данных для проекта?

**Совет:** Попробуйте настроить простую базу данных и реализовать базовые CRUD-операции с использованием SQL и ORM, чтобы лучше понять работу с ними.

