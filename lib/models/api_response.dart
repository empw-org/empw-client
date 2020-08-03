class ApiResponse<T> {
  T data ;
  bool check;
  String message;

  ApiResponse({
    this.data ,
    this.check = false,
    this.message,
  });
}