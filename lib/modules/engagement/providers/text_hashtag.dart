import 'dart:convert';
import 'dart:developer';

import 'package:flutter/cupertino.dart';

import '../../../core/models/text_hashtag.dart';
import '../../../core/services/base_api.dart';

class TextHashTagProvider with ChangeNotifier {
  bool isLoading = false;

  List<Data> _data = [];

  List<Data> get data {
    return [..._data];
  }

  getFromTextHashTag(String searchText) async {
    showLoading();
    var response = await connect("/stats/hashtag-suggestions?text=$searchText");

    if (response.statusCode == 200) {
      var parsedData = TextHashTag.fromJson(json.decode(response.body));
      log('parsedData: ${parsedData.data}');

      List<Data> listOfData = [];
      for (var currentTag in parsedData.data!) {
        listOfData.add(currentTag);
        _data = listOfData;
      }

      hideLoading();
      notifyListeners();
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
