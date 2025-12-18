import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_app/models/event_model.dart';
// import 'package:ecommerce_app/models/note_model.dart';

class FirestoreService {
  final CollectionReference userCollection = FirebaseFirestore.instance
      .collection("product");

  Future<void> addEvent(ProductModel event) async {
    try {
      await userCollection.add(event.toMap());
    } catch (e) {
      print(e.toString());
    }
  }

  Future<List<ProductModel>> getData() async {
    final data = await userCollection.get();
    final List<ProductModel> events = data.docs.map((doc) {
      return ProductModel.fromMap(
        doc.data() as Map<String, dynamic>,
        id: doc.id,
      );
    }).toList();
    return events;
  }

  Stream<List<ProductModel>> getStream() {
    final data = userCollection.snapshots();
    try {
      return data.map((snapshot) {
        return snapshot.docs.map((doc) {
          print("Document ID: ${doc.id}");
          print("Document Data: ${doc.data()}");
          return ProductModel.fromMap(
            doc.data() as Map<String, dynamic>,
            id: doc.id,
          );
        }).toList();
      });
    } catch (e) {
      print(e.toString());
      throw e.toString();
    }
  }

  Future<void> updateEvent(ProductModel event) async {
    await userCollection.doc(event.id).update(event.toMap());
  }

  Future<void> deleteEvent(String id) async {
    await userCollection.doc(id).delete();
  }
}
