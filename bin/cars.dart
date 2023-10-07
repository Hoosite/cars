import 'package:dio/dio.dart';

import 'models/getCars/getCars.dart';

void main(List<String> arguments) async {
  Dio httpClient = Dio();
  String url = 'https://myfakeapi.com/api/cars/';
  var response = await httpClient.get(url);
  int minId = -1;
  double minPrice = double.infinity;
  GetCars getCars = GetCars.fromJson(response.data);

  for (var e in getCars.cars) {
    String newStr = e.price.substring(1);
    double price = double.parse(newStr);
    if (price < minPrice) {
      minPrice = price;
      minId = e.id;
    }
  }
  print(minId);
}
