import 'package:ecommerce_app/models/fake_store_model.dart';

abstract class FakeStoreEvent {}

class LoadFakeStore extends FakeStoreEvent {}

class AddFakseStore extends FakeStoreEvent {
  final FakeStoreModel fakeStore;

  AddFakseStore(this.fakeStore);
}

class GetDBFakeStore extends FakeStoreEvent {}
