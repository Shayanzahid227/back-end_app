
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hustler_syn/core/constant/colors.dart';

class DashedBorderPainter extends CustomPainter {
  final Color color;
  final double strokeWidth;
  final double gap;
  final double dash;
  final double borderRadius;

  DashedBorderPainter({
    required this.color,
    this.strokeWidth = 1.0,
    this.gap = 3.0,
    this.dash = 3.0,
    required this.borderRadius, // NEW: Required in constructor
  });

  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..color = color
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke;

    final path = Path();

    // Start drawing the rounded rectangle path
    path.addRRect(RRect.fromRectAndRadius(
      Rect.fromLTWH(0, 0, size.width, size.height),
      Radius.circular(borderRadius), // CHANGE: Use the provided borderRadius
    ));

    // Apply the dash effect (dot length is 3.0)
    var metrics = path.computeMetrics();
    for (var metric in metrics) {
      double distance = 0.0;
      while (distance < metric.length) {
        // Draw the dash segment
        canvas.drawPath(
          metric.extractPath(distance, distance + dash),
          paint,
        );
        distance += dash;
        // Move past the gap segment
        distance += gap;
      }
    }
  }

  @override
  bool shouldRepaint(DashedBorderPainter oldDelegate) {
    return oldDelegate.color != color ||
        oldDelegate.strokeWidth != strokeWidth ||
        oldDelegate.gap != gap ||
        oldDelegate.dash != dash ||
        oldDelegate.borderRadius != borderRadius; // NEW: Compare borderRadius
  }
}

class DashedBorderContainer extends StatelessWidget {
  final Widget child;
  final double width;
  final double height;

  final double borderRadius; // NEW: Added borderRadius parameter

  const DashedBorderContainer({
    super.key,
    required this.child,
    required this.width,
    required this.height,
    this.borderRadius = 10.0, // NEW: Default to 10.0 as requested
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 89 ?? width,
      height: 95 ?? height,
      child: CustomPaint(
        painter: DashedBorderPainter(
          color: borderColor,
          strokeWidth: 2.w,
          gap: 3.0,
          dash: 3.0,
          borderRadius: borderRadius, // NEW: Pass borderRadius
        ),
        child: Container(
          decoration: BoxDecoration(
            color: borderColor.withOpacity(0.5),
            borderRadius: BorderRadius.circular(
                borderRadius), // CHANGE: Use the provided borderRadius
          ),
          child: child,
        ),
      ),
    );
  }
}
