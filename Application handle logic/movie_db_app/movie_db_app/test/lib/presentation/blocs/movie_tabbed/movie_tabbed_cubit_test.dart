import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:movie_db_app/domain/entities/app_error.dart';
import 'package:movie_db_app/domain/entities/no_params.dart';
import 'package:movie_db_app/domain/usecase/get_comingsoon.dart';
import 'package:movie_db_app/domain/usecase/get_playing_now.dart';
import 'package:movie_db_app/domain/usecase/get_popular.dart';
import 'package:movie_db_app/presentation/blocs/movie_tabbed/movie_tabbed_cubit.dart';
import 'package:movie_db_app/presentation/blocs/movie_tabbed/movie_tabbed_state.dart';

class GetPopularMock extends Mock implements GetPopular {}

class GetPlayingNowMock extends Mock implements GetPlayingNow {}

class GetComingSoonMock extends Mock implements GetComingSoon {}

main() {
  GetPopularMock getPopularMock;
  GetComingSoonMock getComingSoonMock;
  GetPlayingNowMock getPlayingNowMock;

  MovieTabbedCubit movieTabbedCubit;

  setUp(() {
    getPopularMock = GetPopularMock();
    getPlayingNowMock = GetPlayingNowMock();
    getComingSoonMock = GetComingSoonMock();

    movieTabbedCubit = MovieTabbedCubit(
      getComingSoon: getComingSoonMock,
      getPlayingNow: getPlayingNowMock,
      getPopular: getPopularMock,
    );
  });

  tearDown(() {
    movieTabbedCubit.close();
  });

  test('bloc should have initial state as [MovieTabbedInitial]', () {
    expect(movieTabbedCubit.state.runtimeType, MovieTabbedInitial);
  });

  blocTest(
      'should emit [MovieTabLoading,MovieTabChanged] state when playing now tab '
      'changed success',
      build: () => movieTabbedCubit,
      act: (MovieTabbedCubit bloc) {
        when(getPlayingNowMock.call(NoParams()))
            .thenAnswer((_) async => Right([]));

        bloc.movieTabChanged(currentTabIndex: 1);
      },
      expect: () => [
            isA<MovieTabLoading>(),
            isA<MovieTabChanged>(),
          ],
      verify: (MovieTabbedCubit cubit) {
        verify(getPlayingNowMock.call(any)).called(1);
      });

  blocTest(
      'should emit [MovieTabLoading,MovieTabChanged] state when popular tab '
      'changed success',
      build: () => movieTabbedCubit,
      act: (MovieTabbedCubit bloc) {
        when(getPopularMock.call(NoParams()))
            .thenAnswer((_) async => Right([]));

        bloc.movieTabChanged(currentTabIndex: 0);
      },
      expect: () => [
            isA<MovieTabLoading>(),
            isA<MovieTabChanged>(),
          ],
      verify: (MovieTabbedCubit cubit) {
        verify(getPopularMock.call(any)).called(1);
      });

  blocTest(
    'should emit [MovieTabLoading,MovieTabLoadError] state when coming soon tab '
    'changed fail',
    build: () => movieTabbedCubit,
    act: (MovieTabbedCubit bloc) {
      when(getComingSoonMock.call(NoParams())).thenAnswer((_) async =>
          Left(AppError(AppErrorType.api)));

      bloc.movieTabChanged(currentTabIndex: 2);
    },
    expect: () => [
      isA<MovieTabLoading>(),
      isA<MovieTabLoadError>(),
    ],
    verify: (MovieTabbedCubit cubit){
      verify(getComingSoonMock.call(any)).called(1);
    }
  );
}
