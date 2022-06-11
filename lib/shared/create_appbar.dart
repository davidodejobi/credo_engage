import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../utils/theme.dart';

PreferredSizeWidget createAppBar(
  String title,
  BuildContext context,
) {
  var notifier = Provider.of<GoTagTheme>(context);
  return AppBar(
    title: Text(
      title,
      style: Theme.of(context).textTheme.headline3!.copyWith(
            fontWeight: FontWeight.bold,
          ),
    ),
    actions: [
      Card(
        color: Theme.of(context).cardColor,
        child: IconButton(
          icon: notifier.isDarkTheme
              ? Icon(
                  Icons.wb_sunny,
                  color: Theme.of(context).iconTheme.color,
                )
              : Icon(
                  Icons.nightlight,
                  color: Theme.of(context).iconTheme.color,
                ),
          onPressed: () => notifier.toggleTheme(),
          tooltip: "Toggle brightness",
        ),
      ),
      const SizedBox(width: 8),
    ],
  );
}
