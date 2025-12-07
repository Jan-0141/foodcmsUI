import 'dart:math' as math;
import 'package:flutter/material.dart';

class PatternBackground extends StatelessWidget {
  final Widget child;
  final String assetPath;
  final double opacity;
  final Color? overlayColor;
  final double scale;
  final double angleDegrees;

  const PatternBackground({
    super.key,
    required this.child,
    required this.assetPath,
    this.opacity = 0.1,
    this.overlayColor,
    this.scale = 1.0,
    this.angleDegrees = 0.0,
  });

  @override
  Widget build(BuildContext context) {
    final angleRadians = angleDegrees * math.pi / 180;

    return LayoutBuilder(
      builder: (context, constraints) {
        // คำนวณความยาวเส้นทแยงมุมของพื้นที่จอ
        final width = constraints.maxWidth;
        final height = constraints.maxHeight;
        final diagonal = math.sqrt(width * width + height * height);

        return Stack(
          children: [
            // พื้นหลัง pattern ขยายเป็นสี่เหลี่ยมจัตุรัสขนาด diagonal แล้วค่อยหมุน
            Positioned.fill(
              child: Center(
                child: Transform.rotate(
                  angle: angleRadians,
                  child: Opacity(
                    opacity: opacity,
                    child: SizedBox(
                      width: diagonal,
                      height: diagonal,
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(assetPath),
                            repeat: ImageRepeat.repeat,
                            fit: BoxFit.none,
                            scale: scale,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),

            // สีทับด้านบน (ถ้าอยากให้จาง/ออกโทนสี)
            if (overlayColor != null)
              Positioned.fill(
                child: Container(color: overlayColor),
              ),

            // เนื้อหาจริงของหน้า
            Positioned.fill(child: child),
          ],
        );
      },
    );
  }
}
