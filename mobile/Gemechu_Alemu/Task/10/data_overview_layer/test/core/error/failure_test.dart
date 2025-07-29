
import 'package:flutter_test/flutter_test.dart';
import 'package:data_overview_layer/core/error/failure.dart';

void main() {
  group('Failure equality', () {
    test('Two ServerFailure instances should be equal', () {
      expect(ServerFailure(), equals(ServerFailure()));
    });

    test('Two CacheFailure instances should be equal', () {
      expect(CacheFailure(), equals(CacheFailure()));
    });
  });
}
