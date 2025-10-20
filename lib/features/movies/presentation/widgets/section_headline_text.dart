import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:your_cinema/core/theme/text_styles.dart';

class SectionHeadlineText extends StatelessWidget {
  const SectionHeadlineText({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 8.w),
      child: Text(text, style: TextStyles.font24RegulerWhite),
    );
  }
}
