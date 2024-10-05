import 'package:chopper_network/features/app/domain/entity/character_entity.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final entity = CharacterEntity(
    name: 'name',
    imageUrl: 'imageUrl.jpg',
    role: 'role',
  );

  test('should be a subclass of a entity', () async {
    expect(entity, isA<CharacterEntity>());
    expect(entity.name, isA<String>());
  });
}
