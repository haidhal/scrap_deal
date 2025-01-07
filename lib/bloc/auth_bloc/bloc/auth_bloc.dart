import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<OnRegistrationEvent>((event, emit) async {
      log("event called");
      emit(AuthLoadingState());
      try {
        final signInMethod = await FirebaseAuth.instance.fetchSignInMethodsForEmail(event.email);
        if(signInMethod.isNotEmpty){
          emit(AuthErrorState(errorMessage: "Email is already registered"));
          return;
        }
        var credential = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(
                email: event.email, password: event.password);
        await FirebaseFirestore.instance
            .collection("users")
            .doc(credential.user!.uid)
            .set({
          "name": event.name,
          "email": event.email,
        });

        await FirebaseFirestore.instance
            .collection("users")
            .doc(FirebaseAuth.instance.currentUser!.uid)
            .get();
        emit(AuthSuccessState());
        log("register success");
      } catch (e) {
        emit(AuthErrorState(errorMessage: e.toString()));
        log(e.toString());
      }
    });

    on<OnLoginEvent>(
      (event, emit) async {
        log("event triggered");
        emit(AuthLoadingState());
        try {
         await FirebaseAuth.instance.signInWithEmailAndPassword(
              email: event.loginEmail, password: event.loginPass);
          emit(AuthSuccessState());
          log("Email: ${event.loginEmail}, Password: !!!!!!!");

        } catch (e) {
          emit(AuthErrorState(errorMessage: e.toString()));
        }
      },
    );
  }
}
