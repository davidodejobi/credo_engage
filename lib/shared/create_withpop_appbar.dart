import 'package:flutter/material.dart';

PreferredSizeWidget createNoteAppBar(BuildContext context) {
  return PreferredSize(
    preferredSize: const Size.fromHeight(kToolbarHeight),
    child: SafeArea(
      child: SizedBox(
        height: kToolbarHeight,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            children: [
              Card(
                color: Theme.of(context).cardColor,
                child: IconButton(
                  icon: Icon(
                    Icons.arrow_back_ios_new_rounded,
                    color: Theme.of(context).iconTheme.color,
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ),
              // const Spacer(),
              // Card(
              //   color: Theme.of(context).cardColor,
              //   child: IconButton(
              //     icon: const Icon(
              //       Icons.save,
              //     ),
              //     onPressed: () {},
              //     tooltip: "Save",
              //   ),
              // ),
            ],
          ),
        ),
      ),
    ),
  );
}

/*
AppBar(
    leading: Padding(
      padding: const EdgeInsets.only(left: 8.0),
      child: Card(
        color: Theme.of(context).cardColor,
        child: IconButton(
          icon: Icon(
            Icons.arrow_back_ios_new_rounded,
            color: Theme.of(context).iconTheme.color,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
    ),
    actions: [
      Card(
        color: Theme.of(context).cardColor,
        child: IconButton(
          icon: Icon(
            Icons.search,
            color: Theme.of(context).iconTheme.color,
          ),
          onPressed: () {},
        ),
      ),
      const SizedBox(width: 8),
      Card(
        color: Theme.of(context).cardColor,
        child: IconButton(
          icon: notifier.isDarkTheme
              ? const Icon(
                  Icons.wb_sunny,
                  color: Colors.white,
                )
              : const Icon(
                  Icons.nightlight,
                ),
          onPressed: () => notifier.toggleTheme(),
          tooltip: "Toggle brightness",
        ),
      ),
      const SizedBox(width: 8),
    ],
  );
*/
