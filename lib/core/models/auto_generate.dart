class AutoGenerate {
  AutoGenerate({
    required this.result,
    required this.code,
    required this.message,
    required this.post,
  });
  late final bool result;
  late final int code;
  late final String message;
  late final String post;

  AutoGenerate.fromJson(Map<String, dynamic> json) {
    result = json['result'];
    code = json['code'];
    message = json['message'];
    post = json['post'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['result'] = result;
    data['code'] = code;
    data['message'] = message;
    data['post'] = post;
    return data;
  }
}
