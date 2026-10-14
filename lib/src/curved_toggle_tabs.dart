import 'package:curved_toggle_tabs/src/curved_tab_painter.dart';
import 'package:flutter/material.dart';

class CurveToggleTabs extends StatefulWidget {
  /// Title for the left tab
  final String firstTabTitle;

  /// Title for the right tab
  final String secondTabTitle;

  /// Content displayed when the left tab is active
  final Widget firstTabView;

  /// Content displayed when the right tab is active
  final Widget secondTabView;

  /// Background color of the folder card and active tab
  final Color cardColor;

  /// Text style for the currently selected tab
  final TextStyle? activeTextStyle;

  /// Text style for the unselected tab
  final TextStyle? inactiveTextStyle;

  /// Height of the top toggle tabs
  final double tabHeight;

  /// Corner radius of the card and tabs
  final double borderRadius;

  /// Horizontal width of the S-curve transition
  final double curveWidth;

  /// Padding around the content inside the card
  final EdgeInsetsGeometry contentPadding;

  /// Duration for the curve morph and size animations
  final Duration animationDuration;

  /// Animation curve for switching tabs
  final Curve animationCurve;

  /// Optional initial tab index (0 for first tab, 1 for second tab)
  final int initialIndex;

  /// Optional callback fired when the user switches tabs
  final ValueChanged<int>? onTabChanged;

  const CurveToggleTabs({
    super.key,
    required this.firstTabTitle,
    required this.secondTabTitle,
    required this.firstTabView,
    required this.secondTabView,
    this.cardColor = const Color(0xFF1E293B),
    this.activeTextStyle,
    this.inactiveTextStyle,
    this.tabHeight = 56.0,
    this.borderRadius = 24.0,
    this.curveWidth = 30.0,
    this.contentPadding = const EdgeInsets.all(24.0),
    this.animationDuration = const Duration(milliseconds: 300),
    this.animationCurve = Curves.easeInOutCubic,
    this.initialIndex = 0,
    this.onTabChanged,
  }) : assert(
          initialIndex == 0 || initialIndex == 1,
          'initialIndex must be 0 or 1',
        );

  @override
  State<CurveToggleTabs> createState() => _CurveToggleTabsState();
}

class _CurveToggleTabsState extends State<CurveToggleTabs> {
  late int _currentIndex;

  @override
  void initState() {
    super.initState();
    _currentIndex = widget.initialIndex;
  }

  void _switchTab(int index) {
    if (_currentIndex != index) {
      setState(() => _currentIndex = index);
      widget.onTabChanged?.call(index);
    }
  }

  @override
  Widget build(BuildContext context) {
    final defaultActiveStyle = const TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.bold,
      fontSize: 15,
    ).merge(widget.activeTextStyle);

    final defaultInactiveStyle = const TextStyle(
      color: Color(0xFF94A3B8),
      fontWeight: FontWeight.normal,
      fontSize: 15,
    ).merge(widget.inactiveTextStyle);

    return Stack(
      children: [
        // 1. Animated Custom Painted S-Curve Background
        Positioned.fill(
          child: TweenAnimationBuilder<double>(
            tween: Tween<double>(
              begin: _currentIndex.toDouble(),
              end: _currentIndex.toDouble(),
            ),
            duration: widget.animationDuration,
            curve: widget.animationCurve,
            builder: (context, progress, _) {
              return CustomPaint(
                painter: CurveTabPainter(
                  progress: progress,
                  color: widget.cardColor,
                  tabHeight: widget.tabHeight,
                  radius: widget.borderRadius,
                  curveWidth: widget.curveWidth,
                ),
              );
            },
          ),
        ),

        // 2. Foreground Layer (Clickable Tabs + Animated Body Content)
        Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Tab Bar Row
            SizedBox(
              height: widget.tabHeight,
              child: Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () => _switchTab(0),
                      behavior: HitTestBehavior.opaque,
                      child: Center(
                        child: AnimatedDefaultTextStyle(
                          duration: widget.animationDuration,
                          style: _currentIndex == 0
                              ? defaultActiveStyle
                              : defaultInactiveStyle,
                          child: Text(widget.firstTabTitle),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () => _switchTab(1),
                      behavior: HitTestBehavior.opaque,
                      child: Center(
                        child: AnimatedDefaultTextStyle(
                          duration: widget.animationDuration,
                          style: _currentIndex == 1
                              ? defaultActiveStyle
                              : defaultInactiveStyle,
                          child: Text(widget.secondTabTitle),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // Animated Body Container
            Padding(
              padding: widget.contentPadding,
              child: AnimatedSize(
                duration: widget.animationDuration,
                curve: widget.animationCurve,
                child: AnimatedSwitcher(
                  duration: widget.animationDuration,
                  child: KeyedSubtree(
                    key: ValueKey<int>(_currentIndex),
                    child: _currentIndex == 0
                        ? widget.firstTabView
                        : widget.secondTabView,
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
