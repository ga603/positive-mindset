import 'package:flutter/material.dart';
import 'dart:async';

class AnimatedGradientBg extends StatefulWidget {
  final Widget child;
  const AnimatedGradientBg({super.key, required this.child});

  @override
  State<AnimatedGradientBg> createState() => _AnimatedGradientBgState();
}

class _AnimatedGradientBgState extends State<AnimatedGradientBg> {
  final List<Color> _colors = [
    const Color(0xFFF0FDF4), // Soft Green
    const Color(0xFFF8FAFC), // Cool White
    const Color(0xFFFEFCE8), // Warm Sunlight
    const Color(0xFFF0FDF4), // Back to Soft Green
  ];
  
  int _index = 0;
  Color _topColor = const Color(0xFFF0FDF4);
  Color _bottomColor = const Color(0xFFF8FAFC);
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    // Shift colors every 4 seconds for a calming, breathing effect
    _timer = Timer.periodic(const Duration(seconds: 4), (timer) {
      if (mounted) {
        setState(() {
          _index = (_index + 1) % _colors.length;
          _topColor = _colors[_index];
          _bottomColor = _colors[(_index + 1) % _colors.length];
        });
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(seconds: 4),
      curve: Curves.easeInOut,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [_topColor, _bottomColor],
        ),
      ),
      child: widget.child,
    );
  }
}