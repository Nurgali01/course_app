
import 'package:course_app/core/usecases/usecases.dart';
import 'package:course_app/core/utils/typedefs.dart';
import 'package:course_app/src/on_boarding/domain/repos/on_boarding_repo.dart';



class CacheFirstTimer extends UsecaseWithoutParams<void> {
  CacheFirstTimer(this._repo);

  final OnBoardingRepo _repo;

  @override
  ResultFuture<void> call() async => _repo.cacheFirstTimer();

  @override
  UsecasesWithParams() {
    // TODO: implement UsecasesWithParams
    throw UnimplementedError();
  }
}