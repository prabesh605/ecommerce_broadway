import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_app/models/event_model.dart';
// import 'package:ecommerce_app/models/note_model.dart';

class FirestoreService {
  final CollectionReference userCollection = FirebaseFirestore.instance
      .collection("event");

  Future<void> addEvent(EventModel event) async {
    try {
      await userCollection.add(event.toMap());
    } catch (e) {
      print(e.toString());
    }
  }

  Future<List<EventModel>> getData() async {
    final data = await userCollection.get();
    final List<EventModel> events = data.docs.map((doc) {
      return EventModel.fromMap(doc.data() as Map<String, dynamic>);
    }).toList();
    return events;
  }

  //   Stream<List<NoteModel>>? getNotess() {
  //     try {
  //       return userCollection.snapshots().map((snapshot) {
  //         return snapshot.docs.map((doc) {
  //           return NoteModel.fromMap(doc.data() as Map<String, dynamic>);
  //         }).toList();
  //       });
  //     } catch (e) {
  //       e.toString();
  //     }

  //     return null;
  //   }
  // }
}

// class FirestoreService {
//   final CollectionReference userCollection = FirebaseFirestore.instance
//       .collection("event");

//   Future<void> addUser(NoteModel notes) async {
//     try {
//       await userCollection.add(notes.toMap());
//     } catch (e) {
//       print(e.toString());
//     }
//   }

//   // Future<List<NoteModel>> getData() {
//   //   return userCollection.get();
//   // }

//   Stream<List<NoteModel>>? getNotess() {
//     try {
//       return userCollection.snapshots().map((snapshot) {
//         return snapshot.docs.map((doc) {
//           return NoteModel.fromMap(doc.data() as Map<String, dynamic>);
//         }).toList();
//       });
//     } catch (e) {
//       e.toString();
//     }

//     return null;
//   }
// }
