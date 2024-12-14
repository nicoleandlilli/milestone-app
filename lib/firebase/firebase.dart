import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

import '../firebase_options.dart';

class FireBase{

  static Future<void> initFirebase() async {
    bool shouldUseFirebaseEmulator = true;
    WidgetsFlutterBinding.ensureInitialized();
// We're using the manual installation on non-web platforms since Google sign in plugin doesn't yet support Dart initialization.
    // See related issue: https://github.com/flutter/flutter/issues/96391

    // We store the app and auth to make testing with a named instance easier.
    FirebaseApp app = await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    FirebaseAuth auth = FirebaseAuth.instanceFor(app: app);

    if (shouldUseFirebaseEmulator) {
      // await auth.useAuthEmulator('localhost', 9099);
      await auth.useAuthEmulator('10.0.2.2', 9099);
    }

    if (!kIsWeb && Platform.isWindows) {
      // await GoogleSignInDart.register(
      //   clientId:
      //   '406099696497-g5o9l0blii9970bgmfcfv14pioj90djd.apps.googleusercontent.com',
      // );
    }


  }



}