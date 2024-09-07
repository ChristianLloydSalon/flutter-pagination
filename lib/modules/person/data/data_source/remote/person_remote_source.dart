import 'package:dio/dio.dart';
import 'package:exam/modules/person/data/model/input/person_pagination_input.dart';
import 'package:exam/modules/person/data/model/output/person.dart';

class PersonRemoteSource {
  const PersonRemoteSource(this._httpClient);

  final Dio _httpClient;

  final String _path = '/persons';

  Future<List<Person>> fetchPersons({
    required PersonPaginationInput input,
  }) async {
    final response = await _httpClient.get(
      _path,
      queryParameters: input.toJson(),
    );
    final data = response.data['data'] as List;
    return data.map((e) => Person.fromJson(e)).toList();
  }
}
