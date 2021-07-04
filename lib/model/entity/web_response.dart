abstract class WebResponse<T> {
  final Meta meta;
  final T data;
  WebResponse(this.meta, this.data);
}

class Meta {
  int code;
  String message;
  Meta(this.code, this.message);

  factory Meta.fromJson(Map<String, dynamic> json) {
    return Meta(
      json['code'],
      json['message'],
    );
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['message'] = this.message;
    return data;
  }
}
