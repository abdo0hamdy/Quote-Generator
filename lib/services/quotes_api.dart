import 'package:dio/dio.dart';
import 'package:intern_task2/models/quotes.dart';

class QutoesApi {
  Future<List<Qutoe>> getNewsQuotes() async {
    var dio = Dio();
    var response = await dio.request(
      'https://api.quotable.io/quotes',
      options: Options(
        method: 'GET',
      ),
    );
    if (response.statusCode == 200) {
      List jsonResponse = response.data["results"];
      return jsonResponse.map((data) => Qutoe.fromJson(data)).toList();
    }
    return[];
  }
}
