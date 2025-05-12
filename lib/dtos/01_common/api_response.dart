class ApiResponse<T> {
  final int status;
  final String message;
  final T? data;

  ApiResponse({
    required this.status,
    required this.message,
    required this.data,
  });

  factory ApiResponse.fromJson(
    Map<String, dynamic> json,
    T Function(dynamic) fromJsonT,
  ) {
    final rawData = json['data'];
    return ApiResponse(
      status: json["status"],
      message: json["message"],
      data: rawData != null ? fromJsonT(rawData) : null,
    );
  }
}
