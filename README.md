# Experiment 11: Add iOS as a Build Target

## Aim
To configure, develop, and test a Flutter application targeting Apple iOS, establishing the iOS build toolchain, simulator workflow, and testing core application components (UI, Navigation, Text Fields, Buttons, Images, Screen Transitions).

---

## Important System Requirements
> [!IMPORTANT]
> Actual native iOS compilation, code signing, and iOS Simulator execution require **macOS** with **Xcode** installed. On non-macOS environments (e.g. Linux), Flutter creates and manages the complete iOS project structure, Cupertino styling, and cross-platform logic, but final binary linking and execution must take place on macOS or via CI/CD (such as GitHub Actions / Codemagic).

---

## Step-by-Step Execution Guide

### Step 1: Check Flutter Environment
Verify Flutter SDK installation and check for required dependencies:
```bash
flutter doctor
```
Expected output checks:
- Flutter SDK version (Channel stable)
- Dart SDK
- Xcode - develop for iOS and macOS (Available on macOS)
- Connected devices

### Step 2: Check Available Devices
List all physical devices and simulators detected by Flutter:
```bash
flutter devices
```
On macOS, this will display available iOS Simulators (e.g., `iPhone 16 Pro (simulator) • com.apple.CoreSimulator.SimDeviceType.iPhone-16-Pro • ios`).

### Step 3: Create iOS Project
Initialize a Flutter project configured with iOS platform support:
```bash
flutter create ios_app
cd ios_app
```
Flutter automatically provisions the `ios/` folder containing the Xcode workspace, project files, and CocoaPods configurations.

### Step 4: Open the iOS Project in Xcode
Launch the iOS workspace in Apple Xcode:
```bash
open ios/Runner.xcworkspace
```
> [!NOTE]
> Always open `Runner.xcworkspace` rather than `Runner.xcodeproj` to ensure CocoaPods dependencies and Flutter frameworks are linked properly.

### Step 5: Select an iOS Simulator in Xcode
In Xcode's top toolbar, click on the active scheme/device dropdown and choose a target iOS Simulator (e.g., **iPhone 15 / iPhone 16**), or boot a simulator from the command line:
```bash
open -a Simulator
```

### Step 6: Run the Application
Execute the app on the selected iOS target:
```bash
flutter run
```
Or directly specify the iOS device:
```bash
flutter run -d "iPhone 16"
```
Alternatively, press **Cmd + R** inside Xcode to build and run directly.

---

## Step 7: Test Application Checklist

The application in this repository implements dedicated test screens specifically validating all required components:

| Component | Test Implementation in App | Verification Status |
| :--- | :--- | :---: |
| **UI** | iOS Cupertino design language using `CupertinoApp`, `CupertinoPageScaffold`, and `CupertinoNavigationBar` | ✅ Verified |
| **Navigation** | Multi-tab navigation via `CupertinoTabScaffold` and `CupertinoTabBar` | ✅ Verified |
| **Text Fields** | `CupertinoTextField` with custom placeholders, input decoration, and form validation | ✅ Verified |
| **Buttons** | `CupertinoButton.filled`, `CupertinoSwitch`, and `CupertinoSegmentedControl` | ✅ Verified |
| **Images** | `ClipRRect` containers, vector media rendering, and iOS circular avatar profiles | ✅ Verified |
| **Screen Transitions** | Native iOS horizontal sliding transitions (`CupertinoPageRoute`) and modal sheets (`showCupertinoModalPopup`) | ✅ Verified |

---

## Step 8: Build for iOS Distribution
To create production-ready iOS application bundles:

### 1. Build iOS Framework / App (Unsigned)
```bash
flutter build ios --release --no-codesign
```

### 2. Build iOS Archive (IPA) for App Store / TestFlight
```bash
flutter build ipa --export-method app-store
```
This generates the `.ipa` package under `build/ios/ipa/` ready for Apple Transporter or TestFlight deployment.

---

## Expected Result
The Flutter application is successfully configured with an iOS build target, adheres to Apple Human Interface Guidelines via Cupertino widgets, and is ready for compilation and testing in Xcode environments.
