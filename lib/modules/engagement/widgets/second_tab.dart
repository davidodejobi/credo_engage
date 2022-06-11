import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

import '../providers/text_hashtag.dart';
import '../../../utils/theme.dart';
import 'card_content.dart';

// ignore: must_be_immutable
class SecondTab extends StatelessWidget {
  const SecondTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final MyColors myColors = Theme.of(context).extension<MyColors>()!;
    final textTags = Provider.of<TextHashTagProvider>(context);
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          TextField(
            onSubmitted: (value) {
              textTags.getFromTextHashTag(value);
            },
            decoration: InputDecoration(
              hintText: 'get hash tag from inputed text',
              prefixIcon: const Icon(Icons.search),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  width: 1,
                  color: Theme.of(context).dividerColor,
                ),
                borderRadius: BorderRadius.circular(5),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(width: 1, color: myColors.colour!),
                borderRadius: BorderRadius.circular(5),
              ),
            ),
          ),
          textTags.isLoading
              ? Lottie.asset(
                  'assets/animations/loading.json',
                  fit: BoxFit.cover,
                )
              : Expanded(
                  child: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 1.0,
                    ),
                    itemCount: textTags.data.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          Clipboard.setData(ClipboardData(
                                  text: '#${textTags.data[index].tag}'))
                              .then((_) {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                content: Text(
                                    "#${textTags.data[index].tag} copied to clipboard 🎉🎉🎉")));
                          });
                        },
                        child: Card(
                          elevation: 3,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    const SizedBox(width: 8),
                                    Flexible(
                                      child: Text(
                                          '#${textTags.data[index].tag!}',
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline4!
                                              .copyWith(
                                                fontWeight: FontWeight.bold,
                                              )),
                                    )
                                  ],
                                ),
                                buildContent(
                                  context: context,
                                  content:
                                      textTags.data[index].tweets!.toString(),
                                  topic: 'tweets',
                                ),
                                buildContent(
                                  context: context,
                                  content:
                                      textTags.data[index].retweets!.toString(),
                                  topic: 'retweets',
                                ),
                                buildContent(
                                  context: context,
                                  content:
                                      textTags.data[index].exposure!.toString(),
                                  topic: 'exposure',
                                ),
                                buildContent(
                                  context: context,
                                  content: textTags.data[index].links!
                                      .toStringAsPrecision(2),
                                  topic: 'links',
                                ),
                                buildContent(
                                  context: context,
                                  content: textTags.data[index].mentions!
                                      .toStringAsPrecision(2),
                                  topic: 'mentions',
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
        ],
      ),
    );
  }
}
