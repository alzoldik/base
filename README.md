# Base

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.


## Github action with Telegram bot
Creating a GitHub workflow to build a Flutter APK release and send it to a Telegram user involves several steps. Here's a simplified example of how you can achieve this using GitHub Actions:

1. **Flutter Project Setup**: Ensure your Flutter project is set up and hosted on GitHub.

2. **Create a Telegram Bot**: You'll need to create a Telegram bot to send messages programmatically. You can do this by talking to the BotFather on Telegram and obtaining your bot token.

3. **Obtain Your Chat ID**: To send messages to a specific user, you need to obtain their Chat ID. You can do this by sending a message to the user from your bot and then using a tool or script to fetch the user's chat ID.

4. **GitHub Secrets**: Store sensitive information like the Telegram bot token and chat ID securely as GitHub secrets. Go to your repository on GitHub, navigate to "Settings" > "Secrets" > "New repository secret," and add the following secrets:

   - `TELEGRAM_BOT_TOKEN`: Your Telegram Bot Token.
   - `TELEGRAM_CHAT_ID`: The Chat ID of the user you want to send the APK to user specified.

5. **GitHub Workflow YAML For Send URL**: Create a `.github/workflows/build_and_send_apk.yml` file in your repository to send apk url with custom message to telegram user with the following content:

```yaml
name: Build and Send APK

on:
  push:
    branches:
      - master

jobs:
  build:
    runs-on: ubuntu-latest

    steps:
      - name: Checkout code
        uses: actions/checkout@v2

      - name: Setup Flutter
        uses: subosito/flutter-action@v2
        with:
          flutter-version: '3.13.4' # Adjust to your Flutter version

      - name: Build APK
        run: |
          flutter clean
          flutter build apk --release

      - name: upload
        id: upload_apk
        uses: actions/upload-artifact@v2
        with:
          name: app-release
          path: build/app/outputs/flutter-apk/app-release.apk

      - name: Upload Artifact to Transfer.sh
        id: upload_artifact
        run: |
          UPLOAD_URL=$(curl --upload-file build/app/outputs/flutter-apk/app-release.apk https://transfer.sh/app-release.apk)
          echo "::set-output name=upload_url::$UPLOAD_URL"
      
      - name: Send APK URL via Telegram
        env:
          TELEGRAM_BOT_TOKEN: ${{ secrets.TELEGRAM_BOT_TOKEN }}
          TELEGRAM_CHAT_ID: ${{ secrets.TELEGRAM_CHAT_ID }}
          
        run: |
          MESSAGE="Here's the Flutter APK release: ${{ steps.upload_artifact.outputs.upload_url }}"
          curl -s "https://api.telegram.org/bot$TELEGRAM_BOT_TOKEN/sendMessage" -d "chat_id=$TELEGRAM_CHAT_ID" -d "text=$MESSAGE"

```
6. **GitHub Workflow YAML For Upload File**: Create a `.github/workflows/build_and_send_apk.yml` file in your repository to send apk file to telegram user with the following content:

```yaml

name: Build and Send APK

on:
  push:
    branches:
      - master

jobs:
  build:
    runs-on: ubuntu-latest

    steps:
      - name: Checkout code
        uses: actions/checkout@v2

      - name: Setup Flutter
        uses: subosito/flutter-action@v2
        with:
          flutter-version: '3.13.4' # Adjust to your Flutter version

      - name: Build APK
        run: |
          flutter clean
          flutter build apk --release

      - name: Archive APK
        uses: actions/upload-artifact@v2
        with:
          name: release-apk
          path: build/app/outputs/flutter-apk/app-release.apk

  send:
    needs: build
    runs-on: ubuntu-latest

    steps:
      - name: Checkout code
        uses: actions/checkout@v2

      - name: Download APK
        uses: actions/download-artifact@v2
        with:
          name: release-apk
          path: .

      - name: Send APK via Telegram
        env:
          TELEGRAM_BOT_TOKEN: ${{ secrets.TELEGRAM_BOT_TOKEN }}
          TELEGRAM_CHAT_ID: ${{ secrets.TELEGRAM_CHAT_ID }}
        run: |
          curl -F chat_id=$TELEGRAM_CHAT_ID -F document=@app-release.apk "https://api.telegram.org/bot$TELEGRAM_BOT_TOKEN/sendDocument"

```
Replace the placeholders with your actual values.

This workflow will trigger on pushes to the `master` branch, build the Flutter APK release, and then send it via Telegram using your bot token and the specified chat ID.

Please note that this is a simplified example, and you should adapt it to your specific needs and security requirements.

