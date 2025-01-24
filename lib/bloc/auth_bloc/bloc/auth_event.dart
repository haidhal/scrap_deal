part of 'auth_bloc.dart';

class AuthEvent {}

class OnRegistrationEvent extends AuthEvent {
  final String name;
  final String email;
  final String password;
  OnRegistrationEvent(
      {required this.email, required this.password, required this.name});
}

class OnLoginEvent extends AuthEvent{
  final String loginEmail;
  final String loginPass;
OnLoginEvent({required this.loginEmail,required this.loginPass});
}

