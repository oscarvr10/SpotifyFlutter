import 'package:flutter/material.dart';

class CustomChip extends StatelessWidget {
  final String text;
  const CustomChip({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    final fontStyle = Theme.of(context).textTheme;

    return Chip(
      label: Text(
        text,
        style: fontStyle.labelMedium!.copyWith(
          letterSpacing: 0,
          fontWeight: FontWeight.w500,
        ),
      ),
      labelStyle: fontStyle.labelSmall!.copyWith(color: Colors.white),
      backgroundColor: const Color.fromRGBO(42, 42, 42, 1.0),
      surfaceTintColor: const Color.fromRGBO(42, 42, 42, 1.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
    );
  }
}
