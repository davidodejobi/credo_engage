import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lottie/lottie.dart';

class ThirdTab extends StatelessWidget {
  final VoidCallback onPressed;
  final bool isLoading;
  final String retrievedPost;
  const ThirdTab({
    Key? key,
    required this.isLoading,
    required this.onPressed,
    required this.retrievedPost,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          ElevatedButton(
            onPressed: onPressed,
            child: const Text('Get Hashtags from Post'),
          ),
          const SizedBox(height: 16),
          isLoading
              ? Lottie.asset(
                  'assets/animations/loading.json',
                  fit: BoxFit.cover,
                )
              : InkWell(
                  onTap: () {
                    Clipboard.setData(ClipboardData(text: retrievedPost))
                        .then((_) {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          content: Text(
                              "Generated post with hashtags has been copied to your clipboard 🎉🎉🎉")));
                    });
                  },
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        retrievedPost,
                        style: Theme.of(context).textTheme.headline4,
                      ),
                    ),
                  ),
                ),
        ],
      ),
    );
  }
}
