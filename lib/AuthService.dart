import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_sign_in/google_sign_in.dart';

FirebaseAuth auth = FirebaseAuth.instance; //auth on firebase
FirebaseFirestore firestore = FirebaseFirestore.instance;
GoogleSignIn googleSignIn = GoogleSignIn();

Future<UserCredential?> registerUser(
    name, email, password) async {
  try {
    UserCredential userCredential = await auth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
    print(userCredential.user!.uid);
    CollectionReference users = FirebaseFirestore.instance.collection('Users');

    users
        .add({
          'name': name,
         
          'uid_id': userCredential.user!.uid,
        })
        // .doc(userCredential.user!.uid)
        // .set({
        //   'name': name,
        //   'weight': weight,
        //   'height': height,
        //   'uid_id': users,
        // })
        .then((value) => print("User Added"))
        .catchError((error) => print("Failed to add user: $error"));
    return userCredential;
  } on FirebaseAuthException catch (e) {
    print(e.code);
    if (e.code == 'weak-password') {
      print('The password provided is too weak.');
    } else if (e.code == 'email-already-in-use') {
      print('The account already exists for that email.');
    }
  } catch (e) {
    print(e);
  }
  return null;
}

Future loginUser(email, password) async {
  try {
    return await auth.signInWithEmailAndPassword(
        email: email, password: password);
  } on FirebaseAuthException catch (e) {
    print(e.code);
    if (e.code == 'user-not-found') {
      print('No user found for that email.');
    } else if (e.code == 'wrong-password') {
      print('Wrong password provided for that user.');
    }
  } catch (e) {
    print(e);
  }
  return null;
}

Future<UserCredential> signInWithGoogle() async {
  final GoogleSignInAccount? googleUser = await googleSignIn.signIn();

  final GoogleSignInAuthentication? googleAuth =
      await googleUser?.authentication;

  final credential = GoogleAuthProvider.credential(
    accessToken: googleAuth?.accessToken,
    idToken: googleAuth?.idToken,
  );

  UserCredential userCredential = await auth.signInWithCredential(credential);
  print(userCredential.user);
  return userCredential;
}

Future<void> googleSignOut() async {
  await auth.signOut().then((value) {
    googleSignIn.signOut();
  });
}
