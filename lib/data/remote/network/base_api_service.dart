// ignore_for_file: non_constant_identifier_names

abstract class BaseApiService {
  final String BASE_URL = 'https/tbd/';

  Future<dynamic> getResponse(String url);
}