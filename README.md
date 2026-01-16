Dziennik Lokalizacji

Aplikacja Flutter do zapisywania i zarządzania wpisami z lokalizacją GPS.

![Flutter](https://img.shields.io/badge/Flutter-3.13+-02569B?style=flat-square&logo=flutter)
![Dart](https://img.shields.io/badge/Dart-3.1+-0175C2?style=flat-square&logo=dart)
![License](https://img.shields.io/badge/License-MIT-green?style=flat-square)

---

Opis projektu

**Dziennik Lokalizacji** to aplikacja mobilna stworzona w Flutter, która pozwala użytkownikom:
- Zapisywać wpisy z tytułem, opisem i lokalizacją GPS
- Pobierać aktualną lokalizację GPS i adres (reverse geocoding)
- Przeglądać historię wpisów na liście i mapie
- Wizualizować lokalizację na interaktywnej mapie Google Maps

---

Funkcjonalności

Widoki (4 ekrany)

1. **Lista wpisów** – główny widok z listą wszystkich zapisanych wpisów
2. **Szczegóły wpisu** – pełne informacje o wpisie z interaktywną mapą Google Maps
3. **Dodaj wpis** – formularz do tworzenia nowego wpisu z przyciskiem pobierania lokalizacji GPS
4. **Mapa wpisów** – widok mapy z zaznaczonymi lokalizacjami wszystkich wpisów

Funkcje natywne

1. Lokalizacja GPS – pobieranie aktualnej lokalizacji za pomocą pakietu geolocator
2. Przechowywanie danych offline – zapisywanie wpisów lokalnie za pomocą SharedPreferences
3. Obsługa uprawnień – zarządzanie uprawnieniami do lokalizacji
   
Obsługiwane scenariusze

1. Stan ładowania (spinner)
2. Stan pusty (zachęta do dodania pierwszego wpisu)
3. Brak dostępu do lokalizacji (komunikat z możliwością otwarcia ustawień)
4. Brak połączenia z internetem (aplikacja działa offline)


UX/UI

1. Material Design 3 – nowoczesny i intuicyjny interfejs
2. Responsywne layouty – dostosowane do różnych rozmiarów ekranu
3. Komunikaty Snackbar – informacje zwrotne dla użytkownika
4. Animacje i przejścia – płynne przejścia między ekranami


---

## Architektura

```plaintext
lib/
├── main.dart                 # Punkt wejścia aplikacji
├── models/
│   └── entry.dart            # Model wpisu
├── screens/
│   ├── entries_list_screen.dart  # Lista wpisów
│   ├── entry_detail_screen.dart  # Szczegóły wpisu
│   ├── add_entry_screen.dart     # Dodawanie nowego wpisu
│   └── entries_map_screen.dart   # Mapa z lokalizacjami wpisów
├── services/
│   ├── location_service.dart # Obsługa lokalizacji GPS
│   └── entry_service.dart    # Zarządzanie wpisami (SharedPreferences)
└── widgets/                  # Wspólne widżety
```

---

## Uruchomienie

### Wymagania

- Flutter SDK ≥ 3.19
- Dart SDK ≥ 3.1
- Android Studio / VS Code
- Emulator lub fizyczne urządzenie z Androidem/iOS


### Instalacja

```bash
git clone <repo-url>
cd location_diary_app

# Pobierz zależności:
flutter pub get

# Uruchom aplikację na emulatorze:
flutter run

# Build na Android:
flutter build apk

# Build na iOS
flutter build ios
```

---

## Zależności

| Pakiet                | Wersja      | Opis                          |
|-----------------------|-------------|-------------------------------|
| google_maps_flutter              | ^2.2.6     | Wyświetlanie map Google             |
| geolocator         | ^10.0.0     | Pobieranie lokalizacji GPS         |
| shared_preferences         | ^2.2.2     | Przechowywanie danych lokalnie              |
| provider       | ^6.1.5      | Zarządzanie stanem aplikacji                   |



---

## Definition of Done

- [x] 4 widoki (Lista, Szczegóły, Dodaj, Mapa)
- [x] Kompletna nawigacja między ekranami
- [x] Funkcja natywna: GPS z obsługą uprawnień
- [x] Przechowywanie danych offline
- [x] Dokumentacja w pliku README.md

---

## Konfiguracja uprawnień

Android (AndroidManifest.xml)
```xml
<uses-permission android:name="android.permission.ACCESS_FINE_LOCATION" />
<uses-permission android:name="android.permission.ACCESS_COARSE_LOCATION" />
<uses-permission android:name="android.permission.INTERNET" />
<meta-data
    android:name="com.google.android.geo.API_KEY"
    android:value="TWÓJ_KLUCZ_API" />
```

iOS (Info.plist)
```xml
<key>NSLocationWhenInUseUsageDescription</key>
<string>Aplikacja potrzebuje dostępu do lokalizacji, aby zapisywać wpisy z GPS.</string>
```


Licencja

MIT License – zobacz plik [LICENSE](LICENSE)

---

![5](https://github.com/user-attachments/assets/8cdc31c6-ea66-4d28-8a90-6cb7f952b428)
![3](https://github.com/user-attachments/assets/fdb603e5-5eb5-4c40-a098-fa95227795ff)
![2](https://github.com/user-attachments/assets/4dbeb37a-2b9e-4b32-819e-228024bd2f17)
![1](https://github.com/user-attachments/assets/b27aa76f-a0df-442b-bce0-6c53cff04f73)


---
**Autor:** Dominik
**Data:** Styczeń 2026
