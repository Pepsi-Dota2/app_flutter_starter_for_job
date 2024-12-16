generate "flutter pub run build_runner build --delete-conflicting-outputs"
flutter pub run easy_localization:generate -S assets/translations -f keys -o locale_keys.g.dart // translate

flutter build apk --release // build apk
flutter build appbundle --release //build app bundle for play store