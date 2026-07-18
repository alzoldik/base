# base — Flutter starter template

A production-shaped starting point for Flutter apps, extracted from patterns used across shipped
client projects. It wires up the decisions you otherwise re-make on every new app: state
management, networking, theming, localization, and a CI pipeline that puts a testable APK in your
hands on every push.

## What's included

- **State management:** `flutter_bloc` + `rxdart`, with an app-level settings bloc (theme, locale)
  and feature-level blocs (see `lib/feature/auth`).
- **Feature-first structure:** each feature owns its `bloc/` and `view/` (auth: login, OTP, signup).
- **Networking:** `dio` client plus `connectivity_plus` handling, with Lottie states for
  loading / no-internet / empty-search.
- **Theming:** light and dark palettes in `lib/config/colors`, composed in `lib/config/themes`.
- **Localization:** `l10n.yaml` + `intl` wiring, ready for Arabic/English (RTL/LTR) products.
- **Firebase:** core, messaging, analytics, and local notifications pre-integrated.
- **CI:** a GitHub Actions workflow (`.github/workflows/upload-apk.yml`) builds a release APK on
  every push to `master` and delivers it to a Telegram chat for testing.

## Getting started

```bash
flutter pub get
flutter run
```

For the CI delivery step, set your Telegram bot token and chat ID as repository secrets used by
`upload-apk.yml`.

## Status

Maintained as a personal template; dependency versions reflect the last project it bootstrapped.
Author: [Ali Mohamed](https://alzoldik.github.io/ali-mohamed-portfolio/) — sole author.
