## Getting Started
- This application developed by Flutter version 3.7.7

### Generate data

```dart
flutter pub get
flutter packages pub run build_runner build --delete-conflicting-outputs
flutter pub run easy_localization:generate -S assets/translations -f keys -o locale_keys.g.dart -O lib/gen
flutter run
```

#### One for All

```dart
flutter clean && flutter pub get && flutter packages pub run build_runner build --delete-conflicting-outputs && flutter pub run easy_localization:generate -S assets/translations -f keys -o locale_keys.g.dart -O lib/gen && flutter run
```

## How to start project

1. ```cd yaho```
2. ```flutter clean```
3. ```flutter pub get```
4. ```flutter packages pub run build_runner build --delete-conflicting-outputs```
5. ```flutter pub run easy_localization:generate -S assets/translations -f keys -o locale_keys.g.dart -O lib/gen```
6. ```flutter run```
