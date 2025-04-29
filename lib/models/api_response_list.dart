class ApiResponseList<T> {
  final int status;
  final String message;
  final List<T> data;

  ApiResponseList({
    required this.status,
    required this.message,
    required this.data,
  });

  factory ApiResponseList.fromJson(
    Map<String, dynamic> json,
    T Function(dynamic) fromJsonT,
  ) {
    var list = json["data"] as List;
    List<T> listT = list.map((item) => fromJsonT(item)).toList();

    return ApiResponseList(
      status: json["status"],
      message: json["message"],
      data: listT,
    );
  }
}
