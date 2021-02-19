#ZADATAK – TESTIRATI MOBILNU APLIKACIJU

Svrha ovog projekta je izrada projekta za kolegij Metode i tehnike testiranja programske podrške. Potrebni alati za testiranje aplikacije:

1. Flutter framework, moguće skinuti sa stranice:

https://flutter.dev/?gclid=Cj0KCQiA4L2BBhCvARIsAO0SBdYZZ16kJNwsRA1c-9hI3FwRm8HjDHj7xSTcZ66Nuy_YffURARCgIL8aAvgVEALw_wcB&gclsrc=aw.ds

2. IDE po izboru VS Code, Android studio.

3. Ekstenzije za Flutter i Dart unutar odabranog IDE

4. Emulator za andorid uređaj

KORACI KAKO OSPOSOBITI RAD:

1. Prvo skinuti Flutter framework te extract sadržaj npr na disk D, potrebno je da je omogućen pristup te da nije stavljeno npr u Program files.

2. Update System Variables tako da se doda bin folder od skinutog file unutar PATH varijable.

3. otvorite terminal unutar IDE npr. VS Code i unutar upišite:

    flutter doctor --android-licenses

time prihvatite sve potrebne licence.

4. Otvorite apliakciju unutar IDE, potrebno je pokrenuti naredbu

    flutter pub get

čime se dohvaćaju svi potrebni paketi za rad aplikacije. Nakon toga restartirajte IDE.

5. Pokrenuti Android uređaj.

6.  Otvoriti folder test_driver i  unutar app.dart pokrenuti main funkciju pritiskom na Run iznad funkcije.

7. Otvoriti folder test_driver i unutar app_test.dart kliknuti Run iznad funkcije main, time s liejve strane možete pratiti kako se izvršavaju testovi i ujedno vidjeti promjene na emulatoru unutar aplikacije kako se izvode.



////////////////////////////////////////////////////////////////////////////////

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
