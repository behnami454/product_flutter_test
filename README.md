# Product app

test project of Product app

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

## how to run the app 

*  `flutter pub get`
*  `flutter run`


### State Management Choice and Project Structure

The state management solution used in this project is BLoC (Business Logic Component).
The structure includes separate files for each BLoC, with events and states to manage loading,
error, and loaded states effectively. The BLoC is wrapped in a provider,
ensuring that the application can efficiently manage the state throughout different screens


#### Decisions Made During Development

**In addition to the required features, I implemented a splash screen with animation to enhance user experience**

**A custom dialog was added to show notifications for actions such as adding products to the cart**


#### Third-Party Packages Used

**flutter_bloc: For state management**

**bloc: To create reusable components for the BLoC pattern**

**equatable: To simplify equality comparisons in the BLoC states and events**

**http: For making API calls to fetch product data**

**flutter_launcher_icons: To customize the application icon**



