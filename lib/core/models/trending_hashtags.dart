class TrendingHashtags {
  bool? result;
  String? message;
  int? code;
  List<Tags>? tags;

  TrendingHashtags({this.result, this.message, this.code, this.tags});

  TrendingHashtags.fromJson(Map<String, dynamic> json) {
    result = json['result'];
    message = json['message'];
    code = json['code'];
    if (json['tags'] != null) {
      tags = <Tags>[];
      json['tags'].forEach((v) {
        tags!.add(Tags.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['result'] = result;
    data['message'] = message;
    data['code'] = code;
    if (tags != null) {
      data['tags'] = tags!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Tags {
  String? tag;
  int? tweets;
  int? retweets;
  int? exposure;
  double? links;
  double? photos;
  double? mentions;
  int? color;

  Tags(
      {this.tag,
      this.tweets,
      this.retweets,
      this.exposure,
      this.links,
      this.photos,
      this.mentions,
      this.color});

  Tags.fromJson(Map<String, dynamic> json) {
    tag = json['tag'];
    tweets = json['tweets'];
    retweets = json['retweets'];
    exposure = json['exposure'];
    links = json['links'];
    photos = json['photos'];
    mentions = json['mentions'];
    color = json['color'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['tag'] = tag;
    data['tweets'] = tweets;
    data['retweets'] = retweets;
    data['exposure'] = exposure;
    data['links'] = links;
    data['photos'] = photos;
    data['mentions'] = mentions;
    data['color'] = color;
    return data;
  }
}
