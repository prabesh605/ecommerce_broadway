import 'package:ecommerce_app/models/fake_store_model.dart';

abstract class FakeStoreState {}

class FakeStoreInitial extends FakeStoreState {}

class FakeStoreLoading extends FakeStoreState {}

class FakeStoreLoaded extends FakeStoreState {
  final List<FakeStoreModel> storeData;
  FakeStoreLoaded(this.storeData);
}

class FakeStoreLoadedDB extends FakeStoreState {
  final List<FakeStoreModel> storeData;

  FakeStoreLoadedDB(this.storeData);
}

class FakestoreDBSuccess extends FakeStoreState {}
