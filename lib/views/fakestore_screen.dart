import 'package:ecommerce_app/blocs/fakestore/fakestore_bloc.dart';
import 'package:ecommerce_app/blocs/fakestore/fakestore_event.dart';
import 'package:ecommerce_app/blocs/fakestore/fakestore_state.dart';
import 'package:ecommerce_app/models/fake_store_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FakestoreScreen extends StatefulWidget {
  const FakestoreScreen({super.key});

  @override
  State<FakestoreScreen> createState() => _FakestoreScreenState();
}

class _FakestoreScreenState extends State<FakestoreScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Fake Store")),
      body: Column(
        children: [
          ElevatedButton(
            onPressed: () {
              context.read<FakeStoreBloc>().add(LoadFakeStore());
            },
            child: Text("Get Data"),
          ),
          SizedBox(height: 20),
          BlocBuilder<FakeStoreBloc, FakeStoreState>(
            builder: (context, state) {
              if (state is FakeStoreLoading) {
                return Center(child: CircularProgressIndicator());
              }
              if (state is FakeStoreLoaded) {
                final List<FakeStoreModel> storedata = state.storeData;
                return Expanded(
                  child: ListView.builder(
                    itemCount: storedata.length,
                    itemBuilder: (context, index) {
                      final FakeStoreModel data = storedata[index];
                      return ListTile(
                        leading: Text("${data.id}"),
                        title: Text(data.title),
                        subtitle: Text("${data.price}"),
                        trailing: IconButton(
                          onPressed: () {
                            context.read<FakeStoreBloc>().add(
                              AddFakseStore(data),
                            );
                          },
                          icon: Icon(Icons.add),
                        ),
                      );
                    },
                  ),
                );
              }
              return Container();
            },
          ),
        ],
      ),
    );
  }
}
