# Flutter Clean Architecture with BLoC Template

A production-ready Flutter template project implementing Clean Architecture with BLoC pattern for state management, with a comprehensive set of modern dependencies and best practices.

## Features

- **Clean Architecture**: Clear separation of concerns with Domain, Data, and Presentation layers
- **BLoC Pattern**: Efficient state management with Flutter Bloc
- **Dependency Injection**: Simple service locator pattern
- **Navigation**: Type-safe routing with go_router
- **Networking**: REST API client with Retrofit and Dio
- **Local Storage**: Fast and lightweight local storage with Hive
- **Connectivity**: Network connectivity monitoring
- **Localization**: Easy multi-language support
- **Testing**: Unit and widget testing setup
- **Code Quality**: Static analysis with flutter_lints
- **Sample Implementation**: Includes example screens, tests, and workflow

## Dependencies

### Main Dependencies

- **flutter_bloc**: ^8.1.3 - State management
- **get_it**: ^7.6.0 - Dependency injection
- **go_router**: ^12.1.1 - Navigation
- **dio**: ^5.3.3 - HTTP client
- **retrofit**: ^4.0.3 - Type-safe HTTP client
- **hive**: ^2.2.3 - Local storage
- **hive_flutter**: ^1.1.0 - Flutter integration for Hive
- **connectivity_plus**: ^5.0.1 - Network connectivity monitoring
- **easy_localization**: ^3.0.3 - Localization
- **equatable**: ^2.0.5 - Value equality
- **logger**: ^2.0.2 - Logging

### Dev Dependencies

- **flutter_lints**: ^3.0.0 - Static analysis
- **mockito**: ^5.4.2 - Mocking for tests
- **build_runner**: ^2.4.6 - Code generation
- **retrofit_generator**: ^7.0.8 - Retrofit code generation
- **hive_generator**: ^2.0.1 - Hive code generation
- **flutter_test**: Included in SDK - Testing

## Getting Started

### Prerequisites

- Flutter SDK (3.16.0 or higher)
- Dart SDK (3.2.0 or higher)
- Android Studio / VS Code with Flutter extensions

### Installation

1. Clone this repository:

```bash
git clone https://github.com/yourusername/flutter_clean_architecture_template.git
cd template
```

2. Install dependencies:

```bash
flutter pub get
```

3. Run code generation:

```bash
dart run build_runner build --delete-conflicting-outputs
```

4. Run the application:

```bash
flutter run
```

## Usage

### Adding a New Feature

1. **Create Domain Entities and Repositories**
   - Define your business entities in `domain/entities/`
   - Define repository interfaces in `domain/repositories/`
   - Create use cases in `domain/usecases/`

2. **Implement Data Layer**
   - Create data models in `data/models/`
   - Implement repository in `data/repositories/`
   - Add data sources in `data/datasources/`

3. **Create BLoCs**
   - Define events in `presentation/blocs/*_event.dart`
   - Define states in `presentation/blocs/*_state.dart`
   - Implement BLoC in `presentation/blocs/*_bloc.dart`

4. **Implement UI**
   - Create screens and widgets in `presentation/screens/`
   - Add routes in `config/routes/`

### Example: Home-User Feature

Check the example implementation in the template:

- User entity: `domain/entities/user.dart`
- User repository: `domain/repositories/home_repository.dart`
- Get users use case: `domain/usecases/get_users_usecase.dart`
- Users screen: `presentation/screens/home_screen.dart`
- Users BLoC: `presentation/blocs/home_bloc.dart`

## Architecture Overview

This template implements **Clean Architecture** with **BLoC Pattern**:

### Clean Architecture Layers

1. **Domain Layer**:
   - Contains business entities and use cases
   - Defines repository interfaces
   - Has no dependencies on other layers
   - Pure Dart code, no Flutter dependencies

2. **Data Layer**:
   - Implements repositories from the domain layer
   - Handles data from different sources (API, database)
   - Contains data models and mappers
   - Depends on the domain layer

3. **Presentation Layer**:
   - Contains UI components (screens, widgets)
   - Implements BLoCs for state management
   - Consumes use cases from the domain layer
   - Depends on both domain and core layers

### BLoC Pattern

The BLoC (Business Logic Component) pattern separates business logic from UI:

- **Events**: Represent user interactions or system events
- **States**: Represent the UI state at a specific moment
- **BLoC**: Processes events and emits new states

This approach:
- Centralizes business logic
- Makes UI reactive and testable
- Simplifies state management
- Enables better separation of concerns

## Testing

The template includes sample unit tests:

- **Unit Tests**: Test repositories, use cases, and BLoCs

Run tests with:

```bash
flutter test
```

## Localization

The template supports multiple languages using `easy_localization`:

- Locale files are stored in `assets/translations/`
- Default languages: English (en) and Spanish (es)

Add a new language:

1. Create a new JSON file in `assets/translations/`
2. Add language to supported locales in `main.dart`

## State Management with BLoC

The template uses the BLoC pattern for state management:

1. Define events: What can happen (user actions, data loading)
2. Define states: UI representation of data and loading states
3. Implement BLoC: Business logic connecting events to states

[Example](lib/features/home/presentation/bloc/home_bloc.dart)

**Using BLoC in UI:**

[Example](lib/features/home/presentation/screens/home_screen.dart)

## Customization

### Theming

Modify themes in `config/theme.dart`:

- Light theme
- Dark theme
- Custom colors, text styles, etc.

### API Configuration

Update API settings in `core/network/api_client.dart`:

- Base URL
- Headers
- Interceptors for authentication, logging, etc.

## Best Practices

The template follows these best practices:

- **Clean Architecture**: Separation of concerns between data, domain, and presentation
- **BLoC Pattern**: Separation of business logic from UI
- **Dependency Injection**: Loose coupling between components
- **Error Handling**: Centralized error handling
- **Reactive Programming**: Stream-based state management
- **Test-Driven Development**: Comprehensive test coverage
- **Code Generation**: Minimize boilerplate code