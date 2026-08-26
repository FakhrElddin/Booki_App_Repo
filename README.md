# Booki — Used Books Marketplace

A Flutter marketplace application for discovering, buying, selling, and exchanging used books.

## Features

- Onboarding flow for new users
- Authentication flows: sign up, login, OTP verification, and password reset
- Home feed with book categories and listings
- Browse books by category and search the catalog
- Book details with owner information, condition, edition, usage time, price, and book photos
- Add books to a personal gallery with cover, stub, and printing images
- Favorites and personal “My Books” management
- User profile, profile editing, and owner profile views
- Book buying and exchange entry points
- Conversations list and one-to-one chat rooms
- Persistent onboarding and authentication state
- Responsive reusable widgets and image loading states

## Architecture

The codebase is organized around Cubit-managed application state:

- `views/`: screens for onboarding, authentication, browsing, books, profiles, favorites, and chat
- `widgets/`: reusable UI components for book cards, categories, forms, profiles, and messages
- `cubits/`: BLoC/Cubit state management for app data, authentication, registration, password recovery, and bottom navigation
- `models/`: typed models for books, categories, users, favorites, conversations, messages, and API responses
- `helper/`: Dio client, API endpoints, and feedback helpers
- `local/`: SharedPreferences-based local persistence
- `themes/` and `colors/`: centralized visual styling

## Tech Stack

- Flutter and Dart
- BLoC/Cubit for state management
- Dio for REST API communication
- SharedPreferences for local persistence
- image_picker for book image selection
- cached_network_image for remote book and profile images
- flutter_svg, Rive, carousel_slider, and responsive reusable widgets

## Backend Configuration

The app expects a REST API running at:

```
http://10.0.2.2:4000/
```

This address maps an Android emulator to a backend running on the host machine. If you run the app on a physical device, replace `10.0.2.2` with the host machine's LAN IP in `lib/helper/end_points.dart`.

The current API contract includes authentication, categories, books, profile, wishlist, and messaging-related operations. Start the compatible backend before launching the app.

## Getting Started

### Prerequisites

- Flutter SDK with Dart 3.0.6 or later
- A running backend that exposes the API routes configured in `lib/helper/end_points.dart`
- Android emulator, iOS simulator, or a connected physical device

### Run locally

1. Clone the repository.
2. Start the backend service on port `4000`.
3. Confirm the `baseUrl` matches your device or emulator.
4. Install Flutter dependencies:

   ```bash
   flutter pub get
   ```

5. Run the app:

   ```bash
   flutter run
   ```

## Project Structure

```
lib/
├── cubits/
├── helper/
├── local/
├── models/
├── themes/
├── views/
└── widgets/
```

## Repository

[View the source code on GitHub](https://github.com/FakhrElddin/Booki_App_Repo)
