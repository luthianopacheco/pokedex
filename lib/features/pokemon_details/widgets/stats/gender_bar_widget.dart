import 'package:flutter/material.dart';

class GenderBarWidget extends StatelessWidget {
  final double malePercent;
  final double femalePercent;
  const GenderBarWidget({
    super.key,
    required this.malePercent,
    required this.femalePercent,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'GÊNERO',
          textAlign: TextAlign.center,
          style: Theme.of(
            context,
          ).textTheme.labelSmall?.copyWith(color: Color(0x99000000)),
        ),
        const SizedBox(height: 8),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: LinearProgressIndicator(
            value: malePercent / 100,
            backgroundColor: Colors.pink.shade100,
            color: Colors.blue,
            minHeight: 10,
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                spacing: 3,
                children: [
                  Icon(Icons.male_rounded, size: 16),
                  Text(
                    '$malePercent%',
                    style: Theme.of(
                      context,
                    ).textTheme.labelSmall?.copyWith(color: Color(0x99000000)),
                  ),
                ],
              ),
              Row(
                spacing: 3,
                children: [
                  Icon(Icons.female_rounded, size: 16),
                  Text(
                    '$femalePercent%',
                    style: Theme.of(
                      context,
                    ).textTheme.labelSmall?.copyWith(color: Color(0x99000000)),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
