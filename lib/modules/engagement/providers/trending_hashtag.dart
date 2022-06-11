import 'dart:convert';

import 'package:flutter/material.dart';

import '../../../core/models/trending_hashtags.dart';
import '../../../core/services/base_api.dart';

class HashTagProvider with ChangeNotifier {
  bool isLoading = false;

  TextEditingController searchController = TextEditingController();

  List<Tags> _tags = [];

  List<Tags> get tags {
    return [..._tags];
  }

  Future<dynamic> getTrendingHashTag() async {
    showLoading();

    var response = await connect("search/trending?green=1&latin=1");

    if (response.statusCode == 200) {
      var parsedData = TrendingHashtags.fromJson(json.decode(response.body));

      List<Tags> listofTag = [];
      for (var currentTag in parsedData.tags!) {
        listofTag.add(currentTag);
        _tags = listofTag;
      }

      hideLoading();
      notifyListeners();
      return tags;
    } else {
      throw Exception('Failed to load post');
    }
  }

  showLoading() {
    isLoading = true;
    notifyListeners();
  }

  hideLoading() {
    isLoading = false;
    notifyListeners();
  }
}
