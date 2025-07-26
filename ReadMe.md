# 👶 The Tiny Toes – Baby Gallery App

A simple baby photo gallery app built with Flutter and Provider for state management.  
This project uses [JSONPlaceholder](https://jsonplaceholder.typicode.com/) for dummy API data.

---

## 📱 Features

- 🔐 Login system with session persistence
- 👤 View users list
- 📸 View user albums and photos
- 🖼️ View photos fullscreen with details
- ⬆️ Upload UI for new images (frontend only)
- 🧭 Shared navbar with logout and username display

---

## 🚀 Getting Started

### ✅ Prerequisites

Make sure you have the following installed:

| Tool    | Version  |
| ------- | -------- |
| Flutter | `3.19.6` |
| Dart    | `3.3.3`  |
| Java    | `17`     |

> Run `flutter doctor` to verify.

---

### 🛠️ Project Structure

```bash
the-tiny-toes/
├── apps/                      # Flutter project folder
│   └── the_tiny_toes/         # Main Flutter app
├── README.md                  # You are here
```

---

### 📦 Packages Used

```yaml
provider: ^6.1.2
shared_preferences: ^2.2.2
http: ^1.2.1
image_picker: ^1.1.1
```

---

### ▶️ Run the App

```bash
cd the-tiny-toes/apps/the_tiny_toes
flutter pub get
flutter run
```

---

## 🔐 Login Credentials

| Username | Password |
| -------- | -------- |
| admin    | admin123 |

Only these credentials will log in. They are hardcoded in `auth_provider.dart`.

---

## 📂 Screens Summary

| Screen        | Description                        |
| ------------- | ---------------------------------- |
| LoginScreen   | Login using hardcoded credentials  |
| UsersScreen   | View all users                     |
| AlbumsScreen  | View albums of selected user       |
| GalleryScreen | View photos of selected album      |
| PhotoDetail   | View full photo and details        |
| UploadScreen  | Pick image & enter title (UI only) |

---

## 👤 Author

**Sachith Lakshan**
Built as part of a Flutter internship project.

---

## 📄 License

Free to use for learning purposes.
