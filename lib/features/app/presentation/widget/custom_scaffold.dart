import 'package:chopper_network/core/config/flavor_config.dart';
import 'package:chopper_network/core/utils/extensions/context_extensions.dart';
import 'package:flutter/material.dart';

class CustomScaffold extends StatelessWidget {
  const CustomScaffold({
    required this.body,
    super.key,
    this.bottomNavigationBar,
  });
  final Widget body;
  final Widget? bottomNavigationBar;

  void _onTap(BuildContext context) {
    final focusScope = FocusScope.of(context);

    if (focusScope.hasFocus) {
      focusScope.unfocus();
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () => _onTap(context),
      child: Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: bottomNavigationBar,
        body: RadialGradientBackground(child: body),
        endDrawer: !FlavorConfig.isProd
            ? SizedBox(
                width: context.width * 0.8,
                child: const Text('Debug View'),
              )
            : null,
      ),
    );
  }
}

class RadialGradientBackground extends StatelessWidget {
  const RadialGradientBackground({required this.child, super.key});
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.width,
      height: context.height,
      decoration: const BoxDecoration(
        gradient: RadialGradient(
          center: Alignment(0.2105, 0.9694),
          radius: 4.1156,
          colors: [
            Color(0xff8A2BE2),
            Color(0xFF00FFFF),
          ],
          stops: [0.0, 1.0],
        ),
      ),
      child: child,
    );
  }
}
