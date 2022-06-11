import 'package:flutter/material.dart';

buildContent({
  required BuildContext context,
  required String topic,
  required String content,
}) {
  return Row(
    children: [
      Text(
        '\u2022   $topic:',
        style: Theme.of(context).textTheme.headline5,
      ),
      const SizedBox(width: 8),
      Text(
        content,
        style: Theme.of(context).textTheme.headline6!.copyWith(
              fontWeight: FontWeight.bold,
            ),
      ),
    ],
  );
}
