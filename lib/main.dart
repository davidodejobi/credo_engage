import 'package:credo_engage/modules/engagement/providers/auto_generate.dart';
import 'package:credo_engage/modules/engagement/providers/image_picker_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'modules/engagement/providers/text_hashtag.dart';
import 'modules/engagement/providers/trending_hashtag.dart';
import 'modules/home/home.dart';
import 'utils/engage.dart';
import 'utils/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  final Color colorSeedLight = const Color(0xFF00296B);
  final Color colorSeedDark = const Color(0xFF6B8BC3);
  final bool material3 = true;

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<GoTagTheme>(
          create: (_) => GoTagTheme(),
        ),
        ChangeNotifierProvider<Engage>(
          create: (_) => Engage(),
        ),
        ChangeNotifierProvider<HashTagProvider>(
          create: (_) => HashTagProvider(),
        ),
        ChangeNotifierProvider<TextHashTagProvider>(
          create: (_) => TextHashTagProvider(),
        ),
        ChangeNotifierProvider<AutoGenerateProvider>(
          create: (_) => AutoGenerateProvider(),
        ),
        ChangeNotifierProvider<ImagePickerProvider>(
          create: (_) => ImagePickerProvider(),
        ),
      ],
      child: Consumer<GoTagTheme>(
        builder: (context, appTheme, _) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Credo Engage',
            theme: GoTagTheme.light(colorSeedLight, material3),
            darkTheme: GoTagTheme.dark(colorSeedDark, material3),
            themeMode: appTheme.currentTheme,
            home: const Home(),
          );
        },
      ),
    );
  }
}
