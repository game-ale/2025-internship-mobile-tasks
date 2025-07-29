
import 'package:flutter_test/flutter_test.dart';
import 'package:data_overview_layer/core/error/exceptions.dart';

void main() {
  test('ServerException is of type Exception', () {
    expect(ServerException(), isA<Exception>());
  });

  test('CacheException is of type Exception', () {
    expect(CacheException(), isA<Exception>());
  });
}
