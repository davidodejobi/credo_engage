import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../utils/engage.dart';

dialog(BuildContext context, VoidCallback? onPressed) {
  showDialog(
      context: context,
      builder: (context) {
        final sta = Provider.of<Engage>(context);
        return AlertDialog(
          title: Text(
            'Select an account to proceed with :',
            style: Theme.of(context).textTheme.headline4!.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(children: [
                Switch.adaptive(
                  value: sta.switcher,
                  onChanged: (value) {
                    sta.toggle();
                  },
                ),
                const SizedBox(width: 8),
                Text(
                  "Facebook",
                  style: Theme.of(context).textTheme.headline4,
                ),
              ]),
              Row(children: [
                Switch.adaptive(
                  value: sta.switcher1,
                  onChanged: (value) {
                    sta.toggle1();
                  },
                ),
                const SizedBox(width: 8),
                Text(
                  "Instagram",
                  style: Theme.of(context).textTheme.headline4,
                ),
              ]),
              Row(children: [
                Switch.adaptive(
                  value: sta.switcher2,
                  onChanged: (value) {
                    sta.toggle2();
                  },
                ),
                const SizedBox(width: 8),
                Text(
                  "Twitter",
                  style: Theme.of(context).textTheme.headline4,
                ),
              ]),
            ],
          ),
          actions: <Widget>[
            ElevatedButton(
              onPressed: onPressed,
              child: const Text(
                "Continue",
              ),
            ),
          ],
        );
      });
}
