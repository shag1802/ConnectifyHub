
# Flutter Authentication App

## Project Overview
This Flutter project implements a simple authentication app with email registration and cross-authentication using OAuth with Google and Facebook. The backend is powered by Firebase for user authentication and data storage.




## Prerequisites
Before running the project, ensure that you have the following installed:

- Flutter
- Dart
- Android Studio with an Android emulator set up
- Java for generating SSH keys for Google and Facebook authentication
- A Firebase project set up for authentication and data storage

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.


# Instuctions to run the code

Clone the repository:  

git clone https://github.com/your-username/your-repo.git

Navigate to the project directory:

cd your-repo

## Install Dependencies:

If you are using VSCode, open the `pubspec.yaml` file and run Pubspec Assist (Ctrl + Shift + P > Pubspec Assist: Get Packages).
Now in this we can install all the dependencies we want to install. Alternatively, run the following command in the terminal:

```bash
flutter pub get
```

## Set up Firebase:

1. Create a new Firebase project: [Firebase Console](https://console.firebase.google.com/).
2. Add an Android app to your Firebase project and follow the setup instructions to download the `google-services.json` file.
3. Place the `google-services.json` file in the `android/app` directory.

## Configure OAuth with Google:

1. Follow the instructions to create an OAuth client ID for Android in the [Google Cloud Console](https://console.cloud.google.com/).
2. Update the `android/app/src/main/AndroidManifest.xml` file with the generated client ID.

## Configure OAuth with Facebook:

1. Follow the instructions to create a Facebook App ID in the [Facebook Developer Console](https://developers.facebook.com/).
2. Update the `android/app/src/main/res/values/strings.xml` file with the generated Facebook App ID.

## Create an Android Emulator:

1. Open Android Studio and navigate to Configure > AVD Manager.
2. Create a new Virtual Device with the desired specifications.
3. Start the emulator before running the app.


## Run the App:

```bash
flutter run
```

## Test the App:

1. Open the app on the emulator or a physical device.
2. Register using an email or log in with Google/Facebook.
3. After logging in, you should see a message indicating the successful login.

## Project Structure

- **lib/:** Contains the Flutter Dart code for the app.
- **android/:** Android-specific configurations.


# Create a Firebase Project:

1. Go to the [Firebase Console](https://console.firebase.google.com/).
2. Click on the "Add Project" button.
3. Fill in the required details for your project and click "Next."
4. Follow the prompts to set up Google Analytics for your project (optional), then click "Create Project."
5. Once the project is created, click on "Continue" to enter the project dashboard.

## Add an Android App to Firebase Project:

1. In the Firebase project dashboard, click on the Android icon to add an Android app.
2. Fill in the package name for your Android app (you can find this in the `android/app/build.gradle` file).
3. Optionally, add an app nickname for easier identification.
4. Click "Register App."

## Download `google-services.json`:

1. After registering the app, click on the "Download `google-services.json`" button.
2. Place the downloaded `google-services.json` file in the `android/app` directory of your Flutter project.

## Generate SHA-1 and SHA-256 Fingerprints:

For Firebase authentication, you need to generate SHA-1 and SHA-256 fingerprints. Here's how you can generate them using Java Keytool:

### Using Keytool (Java):

1. Open a terminal or command prompt.
2. Navigate to the directory containing your Java installation.
3. Run the following command to generate SHA-1 fingerprint:

```bash
keytool -list -v -keystore your_keystore.jks -alias your_alias_name -storepass your_keystore_password
```
4. Run the following command to generate SHA-256 fingerprint:

```bash
keytool -list -v -keystore "%USERPROFILE%\.android\debug.keystore" -alias androiddebugkey -storepass android -keypass android
```
5. Copy the SHA-1 and SHA-256 fingerprints.

## Add Fingerprint to Firebase Project:

1. Go back to the [Firebase Console](https://console.firebase.google.com/).
2. In the Firebase project dashboard, click on the gear icon (Project settings) in the top left.
3. Click on the "General" tab, and under "Your apps," find your Android app.
4. Scroll down to the "SHA certificate fingerprints" section.
5. Click on "Add fingerprint" and paste the SHA-1 and SHA-256 fingerprints you generated.
6. Click "Save."

Now, your Firebase project is configured for Android authentication, and the required configuration files are in place. You can proceed with the other steps in the README file for OAuth configuration and running the Flutter app.


# How to do Google Oauth
## Configure Firebase for Google Authentication

1. Go to the [Firebase Console](https://console.firebase.google.com/).
2. Select your Firebase project.
3. In the left sidebar, click on "Authentication."
4. Go to the "Sign-in method" tab.
5. Enable the "Google" sign-in method.
6. Save your changes.

# How to do Facebook OAuth
## Set up Facebook Authentication with Firebase in Your Flutter Project:

### Configure Facebook App:

#### 1. Create a Facebook App:

- Go to the [Facebook Developers website](https://developers.facebook.com/) and log in.
- Click on "Create App" and select "For Everything Else."
- Fill in the required details for your app, and click "Create App ID."

#### 2. Configure Facebook Login:

- In the Facebook Developer Dashboard, go to your app and click on "Add a Product."
- Choose "Facebook Login" and click "Set Up" under the "Facebook Login" product.
- In the "Valid OAuth Redirect URIs" section, add the redirect URI:

```arduino
https://<your-firebase-project-id>.firebaseapp.com/__/auth/handler
```
- Replace <your-firebase-project-id> with your actual Firebase project ID.

- Save your changes.
## Step 3: Obtain Facebook App ID and App Secret

1. In the Facebook Developer Dashboard, go to your app.
2. Click on the "Settings" tab in the left sidebar.
3. Under the "Basic" settings, you'll find your "App ID" and "App Secret." Make note of these values as you'll need them later.

## Step 4: Configure Firebase

1. Go to the [Firebase Console](https://console.firebase.google.com/).
2. Select your Firebase project.
3. In the left sidebar, click on "Authentication."
4. Go to the "Sign-in method" tab.
5. Enable the "Facebook" sign-in method.
6. In the "App ID" and "App Secret" fields, enter the values you obtained from the Facebook Developer Dashboard.
7. Save your changes.

## Step 5: Update Android Configuration

1. Open the `android/app/build.gradle` file in your Flutter project.
2. Add the following dependency in the dependencies section:

```gradle
dependencies {
    // ...
    implementation 'com.facebook.android:facebook-login:11.0.0'  // Update the version if needed
}
```

## Step 6: Update AndroidManifest.xml

Open the `android/app/src/main/AndroidManifest.xml` file in your Flutter project and add the following `meta-data` element inside the `<application>` element, replacing `{your-facebook-app-id}` with your actual Facebook App ID:

```xml
<application>
    <!-- ... -->
    <meta-data
        android:name="com.facebook.sdk.ApplicationId"
        android:value="@string/facebook_app_id"/>
</application>
```
## Step 7: Create strings.xml File

1. Create a `res/values/strings.xml` file if it doesn't exist in your Flutter project.
2. Add the following content inside the `strings.xml` file, replacing `{your-facebook-app-id}` with your actual Facebook App ID:

```xml
<resources>
    <string name="facebook_app_id">{your-facebook-app-id}</string>
</resources>
```

## Step 8: Add Facebook SDK to Flutter Code

1. Add the `flutter_facebook_login` package to your `pubspec.yaml` file:

```yaml
dependencies:
  flutter_facebook_login: ^4.0.0
  ```
2. Run flutter pub get to install the package.

## Step 9: Integrate Facebook Authentication in Your Flutter Dart Code

Now that you have added the `flutter_facebook_login` package, you can integrate Facebook authentication in your Flutter Dart code. Refer to the package documentation for usage instructions and examples.

Make sure to import the necessary package in your Dart file:

```dart
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
```
