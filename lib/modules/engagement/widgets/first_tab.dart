import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

import '../providers/trending_hashtag.dart';
import 'card_content.dart';

class FirstTab extends StatelessWidget {
  const FirstTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final tags = Provider.of<HashTagProvider>(context);
    return Padding(
      padding: const EdgeInsets.only(left: 16, top: 16, right: 16),
      child: tags.tags.isEmpty
          ? Center(
              child: tags.isLoading
                  ? Lottie.asset(
                      'assets/animations/loading.json',
                      fit: BoxFit.cover,
                    )
                  : ElevatedButton(
                      child: const Text('Get Trending Hashtags'),
                      onPressed: () {
                        tags.getTrendingHashTag();
                      },
                    ),
            )
          : GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 1.0,
              ),
              itemCount: tags.tags.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Clipboard.setData(
                            ClipboardData(text: '#${tags.tags[index].tag}'))
                        .then((_) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                              "#${tags.tags[index].tag} copied to clipboard 🎉🎉🎉"),
                        ),
                      );
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
                                child: Text('#${tags.tags[index].tag!}',
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
                            content: tags.tags[index].tweets!.toString(),
                            topic: 'tweets',
                          ),
                          buildContent(
                            context: context,
                            content: tags.tags[index].retweets!.toString(),
                            topic: 'retweets',
                          ),
                          buildContent(
                            context: context,
                            content: tags.tags[index].exposure!.toString(),
                            topic: 'exposure',
                          ),
                          buildContent(
                            context: context,
                            content:
                                tags.tags[index].links!.toStringAsPrecision(2),
                            topic: 'links',
                          ),
                          buildContent(
                            context: context,
                            content:
                                tags.tags[index].photos!.toStringAsPrecision(2),
                            topic: 'photos',
                          ),
                          buildContent(
                            context: context,
                            content: tags.tags[index].mentions!
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
    );
  }
}
