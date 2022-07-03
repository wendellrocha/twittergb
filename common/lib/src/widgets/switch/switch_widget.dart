import 'package:flutter/material.dart';

class SwitchWidget extends StatelessWidget {
  final bool value;
  final Function(bool value) onChanged;
  final String? title;
  final bool showTitle;
  const SwitchWidget({
    Key? key,
    required this.value,
    required this.onChanged,
    this.title,
    this.showTitle = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            height: 20,
            width: 40,
            child: Switch.adaptive(
              value: value,
              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
              onChanged: (value) => onChanged.call(value),
            ),
          ),
          if (showTitle) ...[
            const SizedBox(width: 8),
            Text(
              title!,
              style: Theme.of(context).textTheme.bodyText1!.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
          ]
        ],
      ),
    );
  }
}
