import 'package:flutter/material.dart';
import 'package:smart_neighbourhood/res/Constants/App_colors.dart';
import 'package:smart_neighbourhood/res/Constants/App_textStyle.dart';

class HomeWidget extends StatelessWidget {
  final String image;
  final String title;
  final String? subtitle;
  final Color color;
  final VoidCallback onTap;

  const HomeWidget({
    super.key,
    required this.image,
    required this.title,
    this.subtitle,
    required this.color,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    final cardWidth = width * 0.47;
    final iconSize = cardWidth * 0.32;
    final titleSize = width * 0.038;
    final subtitleSize = width * 0.03;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: cardWidth,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.grey.shade100,
          border: Border.all(color: Colors.grey.withOpacity(0.3)),
          borderRadius: BorderRadius.circular(22),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.06),
              blurRadius: 12,
              offset: const Offset(0, 6),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            /// 🔹 Icon container
            Container(
              height: iconSize,
              width: iconSize,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey.withOpacity(0.3)),
                color: color.withOpacity(0.12),
                borderRadius: BorderRadius.circular(18),
              ),
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Image.asset(
                  image,
                  fit: BoxFit.contain,
                ),
              ),
            ),

            const SizedBox(height: 14),

            /// 🔹 Title
            Text(
              title,
              textAlign: TextAlign.center,
              style: AppTextStyle.heading(titleSize,
                  color: Appcolors.textColor_black),
            ),

            if (subtitle != null) ...[
              const SizedBox(height: 6),

              /// 🔹 Subtitle
              Text(
                subtitle!,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: subtitleSize,
                  color: Colors.grey.shade600,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
