import 'package:flutter/material.dart';

class EmotionPicker extends StatelessWidget {
  final String? selected;
  final ValueChanged<String> onSelected;

  const EmotionPicker({
    super.key,
    this.selected,
    required this.onSelected,
  });

  static const emotions = [
    ('😊', '平静'),
    ('😢', '悲伤'),
    ('😤', '愤怒'),
    ('😌', '放松'),
    ('😰', '焦虑'),
    ('🥰', '幸福'),
    ('😐', '麻木'),
    ('💪', '坚强'),
  ];

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: emotions.map((e) {
        final (emoji, label) = e;
        final isSelected = selected == emoji;
        return ChoiceChip(
          selected: isSelected,
          label: Text('$emoji $label'),
          onSelected: (_) => onSelected(emoji),
        );
      }).toList(),
    );
  }
}
