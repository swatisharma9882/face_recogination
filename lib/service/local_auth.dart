import 'package:flutter/cupertino.dart';
import 'package:local_auth/local_auth.dart';
import 'package:local_auth_android/local_auth_android.dart';
import 'package:local_auth_ios/local_auth_ios.dart';

class LocalAuth {
  static final auth = LocalAuthentication();

  static Future<bool> _canAuthenticate() async =>
      await auth.canCheckBiometrics || await auth.isDeviceSupported();

  static Future<bool> authenticate() async{
    try{
      if(!await _canAuthenticate()) return false;

      return await auth.authenticate(
          authMessages: const[
            AndroidAuthMessages(
              signInTitle: 'Oops! Biometric authentication required!',
              cancelButton: 'No thanks',
            ),
            IOSAuthMessages(
              cancelButton: 'No thanks',
            ),
          ],
          localizedReason: 'Use authenticate',
          options: const AuthenticationOptions(
            useErrorDialogs: true,
            stickyAuth: false,
          ),
      );
    }
    catch(e){
      debugPrint('erroe $e');
      return false;
    }
  }
}
