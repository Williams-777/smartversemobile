import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/error/exceptions.dart';
import '../../data/repository/auth_repository.dart';
import 'verify_email_state.dart';

class VerifyEmailCubit extends Cubit<VerifyEmailState> {
  final AuthRepository _authRepository;

  VerifyEmailCubit(this._authRepository) : super(VerifyEmailInitial());

  Future<void> verify({required String token}) async {
    emit(VerifyEmailLoading());
    try {
      await _authRepository.verifyEmail(token: token);
      emit(VerifyEmailSuccess());
    } on ServerException catch (e) {
      emit(VerifyEmailFailure(e.message));
    } on NetworkException catch (e) {
      emit(VerifyEmailFailure(e.message));
    } catch (_) {
      emit(VerifyEmailFailure('Something went wrong'));
    }
  }
}