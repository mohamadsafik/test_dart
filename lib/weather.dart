import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

void main() async {
  String apiKey = 'eb165ce9126cde5c7b02115c1755bfee';
  String city = 'Jakarta';
  String apiUrl = 'http://api.openweathermap.org/data/2.5/forecast';
  String units = 'metric';

  Uri url = Uri.parse('$apiUrl?q=$city&units=$units&appid=$apiKey');

  var response = await http.get(url);

  if (response.statusCode == 200) {
    Map<String, dynamic> data = json.decode(response.body);

    List<dynamic> forecasts = data['list'];

    List<String> listDate = [];
    List<double> listTemperature = [];
    for (var forecast in forecasts) {
      String date = forecast['dt_txt'].toString();
      String formattedDate =
          DateFormat("EEE, d MMMM y").format(DateTime.parse(date));

      double temperature = forecast['main']['temp'].toDouble();

      if (!listDate.contains(formattedDate)) {
        listDate.add(formattedDate);
        listTemperature.add(temperature);
      }
    }
    print("Weather Forecast:");
    for (var i = 0; i < listDate.length; i++) {
      print('${listDate[i]}: ${listTemperature[i]}°C'); //hasil
    }
  } else {
    print('Error Status code: ${response.statusCode}');
  }
}
