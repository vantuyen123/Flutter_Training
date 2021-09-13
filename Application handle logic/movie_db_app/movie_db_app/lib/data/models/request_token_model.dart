class RequestTokenModel {
  final bool success;
  final String requestToken;
  final String expireAt;

  RequestTokenModel({this.success, this.requestToken, this.expireAt});

  factory RequestTokenModel.fromJson(Map<String, dynamic> json) {
    return RequestTokenModel(
      success: json['success'],
      requestToken: json['request_token'],
      expireAt: json['expires_at'],
    );
  }

  Map<String, dynamic> toJson() => {
        'request_token': requestToken,
      };
}
