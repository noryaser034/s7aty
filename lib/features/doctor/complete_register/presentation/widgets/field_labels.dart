import 'package:flutter/material.dart';
import 'package:se7ety/core/style/text_styles.dart';

class FieldLabel extends StatelessWidget {
  const FieldLabel(this.label, {super.key});
  final String label;

  @override
  build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Text(label, style: TextStyles.w400s15),
    );
  }
}
