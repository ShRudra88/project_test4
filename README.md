# 🛍️ Flutter Product App

A modern Flutter app built with **GetX** for routing and state management. This app demonstrates API integration, search, filtering, image carousels, and reusable components using clean architecture.

---

## ✨ Features

- 🔄 Fetch products from DummyJSON API
- 🔍 Search products by title
- 📂 Filter by product category
- 📄 Product details page with image carousel
- 🚀 GetX for routing, state, and dependency management
- 💻 Clean architecture & modern UI
- 📱 Fully responsive design
- 🎨 Custom centralized theme
- 🔄 Loading indicators and shimmer effect

---

## 📦 Dependencies

```yaml
get: ^4.6.6
carousel_slider: ^4.2.0
shimmer: ^3.0.0
http: ^0.13.6




lib/
│
├── controllers/       → GetX controllers
├── models/            → Data models
├── services/          → API service layer
├── views/             → UI screens
│   ├── widgets/       → Reusable widgets
├── theme/             → App theme and styles
└── main.dart          → Entry point with GetMaterialApp
