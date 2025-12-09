import 'package:ecommerce_app/blocs/mobile/mobile_bloc.dart';
import 'package:ecommerce_app/blocs/mobile/mobile_event.dart';
import 'package:ecommerce_app/blocs/mobile/mobile_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MobileScreen extends StatefulWidget {
  const MobileScreen({super.key});

  @override
  State<MobileScreen> createState() => _MobileScreenState();
}

class _MobileScreenState extends State<MobileScreen> {
  @override
  void initState() {
    context.read<MobileBloc>().add(LoadMobileData());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Mobile Screen")),
      body: BlocBuilder<MobileBloc, MobileState>(
        builder: (context, state) {
          if (state is MobileLoading) {
            return Center(child: CircularProgressIndicator());
          }
          if (state is MobileError) {
            return Center(child: Text(state.message));
          }
          if (state is MobileSuccess) {
            return ListView.builder(
              itemCount: state.mobileModel.length,
              itemBuilder: (context, index) {
                final data = state.mobileModel[index];
                return ListTile(
                  leading: Text("${data.id}"),
                  title: Text(data.title),
                  subtitle: Text(data.body),
                );
              },
            );
          }
          return Text("Data");
        },
      ),
    );
  }
}
