import 'package:credo_engage/modules/engagement/widgets/third_tab.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';
import 'package:websafe_svg/websafe_svg.dart';

import '../../shared/create_withpop_appbar.dart';
import 'providers/auto_generate.dart';
import 'providers/image_picker_provider.dart';
import 'widgets/first_tab.dart';
import 'widgets/second_tab.dart';

class Engagement extends StatefulWidget {
  const Engagement({Key? key}) : super(key: key);

  @override
  State<Engagement> createState() => _EngagementState();
}

class _EngagementState extends State<Engagement> {
  late TextEditingController _textEditingController;

  @override
  void initState() {
    _textEditingController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final ipp = Provider.of<ImagePickerProvider>(context);
    return Scaffold(
      appBar: createNoteAppBar(context),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 16, top: 16, right: 16),
              child: Row(
                children: [
                  WebsafeSvg.asset(
                    'assets/svg/Twitter.svg',
                    width: 24,
                    height: 24,
                  ),
                  const SizedBox(width: 8),
                  Text(
                    "Twitter",
                    style: Theme.of(context).textTheme.headline3!.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ],
              ),
            ),
            // const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                style: Theme.of(context).textTheme.headline4!.copyWith(
                      fontSize: 18,
                    ),
                maxLines: 5,
                maxLength: 280,
                controller: _textEditingController,
                decoration: const InputDecoration(
                  labelText: "Write something...",
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Container(
                  margin: const EdgeInsets.only(left: 16),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(
                      color: Theme.of(context).dividerColor,
                    ),
                  ),
                  child: TextButton.icon(
                    icon: const Icon(
                      Icons.add_a_photo,
                      size: 20,
                    ),
                    label: Text(
                      "Add an image",
                      style: Theme.of(context).textTheme.headline5!.copyWith(
                            fontWeight: FontWeight.normal,
                          ),
                    ),
                    onPressed: () {
                      ipp.showPicker(context);
                    },
                  ),
                ),
                const Spacer(),
                Container(
                  margin: const EdgeInsets.only(right: 16),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(
                      color: Theme.of(context).dividerColor,
                    ),
                  ),
                  child: TextButton.icon(
                    icon: const Icon(
                      Icons.send,
                      size: 20,
                    ),
                    label: Text(
                      "Post",
                      style: Theme.of(context).textTheme.headline5!.copyWith(
                            fontWeight: FontWeight.normal,
                          ),
                    ),
                    onPressed: () {
                      // Share.share(_textEditingController.text);
                      Share.shareFiles(
                        [
                          ipp.imagePaths.first,
                        ],
                        text: _textEditingController.text,
                      );
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            // ignore: unnecessary_null_comparison
            if (ipp.convertedImage != null)
              Padding(
                padding: const EdgeInsets.only(left: 16),
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(5),
                      child: Image.file(
                        ipp.convertedImage!,
                        width: 100,
                        height: 100,
                        fit: BoxFit.fitHeight,
                      ),
                    ),
                    Positioned(
                      top: -8,
                      right: -8,
                      child: GestureDetector(
                        onTap: () {
                          ipp.clearImage();
                        },
                        child: const CircleAvatar(
                          radius: 12,
                          child: Icon(
                            Icons.close,
                            size: 15,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            SizedBox(
              height: 500,
              child: DefaultTabController(
                  length: 3,
                  child: Column(
                    children: <Widget>[
                      TabBar(
                        tabs: [
                          Tab(
                            child: Text(
                              "Trending",
                              style: Theme.of(context)
                                  .textTheme
                                  .headline5!
                                  .copyWith(
                                    fontWeight: FontWeight.normal,
                                  ),
                            ),
                          ),
                          Tab(
                            child: Text(
                              "Custom",
                              style: Theme.of(context)
                                  .textTheme
                                  .headline5!
                                  .copyWith(
                                    fontWeight: FontWeight.normal,
                                  ),
                            ),
                          ),
                          Tab(
                            child: Text(
                              "Auto Generate",
                              style: Theme.of(context)
                                  .textTheme
                                  .headline5!
                                  .copyWith(
                                    fontWeight: FontWeight.normal,
                                  ),
                            ),
                          ),
                        ],
                      ),
                      Expanded(
                        flex: 1,
                        child: TabBarView(
                          children: [
                            const FirstTab(),
                            const SecondTab(),
                            Consumer<AutoGenerateProvider>(
                              builder: (context, autoGenerateProvider, _) =>
                                  ThirdTab(
                                isLoading: autoGenerateProvider.isLoading,
                                retrievedPost:
                                    autoGenerateProvider.retrievedPost,
                                onPressed: () {
                                  autoGenerateProvider.getHashtagFromPost(
                                    _textEditingController.text,
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
