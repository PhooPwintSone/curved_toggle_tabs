# Curve Toggle Tabs

A customizable Flutter package that provides a fluid, S-curve folder-style toggle tab container. It uses a `CustomPainter` driven by smooth animations to morph between two tab views without choppy transitions.

## Preview

<p align="center">
  <img src="https://raw.githubusercontent.com/PhooPwintSone/curve_toggle_tabs/main/screenshots/login_tab.png" width="320" alt="Log In Tab Active" />
  &nbsp;&nbsp;&nbsp;&nbsp;
  <img src="https://raw.githubusercontent.com/PhooPwintSone/curve_toggle_tabs/main/screenshots/signup_tab.png" width="320" alt="Sign Up Tab Active" />
</p>

## Features

- **Fluid S-Curve Morphing:** Smoothly animates the folder curve from left to right using cubic bezier paths.
- **Automatic Height Adjustment:** Smoothly expands or shrinks the card body when switching between views of different heights.
- **Customizable Styling:** Easily configure card colors, border radii, curve width, padding, and active/inactive text styles.
- **Zero External Dependencies:** Built purely with Flutter's native rendering and animation APIs.

## Installation

Add `curve_toggle_tabs` to your `pubspec.yaml`:

```yaml
dependencies:
  curve_toggle_tabs: ^0.0.1
```

Or run:
fsf

```bash
flutter pub add curve_toggle_tabs
```

## Usage

Import the package:

```dart
import 'package:curve_toggle_tabs/curve_toggle_tabs.dart';
```

Wrap your two views inside `CurveToggleTabs`:

```dart
CurveToggleTabs(
  firstTabTitle: 'Log In',
  secondTabTitle: 'Sign Up',
  cardColor: const Color(0xFF1E293B),
  activeTextStyle: const TextStyle(
    color: Colors.white,
    fontSize: 16,
    fontWeight: FontWeight.bold,
  ),
  inactiveTextStyle: const TextStyle(
    color: Color(0xFF94A3B8),
    fontSize: 15,
  ),
  onTabChanged: (index) {
    debugPrint('Active tab index: $index');
  },
  firstTabView: Column(
    children: [
      // Your First Tab Widgets (e.g., Login Form)
    ],
  ),
  secondTabView: Column(
    children: [
      // Your Second Tab Widgets (e.g., Sign Up Form)
    ],
  ),
)
```

## Parameters

- **`firstTabTitle`** (`String`, required): Text displayed on the left tab.
- **`secondTabTitle`** (`String`, required): Text displayed on the right tab.
- **`firstTabView`** (`Widget`, required): Content widget displayed when the first tab is selected.
- **`secondTabView`** (`Widget`, required): Content widget displayed when the second tab is selected.
- **`cardColor`** (`Color`): Background color of the folder container and active tab. Defaults to `Color(0xFF1E293B)`.
- **`activeTextStyle`** (`TextStyle?`): Custom text style merged into the selected tab title.
- **`inactiveTextStyle`** (`TextStyle?`): Custom text style merged into the unselected tab title.
- **`tabHeight`** (`double`): Height of the top tab bar. Defaults to `56.0`.
- **`borderRadius`** (`double`): Corner radius of the card and tabs. Defaults to `24.0`.
- **`curveWidth`** (`double`): Horizontal span of the center S-curve transition. Defaults to `30.0`.
- **`contentPadding`** (`EdgeInsetsGeometry`): Inner padding around the active tab view. Defaults to `EdgeInsets.all(24.0)`.
- **`animationDuration`** (`Duration`): Speed of the curve and size transitions. Defaults to `300ms`.
- **`animationCurve`** (`Curve`): Easing curve for the animation. Defaults to `Curves.easeInOutCubic`.
- **`initialIndex`** (`int`): Starting tab index (`0` or `1`). Defaults to `0`.
- **`onTabChanged`** (`ValueChanged<int>?`): Callback triggered whenever the active tab changes.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
