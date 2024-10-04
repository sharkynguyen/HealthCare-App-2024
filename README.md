# Health Care App

### Project was made by Sharky Nguyen [sharkynguyenle@gmail.com]

## Design url

[Design](https://www.figma.com/design/otEZKBhhYjj0Vy9ZjbIGU0/Health-Care-App?node-id=0-90&node-type=frame&t=Ovw7CarScsH0ajDG-0)

## Generate config files before run project [Step by step]

### Step 1

```bash
flutter clean
```

### Step 2

```bash
flutter pub get
```

### Step 3

```bash
flutter pub run build_runner build --delete-conflicting-outputs
```

### Step 4

```bash
flutter gen-l10n
```

## Watch the files' system for edits

```bash
flutter packages pub run build_runner watch
```

## Generate assets

```bash
fluttergen -c pubspec.yaml
```
