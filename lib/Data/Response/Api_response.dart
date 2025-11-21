import 'package:smart_neighbourhood/Data/Response/Status.dart';

class ApiResponse<T> {
  Status? status;
  T? data;
  String? msg;
  ApiResponse(this.data, this.msg, this.status);
  ApiResponse.LOADING() : status = Status.LOADING;
  ApiResponse.ERROR() : status = Status.ERROR;
  ApiResponse.COMPLETED() : status = Status.COMPLETED;
  String tostring() {
    return 'Status : $status \n Data: $data \n Message: $msg ';
  }
}
