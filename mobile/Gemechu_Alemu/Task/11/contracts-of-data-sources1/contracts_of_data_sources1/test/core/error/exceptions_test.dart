
import 'package:flutter_test/flutter_test.dart';
import 'package:contracts_of_data_sources1/core/error/exceptions.dart';

void main() {
  test('ServerException is of type Exception', () {
    expect(ServerException(), isA<Exception>());
  });

  test('CacheException is of type Exception', () {
    expect(CacheException(), isA<Exception>());
  });
}