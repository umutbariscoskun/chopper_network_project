import 'package:flash/flash.dart';
import 'package:flash/flash_helper.dart';
import 'package:flutter/material.dart';

extension ContextExtension on BuildContext {
  double get width => MediaQuery.of(this).size.width;
  double get height => MediaQuery.of(this).size.height;
  double get bottomPadding => MediaQuery.of(this).padding.bottom;
  double get topPadding => MediaQuery.of(this).padding.top;
  double get defaultPadding => 16;

  double get bottomOrDefaultPadding =>
      bottomPadding > 0 ? bottomPadding : defaultPadding;

  // textTheme
  TextTheme get textTheme => Theme.of(this).textTheme;

  /// Show a flash bar at the top of the screen
  Future<void> showTopError({
    required String title,
  }) async {
    return showErrorBar(
      position: FlashPosition.top,
      content: Text(title),
    );
  }
}
