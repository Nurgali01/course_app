
import 'package:course_app/core/usecases/usecases.dart';
import 'package:course_app/core/utils/typedefs.dart';
import 'package:course_app/src/on_boarding/domain/repos/on_boarding_repo.dart';



class CheckIfUserIsFirstTimer extends UsecaseWithoutParams<bool> {
  CheckIfUserIsFirstTimer(this._repo);

  final OnBoardingRepo _repo;

  @override
  ResultFuture<bool> call() => _repo.checkIfUserIsFirstTimer();

  @override
  UsecasesWithParams() {
    // TODO: implement UsecasesWithParams
    throw UnimplementedError();
  }
}
