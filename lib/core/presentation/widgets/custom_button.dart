import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '/core/shared/utils/style_repository.dart';
import '/core/shared/utils/colors_repository.dart';

/// Custom Button Widget
///
/// A customizable button widget with title, background color,
/// and text color properties.
///
/// Example usage:
///
/// ```dart
/// CustomButton(
///   title: 'Click Me',
///   onPressed: () {
///     // Your action here
///   },
///   backgroundColor: Colors.blue,
///   colorTitle: Colors.white,
/// )
/// ```
class CustomButton extends StatelessWidget {
  final String title;
  final Color? backgroundColor;
  final Color? colorTitle;
  final VoidCallback? onPressed;

  /// Creates a [CustomButton] with the specified [title], [onPressed],
  /// [backgroundColor], and [colorTitle].
  const CustomButton({
    Key? key,
    required this.title,
    required this.onPressed,
    this.backgroundColor,
    this.colorTitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20.w),
      child: Center(
        child: SizedBox(
          height: 30.h,
          width: MediaQuery.of(context).size.width / 2.5,
          child: ElevatedButton(
            onPressed: onPressed,
            child: Text(
              title,
              style: medium.copyWith(
                color: colorTitle ?? ColorsRepository.realBlue,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
