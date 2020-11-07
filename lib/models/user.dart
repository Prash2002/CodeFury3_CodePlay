import 'package:cloud_firestore/cloud_firestore.dart';

class User{
  final String id;
  final String name;
  final String email;
  final String photoUrl;
  final String type;
  final String prof ;
  final String project;
  final String best;
  final String city;

  User({
    this.id, this.name, this.email, this.photoUrl,
    this.type, this.prof, this.project, this.best, this.city
  });

  final CollectionReference userCollection = Firestore.instance.collection('users');

  factory User.fromDocument(DocumentSnapshot doc){
    return User(
      id: doc['id'],
      name: doc['name'],
      email: doc['email'],
      photoUrl: doc['photoUrl'],
      type: doc['type'],
      prof: doc['prof'],
      project: doc['project'],
      best: doc['best'],
      city: doc['city'],
    );
  }

  addDocument(User user) async {
     await userCollection.document(user.id).setData({
      "id":user.id,
      "name" : user.name,
      "email": user.email,
      "photoUrl": user.photoUrl,
      "type" : user.type,
      "prof" : user.prof,
      "project" : user.project,
      "best" : user.best,
      "city": user.city,
      //fees, city 
   } );
  }
}