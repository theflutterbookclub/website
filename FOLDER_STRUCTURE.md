# Website Folder Structure

This document outlines the organized folder structure for the website project with 6 main features.

## Project Structure

```
lib/
├── main.dart                 # Application entry point
├── main_app.dart            # Main app widget with navigation
├── constants/               # App-wide constants
│   └── app_constants.dart   # Application constants (routes, API endpoints, etc.)
├── models/                  # Data models
│   ├── user.dart           # User data model
│   └── article.dart        # Article data model
├── pages/                   # Feature pages
│   ├── homepage.dart       # 1. Homepage feature
│   ├── bookclub_stars.dart # 2. Bookclub Stars feature
│   ├── about_us.dart       # 3. About Us feature
│   ├── hall_of_fame.dart   # 4. Hall of Fame feature
│   ├── article.dart        # 5. Articles feature
│   └── sessions.dart       # 6. Sessions feature
├── services/                # Business logic services
│   └── navigation_service.dart # Navigation management
├── shared/                  # Shared components and widgets
│   ├── components/         # Reusable components
│   │   └── bottom_navigation.dart # Bottom navigation component
│   └── widgets/            # Reusable widgets
│       └── custom_app_bar.dart    # Custom app bar widget
└── utils/                   # Utility functions
    └── validators.dart     # Form validation utilities
```

## Features Overview

1. **Homepage** (`pages/homepage.dart`)
   - Main landing page with welcome content
   - Navigation hub to other features

2. **Bookclub Stars** (`pages/bookclub_stars.dart`)
   - Featured bookclub members showcase
   - Star ratings and member profiles

3. **About Us** (`pages/about_us.dart`)
   - Company/organization information
   - Mission, vision, and team details

4. **Hall of Fame** (`pages/hall_of_fame.dart`)
   - Outstanding contributors recognition
   - Achievement showcases

5. **Articles** (`pages/article.dart`)
   - Content management system
   - Blog posts and articles

6. **Sessions** (`pages/sessions.dart`)
   - Interactive learning sessions
   - Video content and live sessions

## Navigation

The app uses a bottom navigation bar with 6 tabs corresponding to each feature. Navigation is handled through the `MainApp` widget which manages the current page index and displays the appropriate page.

## Key Components

- **CustomBottomNavigation**: Bottom navigation bar with 6 tabs
- **CustomAppBar**: Reusable app bar component
- **NavigationService**: Service for programmatic navigation
- **Validators**: Utility functions for form validation

## Getting Started

1. Run `flutter pub get` to install dependencies
2. Run `flutter run` to start the application
3. Use the bottom navigation to switch between features

## Future Enhancements

- Add routing system for deep linking
- Implement state management (Provider/Riverpod/Bloc)
- Add API integration services
- Create more reusable widgets and components
- Add theme customization
- Implement user authentication

