import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  static const NAME = 'name';
  static const EMAIL = "email";
  static const JIMBO = "jimbo";
  static const ID = 'id';
  static const ROLE = 'role';
  static const STRIPE_ID = 'stripeId';

  String _name;
  String _email;
  String _jimbo;
  String _id;
  String _stripeId;
  String _role;
//  GETTERS
  String get name => _name;
  String get email => _email;
  String get jimbo => _jimbo;
  String get id => _id;
  String get role => _role;
  String get stripeId => _stripeId;

  UserModel.fromSnapshot(DocumentSnapshot snap) {
    _email = snap.data[EMAIL];
    _name = snap.data[NAME];
    _jimbo = snap.data[JIMBO];
    _id = snap.data[ID];
    _role = snap.data[role];
    _stripeId = snap[STRIPE_ID] ?? null;
  }
}
