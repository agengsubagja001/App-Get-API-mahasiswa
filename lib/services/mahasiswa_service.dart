import 'dart:convert';

import '../models/mahasiswa_model.dart';
import 'package:http/http.dart' as http;

class MahasiswaService {
  Future<List<MahasiswaModel>> getMahasiswa() async {

    // untuk menampilkan di emulator android
    // var url = 'http://10.0.2.2:8000/api/mahasiswa';

    // untuk menampilkan di web
    var url = 'http://restapi-mahasiswa.test/api/mahasiswa';

    var headers = {'Accept': 'application/json'};

    var response = await http.get(
      Uri.parse(url),
      headers: headers,
    );

    print(response.body);

    if (response.statusCode == 200) {
      List data = jsonDecode(response.body)['data'];
      List<MahasiswaModel> model = [];

      for (var item in data) {
        model.add(MahasiswaModel.fromJson(item));
      }

      return model;
    } else {
      throw Exception('Gagal');
    }
  }

  // Future<MahasiswaProvider> createMahasiswa(String ) async{
  // final response = await http.post(
  //   Uri.parse('https://jsonplaceholder.typicode.com/albums'),
  //   headers: <String, String>{
  //     'Content-Type': 'application/json; charset=UTF-8',
  //   },
  //   body: jsonEncode(<String, String>{
  //     'title': title,
  //   }),
  // );
}
