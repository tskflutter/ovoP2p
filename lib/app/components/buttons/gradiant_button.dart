import 'package:flutter/material.dart';
import 'package:ovolutter/core/utils/util_exporter.dart';

class GradientAddButton extends StatelessWidget {
  final VoidCallback onPressed;

  const GradientAddButton({
    Key? key,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),

        color: MyColor.getSecondaryColor().withValues(alpha: .2),
        gradient: LinearGradient(
          colors: MyColor.cardGradiant,
          begin: Alignment.centerLeft,
          end: Alignment.center,
        ),
        // Gradient border
        border: Border.all(
          width: 1,
          color: Colors.transparent,
        ),
      ),
      child: CustomPaint(
        painter: GradientBorderPainter(
          gradient: LinearGradient(
            colors: MyColor.cardGradiant,
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
          ),
          radius: 12,
        ),
        child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            elevation: 0,
            backgroundColor: Colors.transparent,
            shadowColor: Colors.transparent,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ShaderMask(
                shaderCallback: (bounds) => LinearGradient(
                  colors: MyColor.cardGradiant,
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                ).createShader(bounds),
                child: const Icon(
                  Icons.add,
                  color: Colors.white,
                  size: 18,
                ),
              ),
              // ADD text with gradient
              ShaderMask(
                shaderCallback: (bounds) => LinearGradient(
                  colors: MyColor.cardGradiant,
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                ).createShader(bounds),
                child: const Text(
                  'ADD',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Custom painter for gradient border
class GradientBorderPainter extends CustomPainter {
  final LinearGradient gradient;
  final double radius;
  final double strokeWidth;

  GradientBorderPainter({
    required this.gradient,
    required this.radius,
    this.strokeWidth = 1,
  });

  @override
  void paint(Canvas canvas, Size size) {
    // Create a rect that is slightly smaller than the desired size to account for the stroke width
    final Rect rect = Rect.fromLTWH(
      strokeWidth / 2,
      strokeWidth / 2,
      size.width - strokeWidth,
      size.height - strokeWidth,
    );

    // Create a rounded rectangle
    final RRect rrect = RRect.fromRectAndRadius(
      rect,
      Radius.circular(radius),
    );

    // Create a path that draws the rounded rectangle
    final Path path = Path()..addRRect(rrect);

    // Create a paint object with the gradient
    final Paint paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..shader = gradient.createShader(rect);

    // Draw the border
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(GradientBorderPainter oldDelegate) {
    return oldDelegate.gradient != gradient || oldDelegate.radius != radius || oldDelegate.strokeWidth != strokeWidth;
  }
}
