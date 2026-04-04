# Souq Al-Khamis (Flutter E-Commerce App) - AI Context Document

## Overview
**Souq Al-Khamis** is a robust e-commerce application built utilizing the Flutter framework. It connects to a custom PHP/MySQL backend architecture for its API and utilizes Firebase for messaging/push notifications.

The overarching architectural pattern strictly adheres to the **GetX ecosystem**, which serves as the backbone for State Management, Dependency Injection, and Routing.

## High-Level Tech Stack
- **Framework:** Flutter (SDK `>=3.4.4 <4.0.0`)
- **State Management & Routing:** GetX
- **Networking:** HTTP wrappers (`http`, `dio`) to consume custom PHP backend endpoints (managed via `lib/link_api.dart`).
- **Local Storage:** `sqflite` (relational local data) and `shared_preferences` (KV stores).
- **Location Services:** `google_maps_flutter`, `geolocator`, `geocoding`, and `flutter_polyline_points` to support comprehensive Map-based Address integration.
- **Push Notifications:** Firebase Cloud Messaging (`firebase_messaging`, `firebase_core`).
- **Authentication:** Custom Session/JWT via PHP + `google_sign_in`.
- **UI & Animations:** Employs `lottie`, animate implementations (`show_up_animation`, `auto_animated`), `flutter_svg`, and `badges`.

## Core Folder Structure (GetX MVC/MVVM Hybrid)
The application categorizes features across standard domain-driven or layer-driven folders under the `lib/` directory:

- `lib/core/`: Application-wide utilities including styling constants, security middlewares (`mymiddleware.dart`), complex localization overlays (`change_local.dart`, `translation.dart`), and global application themes.
- `lib/data/`: Data layer execution. Divided into API interacting data sources (`datasourse/`) and parsable JSON mappings (`model/`).
- `lib/controller/`: Pure business logic handlers via GetX Controllers corresponding to each major screen or feature.
- `lib/view/`: The UI layer which has purely declarative layouts. Sub-divided:
  - `screens/`: Contains top-level feature pages (Auth, Address, Home, Items, Order, etc.)
  - `widgets/`: Reusable, abstracted UI components scoped primarily by feature.
- `lib/binding/`: Bootstrapping classes and initial bindings (`initial-binding.dart`) that perform lazy/early DI initialization.

## Key Configuration & Manifest Files
- **`lib/main.dart`:** The unified entry point. Responsible for asynchronously initializing `Firebase`, application services, injecting the `LocaleController`, and configuring the overarching `GetMaterialApp` root. 
- **`lib/routs.dart`:** The central nervous system for routing. It maps constant string identifiers (e.g., `AppRoute.checkout`) to specific stateless/stateful screens wrapped with appropriate middleware logic.
- **`lib/link_api.dart`:** A critical singleton-esque configuration file containing every static representation of the Backend APIs divided by domains: Auth, Home, Search, Items, Cart, Address, Coupon, and Orders (Archive, Pending, Details, Rate).

## Primary System Workflows
1. **Authentication Flow:** Follows a traditional Splash -> Language Select -> Onboarding -> Login/Signup path. Employs a complex "Forget Password" flow with multi-step verification code handling matching backend implementations.
2. **Browsing Architecture:** Item listing is fetched from a Search or Categories parameter, mapped to standard model instances. Features extensive Cart aggregation, "Favorite" toggling, and dedicated list abstractions for dynamic browsing.
3. **Checkout Lifecycle & Maps:** Checkout flow forces user mapping through Google Maps (creating/editing Address), verifying promo `Coupon`, and submitting orders to a dedicated backend ledger.
4. **Order State Machine:** Orders move through Pending -> Accepted -> Archiving phases, viewable in segmented lists, coupled to a notification alerting system indicating updates.

## Protocol for Extending or Maintaining (AI Guidance)
When modifying this app or adding a feature, follow this trajectory:
1. **Endpoint Map:** Always append new PHP endpoints to `lib/link_api.dart`.
2. **Data Source:** Model the JSON serialization under `lib/data/model/` and execute API HTTP requests within `lib/data/datasourse/`.
3. **Controller Logic:** Handle loading, error handling, and logical routing exclusively inside a `lib/controller/` class extension.
4. **UI Binding:** Render the properties exclusively inside `lib/view/` widgets leveraging GetX bindings (`GetBuilder` or `Obx`).
5. **Localization:** String permutations must NOT be hardcoded. Add custom JSON key maps within `lib/core/localization/translation.dart`, then call `".tr"` in the UI. 
