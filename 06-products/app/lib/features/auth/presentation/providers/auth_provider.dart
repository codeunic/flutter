import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:teslo_shop/features/auth/domain/domain.dart';
import 'package:teslo_shop/features/auth/infrastructure/infrastructure.dart';
import 'package:teslo_shop/features/auth/infrastructure/repository/auth_repository_impl.dart';

enum AuthStatus { checking, authenticated, notAuhtenticated }

final authProvider = StateNotifierProvider<AuthNotifier, AuthState>(
  ((ref) {
    final authRepository = AuthRepositoryImpl();

    return AuthNotifier(authRepository: authRepository);
  }),
);

class AuthNotifier extends StateNotifier<AuthState> {
  final AuthRepository authRepository;

  AuthNotifier({
    required this.authRepository,
  }) : super(AuthState());

  Future<void> loginUser(String email, String password) async {
    await Future.delayed(const Duration(microseconds: 500));
    try {
      final user = await authRepository.login(email, password);
      _setLoggedUser(user);
    } on CustomError catch (e) {
      logout(e.message);
    } catch (e) {
      logout('Error logining');
    }
  }

  void registerUser(String email, String password, String fullName) async {}

  void checkAuthStatus() async {}

  void _setLoggedUser(User user) {
    state = state.copyWith(
      user: user,
      errorMessage: '',
      authStatus: AuthStatus.authenticated,
    );
  }

  Future<void> logout([String? errorMessage]) async {
    state = state.copyWith(
      authStatus: AuthStatus.notAuhtenticated,
      user: null,
      errorMessage: errorMessage ?? '',
    );
  }
}

class AuthState {
  final AuthStatus authStatus;
  final User? user;
  final String errorMessage;

  AuthState({
    this.authStatus = AuthStatus.checking,
    this.user,
    this.errorMessage = '',
  });

  AuthState copyWith({
    AuthStatus? authStatus,
    User? user,
    String? errorMessage,
  }) =>
      AuthState(
        authStatus: authStatus ?? this.authStatus,
        user: user ?? this.user,
        errorMessage: errorMessage ?? this.errorMessage,
      );
}
