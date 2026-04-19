# Your Cinema

`Your Cinema` is a Flutter app that fetches movie and TV data from TMDB and includes Firebase-based user authentication.

The project uses a feature-first, layered architecture with Riverpod for dependency injection and state management.

## Architecture

The codebase follows a lightweight clean architecture style inside each feature:

- `presentation`: screens, widgets, and Riverpod providers used by the UI.
- `domain`: entities, repository contracts, and use cases.
- `data`: API/data sources, models, and repository implementations.

### High-level flow

`UI (ConsumerWidget/ConsumerStatefulWidget)`  
`-> Riverpod provider`  
`-> Use case`  
`-> Repository (domain contract)`  
`-> Repository implementation (data layer)`  
`-> Data source (TMDB/Firebase)`  
`-> Model -> Entity -> UI`

### Project structure (core parts)

```text
lib/
  core/
    constants/
    shared_widgets/
    theme/
  features/
    movies/
      presentation/
      domain/
      data/
    authentication/
      presentation/
      domain/
      data/
```

## State Management (Riverpod)

Riverpod is the single state-management approach in this project.

### 1) Dependency injection with `Provider`

`Provider` is used to wire dependencies at each layer:

- `tmdbApiProvider` creates `TmdbApi`.
- `movieRepositoryProvider` creates `MovieRepositoryImpl`.
- `usersRepositoryProvider` creates `UsersRepositoryImpl`.
- Firebase providers expose `FirebaseAuth` and `FirebaseFirestore`.

This keeps construction logic outside widgets and makes features testable/composable.

### 2) Async state with `FutureProvider` and `StreamProvider`

The app models remote/async state with Riverpod async providers:

- Movies:
  - `trendingMoviesProvider`
  - `topRatedMoviesProvider`
  - `topRatedTvShowsProvider`
- Auth:
  - `createAccountProvider` (`FutureProvider.family`)
  - `loginProvider` (`FutureProvider.family`)
  - `logOutUserProvider` (`FutureProvider`)
  - `getCurrentUserProvider` (`StreamProvider`)

Widgets consume these with `ref.watch(...)` and render loading/error/data states.

### 3) Local mutable UI state with `StateNotifierProvider`

For local interactive state (selected avatar), the app uses:

- `SelectedAvatarNotifier` + `selectedAvatarProvider`

This keeps UI logic and mutable state separate from widget build methods.

## Feature Data Flows

### Movies flow example

1. `HomePage` watches `trendingMoviesProvider`.
2. Provider resolves `GetTrendingMoviesUsecase`.
3. Use case calls `MovieRepository.getTrendingMovies()`.
4. `MovieRepositoryImpl` calls `TmdbApi.getMoviesList(...)`.
5. API response is parsed into `MovieModel` and returned as domain entities.
6. UI renders movie sections.

### Authentication flow example

1. UI triggers `createAccountProvider(UserParams)`.
2. Provider runs `SignUpUsecase`.
3. Use case calls `UsersRepository.createUserAccount(...)`.
4. Repository delegates to Firebase auth and Firestore data sources.
5. User stream is exposed through `getCurrentUserProvider`.

## App Bootstrap

In `main.dart`:

- `.env` is loaded (for `TMDB_TOKEN`).
- Firebase is initialized.
- App starts inside `ProviderScope`.

## Environment

Create a `.env` file in the project root:

```env
TMDB_TOKEN=your_tmdb_bearer_token
```

Firebase options are configured in `lib/firebase_options.dart`.

## Run

```bash
flutter pub get
flutter run
```
