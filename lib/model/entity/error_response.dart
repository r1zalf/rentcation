class ErrorResponse {
  ErrorResponse(
    this.message,
    this.errors,
  );

  String message;
  Errors errors;

  factory ErrorResponse.fromJson(Map<String, dynamic> json) => ErrorResponse(
        json["message"],
        Errors.fromJson(json["errors"]),
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "errors": errors.toJson(),
      };
}

class Errors {
  Errors(this.dyanmic);

  List<String> dyanmic;

  factory Errors.fromJson(Map<String, dynamic> json) => Errors(
        List<String>.from(
          json["email"].map((x) => x),
        ),
      );

  Map<String, dynamic> toJson() => {
        "email": List<dynamic>.from(dyanmic.map((x) => x)),
      };
}
