# FrontendCompetencies

## Сборник статей по компетенциям фронтенд разработки

Статьи представлены в формате markdown.
Есть отдельный web ui проект [FrontendAssesmentUI](https://github.com/FrontendKnowledgeBase/FrontendAssesmentUI) для удобного просмотра.

## Оглавление

### 1. Браузер

- [Как работают браузеры: принципы работы современных веб-браузеров? (Парсинг, Лексические анализаторы, Построение дерева, Компоновка, Отрисовка)](./articles/1_browser/1_browser_basics-dom-rendering.md)
- [Хранение данных API (Cookie, LocalStorage, SessionStorage)](./articles/1_browser/2_data_storage-cookies-localstorage.md)
- [Сетевые запросы API (XMLHttpRequest, Fetch, WebSocket)](./articles/1_browser/3_network_api_requests.md)
- [Измерение и мониторинг API: Navigation Timing API, window.performance, beacon](./articles/1_browser/4_measuring-and-monitoring.md)
- [Коммуникация между вкладками API: Workers, Broadcast Channel, iframe, postMessage](./articles/1_browser/5_communication-between-tabs.md)
- [Безопасность в браузере: CORS, CSP, вектора атак и способы защиты (CORS, CSRF, XSS)](./articles/1_browser/6_browser_security.md)
- [Инструменты разработчика DevTools: Debugger, Network, Timeline, Profiling](./articles/1_browser/7_developer_tools.md)
- [Workers: ServiceWorker, WebWorkers, SharedWorkers](./articles/1_browser/8_workers.md)
- [Производительность в браузере: профилирование загрузки и отрисовки, профилирование производительности и памяти](./articles/1_browser/9_browser_performance.md)

### 2. Сетевое взаимодействие

- [Понимание принципов работы протокола HTTP/HTTPS](./articles/2_networking/1_http_protocol.md)
- [Способы взаимодействия по сети: REST, GraphQL, WebSocket, SSE, Polling](./articles/2_networking/2_network_interaction_methods.md)

### 3. HTML и CSS

- [Верстка: Семантика, SEO, доступность](./articles/3_html_css/1_markup_semantics_seo_accessibility.md)
- [Базовые знания CSS: Selectors, Specificity, Variables](./articles/3_html_css/2_css_basic_selectors_specificity_vars.md)
- [Модели лэйаута CSS: Float, Flexbox, Grids, Tables](./articles/3_html_css/3_css_layout_models.md)
- [Различные методологии CSS и их особенности: BEM, SMACSS, OOCSS, Modules](./articles/3_html_css/4_css_methodologies.md)
- [CSS Анимация: Основы и Управление (Transition, Animation, JS)](./articles/3_html_css/5_css_animation_guide.md)
- [Адаптивность: Media Query, адаптация под печать, особенности разных платформ](./articles/3_html_css/6_adaptivity_media-quety_printing.md)
- [Оптимизация производительности в браузере: Layers, Paint, Flow, Repaint, Reflow, Composite](./articles/3_html_css/7_performance_optimisation.md)
- [Шрифты и типографика: Custom Fonts, форматы, техники, оптимизация шрифтов](./articles/3_html_css/8_fonts_and_typography.md)
- [Работа с изображениями: Sprite, иконки, picture](./articles/3_html_css/9_image_handling_in_web.md)

### 4. JavaScript

- [Базовые знания JavaScript: типы данных, всплытие, области видимости, контекст, замыкания, мутабельность](./articles/4_javascript/1_js_basics.md)
- [Событийная модель в JavaScript: EventListener, Event Bubbling](./articles/4_javascript/2_event_model_js.md)
- [Асинхронное программирование в JavaScript: Callback, Promise, Async/Await, EventLoop](./articles/4_javascript/3_async_programming.md)
- [Как работают JavaScript-движки: V8, VM, GC, оптимизации и деоптимизации](./articles/4_javascript/5_js_engines.md)
- [Как работает Node.js: Исполнение JavaScript кода (инициализация, EventLoop, модули, взаимодействие с ОС)](./articles/4_javascript/6_nodejs_execution.md)
- [Типизация в JavaScript: JSDoc, TypeScript (type, generics, guards, infer)](./articles/4_javascript/7_js_typing.md)
- [Работа с DOM: создание, поиск, вставка, удаление и перемещение элементов](./articles/4_javascript/8_dom_manipulation.md)

### 5. TypeScript

- [Основы TypeScript: типы, интерфейсы, generics](./articles/5_typescript/1_typescript_basics.md)
- [Модификаторы доступа в TypeScript: public, private, protected](./articles/5_typescript/2_ts_access_modifiers.md)
- [Утилитарные типы в TypeScript: Pick, Omit, Partial](./articles/5_typescript/3_ts_utility_types.md)
- [Типизация React-компонентов в TypeScript: props, state, хуки](./articles/5_typescript/4_ts_with_react.md)
- [Настройка TypeScript: tsconfig.json, ESLint](./articles/5_typescript/5_ts_configuration.md)

### 6. ReactJS

- [Основы React: JSX, компоненты, props](./articles/6_reactjs/1_react_basics.md)
- [Хуки в React: все основные хуки](./articles/6_reactjs/2_react_hooks.md)
- [Управление состоянием через Context API](./articles/6_reactjs/3_react_context.md)
- [Маршрутизация: основы React Router (современная версия)](./articles/6_reactjs/4_react_routing.md)
- [Оптимизация в React: React.memo, Server Components](./articles/6_reactjs/5_react_optimization.md)

### 7. Менеджеры состояний

- [Основы Redux: стор, экшены, редьюсеры](./articles/7-state-managers/1_redux_basics.md)
- [Redux Toolkit: createSlice, createAsyncThunk](./articles/7-state-managers/2_redux_toolkit.md)
- [Хуки Redux: useDispatch, useSelector](./articles/7-state-managers/3_redux_hooks.md)
- [Управление состоянием с помощью Apollo GraphQL](./articles/7-state-managers/4_apollo_graphql.md)
- [Альтернативы Redux: Context API, Zustand, Recoil](./articles/7-state-managers/5_alternative_state.md)
- [Альтернативы Redux: Context API, Zustand, Recoil, Apollo GraphQL](./articles/7-state-managers/6_state_comparison.md)

### 8. Архитектура, веб-разработка и Computer Science

- [Алгоритмы: Принципы, оценка сложности, O(n), O(log n)](./articles/8_architecture_webdev_computer_science/1_algorith_basics.md)
- [Структуры данных: Lists, LinkedList, HashTable, Stacks, Queue, Graphs, Tree](./articles/8_architecture_webdev_computer_science/2_data_structgures.md)
- [Разработка архитектуры SPA на современном стеке: организация проекта, файловая структура, feature-slices, DDD](./articles/8_architecture_webdev_computer_science/3_spa_architecture.md)
- [Интеграция статического анализа и тестирования кода: Linters, Formatters, Builds, Tests, Conventional Commits](./articles/8_architecture_webdev_computer_science/4_code_analysis_and_testing.md)
- [Интеграция сборки и автоматизация процессов разработки: CI/CD](./articles/8_architecture_webdev_computer_science/5_ci-cd_integration.md)
- [Паттерны проектирования: порождающие, структурные, поведенческие](./articles/8_architecture_webdev_computer_science/6_design_patterns.md)
- [Функциональное, объектно-ориентированное, реактивное, императивное и декларативное программирование](./articles/8_architecture_webdev_computer_science/7_programming_paradigms.md)

### 9. Backend

- [Работа с базами данных и ORM: PostgreSQL, MySQL, MongoDB, TypeORM, Prisma, Mongoose](./articles/9_backend/1_working_with_databases.md)
- [Работа с API (Swagger, OpenAPI Definitions, REST)](./articles/9_backend/2_working_with_api.md)
- [Кеширование (Redis, CDN, кеширование на стороне клиента)](./articles/9_backend/3_caching_redis_cdn_client.md)

### 10. Управление качеством

- [Тестирование: управление качеством](./articles/10_quality_management/1_testing.md)
- [Автоматизация тестирования](./articles/10_quality_management/2_test_automation.md)
