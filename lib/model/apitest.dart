import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:interview/constants/constant.dart';

import 'customerapi.dart';


class CustomerService {

  Future<List<Datum>> service() async {

    try {
      var url = Uri.parse(Constant.baseUrl + Constant.endUrl);
      var response = await http.get(url);
      if (response.statusCode == 200) {
        print("Response 1 Sucessfully Connected to APi ${response.hashCode}");
        Customers _datum = customersFromJson(response.body);

        print(_datum.page);
        return _datum.data;
      }
      else {
        throw Exception("Error While Loding ${response.statusCode}");
      }

    }
    catch (e) {
      log(e.toString());
    }
    return [];
  }

}


