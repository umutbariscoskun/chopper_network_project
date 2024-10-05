import 'package:chopper_network/features/app/domain/repository/anime_repository.dart';
import 'package:mockito/annotations.dart';

// we need this for generating mocks
// After null safety we should use GenerateMocks for Mockito
// This generated Mock repository is a common repo
//so we can use it as repository.
@GenerateMocks(
  [AnimeRepository],
  customMocks: [
    MockSpec<AnimeRepository>(
      as: #FakeRepo,
      onMissingStub: OnMissingStub.throwException,
    ),
  ],
)
void main() {}
