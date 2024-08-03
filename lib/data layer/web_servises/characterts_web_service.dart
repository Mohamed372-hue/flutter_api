// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dio/dio.dart';
import 'package:flutterexample/constants/my_strings.dart';

class CharactertsWebService {
  late Dio dio;
  CharactertsWebService() {
    BaseOptions options = BaseOptions(
      baseUrl: baseurl,
      receiveDataWhenStatusError: true,
      connectTimeout: const Duration(seconds: 60),
      receiveTimeout: const Duration(seconds: 60),
    );
    dio = Dio(options); //
  }

  Future<List<dynamic>> getallcharacters() async {
    try {
      Response response = await dio.get("character");
      return response.data['results'];
    } catch (e) {
      return [];
    }
  }
}
