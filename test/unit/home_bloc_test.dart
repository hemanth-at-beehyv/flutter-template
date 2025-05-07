import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:template/features/home/domain/entities/user.dart';
import 'package:template/features/home/domain/usecases/get_users_usecase.dart';
import 'package:template/features/home/presentation/bloc/home_bloc.dart';

// Generate mock classes
@GenerateMocks([GetUsersUseCase])
import 'home_bloc_test.mocks.dart';

void main() {
  late HomeBloc homeBloc;
  late MockGetUsers mockGetUsers;

  setUp(() {
    mockGetUsers = MockGetUsers();
    homeBloc = HomeBloc(getUsers: mockGetUsers);
  });

  tearDown(() {
    homeBloc.close();
  });

  test('initial state is HomeInitial', () {
    expect(homeBloc.state, isA());
  });

  group('LoadUsersEvent', () {
    final users = [
      const User(id: 1, name: 'Test User', email: 'test@example.com')
    ];

    blocTest(
      'emits [HomeLoading, HomeLoaded] when LoadUsersEvent is added and successful',
      build: () {
        when(mockGetUsers.call()).thenAnswer((_) async => users);
        return homeBloc;
      },
      act: (bloc) => bloc.add(const LoadUsersEvent()),
      expect: () => [
        const HomeLoading(),
        HomeLoaded(users),
      ],
      verify: (_) {
        verify(mockGetUsers.call()).called(1);
      },
    );

    blocTest(
      'emits [HomeLoading, HomeError] when LoadUsersEvent is added and fails',
      build: () {
        when(mockGetUsers.call())
            .thenThrow(Exception('Network error'));
        return homeBloc;
      },
      act: (bloc) => bloc.add(const LoadUsersEvent()),
      expect: () => [
        const HomeLoading(),
        isA(),
      ],
      verify: (_) {
        verify(mockGetUsers.call()).called(1);
      },
    );
  });
}