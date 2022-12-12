import 'package:authentication/authentication.dart';
import 'package:demo_app/app/app.dart';
import 'package:demo_app/bootstrap.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/widgets.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
  );

  final authenticationRepository = AuthenticationRepository();
  await authenticationRepository.userStream.first;

  await bootstrap(
          () => App(
        authenticationRepository: authenticationRepository,
      ),
  );
}
