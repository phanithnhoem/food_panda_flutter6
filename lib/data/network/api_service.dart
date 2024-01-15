import 'dart:io';

import 'package:food_panda6/data/app_exception.dart';
import 'package:http/http.dart' as http;

class ApiService {

  Future<dynamic> getApi(url) async {
    http.StreamedResponse? response;

    try{
      var request = http.Request('GET', Uri.parse(url));
      response = await request.send();
      return returnResponse(response);
    }on SocketException {
      throw FetchDataException(response!.reasonPhrase.toString());
    }
  }

  returnResponse(http.StreamedResponse response) async {
    switch(response.statusCode){
      case 200:
        return await response.stream.bytesToString();
      case 500:
    }
  }
}