# Pokedex Mobile App

A Flutter-based mobile app that displays a Pokedex using the GraphQL Pokemon API. The app features an infinite scroll list of Pokemons, a Pokemon details page, and an optional filter by one of the attributes.

## Features

- **Infinite Scroll List of Pokemons:** Load and display Pokémon in an infinite scroll list.
- **Pokemon Details Page:** View detailed information about a specific Pokémon.
- **Optional Filter by Pokemon Attributes:** Filter Pokémon based on attributes like type.

## Project Architecture

This project follows a clean architecture approach with the following layers:

- **Data Layer:** Handles communication with the GraphQL API and manages data sources (remote data).
- **Domain Layer:** Contains business logic and use cases.
- **Presentation Layer:** Consists of UI and state management, using Flutter with Bloc/Cubit.


### Directory Descriptions

- **`lib/data/`**: Contains the data layer components:
  - **`datasource/`**: Includes the API client and GraphQL queries used to fetch data.
  - **`models/`**: Contains data models that represent the data structure used throughout the app.
  - **`repository/`**: Manages data flow and repository logic, including interaction between data sources and the domain layer.

- **`lib/domain/`**: Contains the domain layer components:
  - **`entities/`**: Represents core domain-level models that encapsulate the application's business objects.
  - **`usecases/`**: Contains business logic and application use cases that orchestrate the application's flow and interactions.

- **`lib/presentation/`**: Contains the presentation layer components:
  - **`bloc/`**: Includes state management logic using Bloc/Cubit, handling state changes and business logic.
  - **`pages/`**: Screens or views of the application where the UI is defined.
  - **`widgets/`**: Reusable UI components that can be used across different screens or parts of the app.

- **`lib/core/`**: Contains core utilities and configuration:
  - **`const/`**: Defines application-wide constants like themes, fonts, and configuration settings.
  - **`route/`**: Manages app routing, including route definitions and navigation logic.
  - **`style/`**: Manages styling for user interfaces.

This structure helps in maintaining a clear separation of concerns, making the codebase more manageable and scalable.

## Key Technologies

- **GraphQL:** The app fetches data from the GraphQL Pokemon API. This technology allows for efficient data querying and manipulation by requesting only the data needed.

- **Bloc/Cubit:** The app uses the Bloc pattern for state management. Bloc (Business Logic Component) and Cubit provide a structured way to manage state and handle business logic in Flutter applications.

- **Clean Architecture:** The app follows clean architecture principles to ensure a clear separation of concerns. This approach divides the application into distinct layers, each with specific responsibilities, making the codebase more maintainable and scalable.


## Getting Started

### Prerequisites

- [Flutter SDK](https://flutter.dev/docs/get-started/install)
- A code editor, preferably VS Code or Android Studio.

### Installation

1. Clone the repository:

    ```bash
    git clone https://github.com/your-username/pokedex-app.git
    cd pokedex-app
    ```

2. Install dependencies:

    ```bash
    flutter pub get
    ```

3. (Optional) Generate code:

    If you're using code generation (e.g., for JSON serialization), run:

    ```bash
    flutter pub run build_runner build
    ```

### Running the App

1. Connect your Android or iOS device/emulator.
2. Run the following command:

    ```bash
    flutter run
    ```

   This will launch the app on your connected device or emulator.

### Building the APK

To generate an APK file, run:

```bash
flutter build apk --release