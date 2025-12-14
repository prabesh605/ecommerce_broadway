import 'package:ecommerce_app/blocs/fakestore/fakestore_event.dart';
import 'package:ecommerce_app/blocs/fakestore/fakestore_state.dart';
import 'package:ecommerce_app/database/fakeStore_db_service.dart';
import 'package:ecommerce_app/models/fake_store_model.dart';
import 'package:ecommerce_app/services/fakestore_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FakeStoreBloc extends Bloc<FakeStoreEvent, FakeStoreState> {
  final FakestoreService service;
  final FakestoreDbService dbService;
  FakeStoreBloc(this.service, this.dbService) : super(FakeStoreInitial()) {
    on<LoadFakeStore>((event, emit) async {
      emit(FakeStoreLoading());
      final List<FakeStoreModel> storeData = await service.getStoreData();

      emit(FakeStoreLoaded(storeData));
    });
    on<AddFakseStore>((event, emit) async {
      // emit(FakeStoreLoading());
      await dbService.add(event.fakeStore);
      // emit(FakestoreDBSuccess());
    });
    on<GetDBFakeStore>((event, emit) async {
      emit(FakeStoreLoading());
      final List<FakeStoreModel> storeData = await dbService.getAllData();

      emit(FakeStoreLoadedDB(storeData));
    });
  }
}
