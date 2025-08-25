
# 🌤️ Weather App with Flutter & WeatherAPI

A clean and elegant weather app built with **Flutter**, powered by real-time data from **WeatherAPI.com**.

Users can search for any city and view the current weather conditions, including temperature, weather state, and min/max temperatures. The UI is styled with gradients and dynamic updates.

---

## 📱 Preview

<p align="center">

  <img width="30%" alt="Process 2" src="https://github.com/user-attachments/assets/dfdaedb8-75c6-4199-81b5-ea2cea88fb46" />
  <img width="30%" alt="Process 3" src="https://github.com/user-attachments/assets/011b710d-e1aa-4446-a05e-d1b3d40cce7a" />
  <img width="30%" alt="Process 4" src="https://github.com/user-attachments/assets/b3272f05-8c2a-404f-9b6c-ce6df20e3f9d" />

</p>
---

## 📝 Features

This Flutter-based weather application includes:

- City search functionality with a `TextField`
- Fetches **real-time weather** using [WeatherAPI.com](https://www.weatherapi.com/docs/)
- Displays:
  - City name & update time
  - Current temperature & weather state
  - Max/Min temperature forecast
  - Weather condition icon (from API)
- Handles loading and error states
- Custom gradient background and structured layout
- State management using `StatefulWidget` + `didUpdateWidget` for dynamic updates

---

## 📂 Project Structure

```
lib/
├── models/
│   └── weather_model.dart         # Weather model with fields like temperature, city, etc.
│
├── services/
│   └── weather_service.dart       # API logic to fetch weather using Dio
│
├── views/
│   ├── city_screen.dart           # Main weather screen with details
│   └── search_screen.dart         # Search input page
│   └── home_screen.dart           # The start of Application 
│
└── main.dart                      # Entry point
```

---

## 🛠 Technologies Used

- **Flutter (Dart)**
- **WeatherAPI** (via Dio for HTTP requests)
- Gradient UI using `BoxDecoration`
- State Management with `StatefulWidget` & `setState`
- Error and loading handling

---

## 📦 How to Run

### 🔧 Prerequisites

- Flutter SDK installed
- WeatherAPI key from [weatherapi.com](https://weatherapi.com/)

### ▶️ Steps

1. Clone the repository:

```bash
git clone https://github.com/RokiyaAbdElsatar/weather_App.git
cd weather_app_flutter
```

2. Replace `YOUR_API_KEY` in `weather_service.dart`:

```dart
'http://api.weatherapi.com/v1/forecast.json?key=YOUR_API_KEY&q=$city&days=1'
```

3. Run the app:

```bash
flutter pub get
flutter run
```

---

## 🧾 Additional Setup

### ✅ pubspec.yaml dependencies

```yaml
dependencies:
  flutter:
    sdk: flutter
  dio: ^5.9.0
```

---

## 📌 Notes

- Ensure internet connection for weather data to load.
- If the API fails, a graceful fallback error message is shown.
- The app UI is mobile-friendly and adapts well to different screen sizes.

---

## 🧑‍💻 Author

- **Rokiya Abd Elsatar**

---

## 📄 License

This project is open source and available under the MIT License.
