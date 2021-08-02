import 'package:bloc/bloc.dart';
import 'package:example/repository/login/user_repository.dart';
import 'package:meta/meta.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final UserRepository _userRepository;
  LoginCubit(this._userRepository) : super(LoginInitial());

  Future login(String username,String password) async{
    return await _userRepository.login(username, password);
  }
}
