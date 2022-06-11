class TextHashTag {
  bool? result;
  int? code;
  String? message;
  List<Data>? data;

  TextHashTag({this.result, this.code, this.message, this.data});

  TextHashTag.fromJson(Map<String, dynamic> json) {
    result = json['result'];
    code = json['code'];
    message = json['message'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['result'] = result;
    data['code'] = code;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  String? hashtag;
  String? tag;
  num? tweets;
  num? exposure;
  num? retweets;
  num? images;
  num? links;
  num? mentions;
  num? color;

  Data(
      {this.hashtag,
      this.tag,
      this.tweets,
      this.exposure,
      this.retweets,
      this.images,
      this.links,
      this.mentions,
      this.color});

  Data.fromJson(Map<String, dynamic> json) {
    hashtag = json['hashtag'];
    tag = json['tag'];
    tweets = json['tweets'];
    exposure = json['exposure'];
    retweets = json['retweets'];
    images = json['images'];
    links = json['links'];
    mentions = json['mentions'];
    color = json['color'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['hashtag'] = hashtag;
    data['tag'] = tag;
    data['tweets'] = tweets;
    data['exposure'] = exposure;
    data['retweets'] = retweets;
    data['images'] = images;
    data['links'] = links;
    data['mentions'] = mentions;
    data['color'] = color;
    return data;
  }
}
