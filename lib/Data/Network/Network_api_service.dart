import 'dart:convert';

import 'package:smart_neighbourhood/Data/App_Exception.dart';
import 'package:smart_neighbourhood/Data/Network/Base_api_service.dart';
import 'package:http/http.dart' as http;

class NetworkApiService extends BaseApiService {
  dynamic Jsonresponse;
  @override
  Future Getapi(String Url) {
    // TODO: implement Getapi
    throw UnimplementedError();
  }

  @override
  Future Postapi(data, String Url) {
    // TODO: implement Postapi
    throw UnimplementedError();
  }
}

dynamic ReturnResponse(http.Response Response) {
  switch (Response.statusCode) {
    case 200:
      dynamic Jsonresponse = jsonDecode(Response.body);
      return Jsonresponse;
    case 400:
      throw InvalidaUrl();
    case 401:
      throw RequestTimeout();
    default:
      throw FetchdataException('internet error');
  }
}
