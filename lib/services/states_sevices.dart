import 'dart:convert';

import 'package:covid_tracker/models/world_states_model.dart';
import 'package:http/http.dart' as http;

import 'utilities/app_url.dart';

class StatesServices {
  Future<WorldStatesModel> fetchWorldStatesRecords() async {
    final Response = await http.get(Uri.parse(Appurl.worldStatesApi));

    if (Response.statusCode == 200) {
      var data = jsonDecode(Response.body);
      return WorldStatesModel.fromJson(data);
    } else {
      throw Exception('Error');
    }
  }

  Future<List<dynamic>> countriesListApi() async {
    var data;
    final Response = await http.get(Uri.parse(Appurl.countriesList));

    if (Response.statusCode == 200) {
      var data = jsonDecode(Response.body);
      return data;
    } else {
      throw Exception('Error');
    }
  }
}
