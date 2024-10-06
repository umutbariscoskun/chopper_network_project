import 'package:flutter/material.dart';

/// Easy to use animated button
/// You can wrap your widgets to converting an animated button
/// For example basic usage:
/// ```dart
///CustomAnimatedButton(
///
///       child: Container(width: 200,
///        height: 100,
///       decoration: BoxDecoration(
///        color: Colors.green,
///         borderRadius: BorderRadius.circular(20)
///      ),
///      ),
///   )
///```
class CustomAnimatedButton extends StatefulWidget {
  const CustomAnimatedButton({
    required this.child,
    super.key,
    this.onPressed,
  });
  final Widget child;
  final VoidCallback? onPressed;

  @override
  AnimatedButtonState createState() => AnimatedButtonState();
}

class AnimatedButtonState extends State<CustomAnimatedButton>
    with SingleTickerProviderStateMixin {
  double _scale = 1;
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 100),
    );

    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOut,
    ).drive(Tween<double>(begin: 1, end: 0.9));

    _animation.addListener(() {
      setState(() {
        _scale = _animation.value;
      });
    });

    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        setState(() {
          _scale = 1.0;
        });
      }
    });
  }

  Future<void> _onTap() async {
    await _controller.forward().then((_) {
      _controller.reset();
    });

    if (widget.onPressed != null) {
      widget.onPressed!();
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _onTap,
      child: Transform.scale(
        scale: _scale,
        child: widget.child,
      ),
    );
  }
}
