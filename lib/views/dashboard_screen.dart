import 'package:ecommerce_app/blocs/event/event_bloc.dart';
import 'package:ecommerce_app/blocs/event/event_event.dart';
import 'package:ecommerce_app/blocs/event/event_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  void initState() {
    context.read<EventBloc>().add(GetStream());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            BlocBuilder<EventBloc, EventState>(
              builder: (context, state) {
                if (state is EventLoading) {
                  return Center(child: CircularProgressIndicator());
                }
                if (state is EventError) {
                  return Center(child: Text(state.message));
                }
                if (state is StreamEvents) {
                  return StreamBuilder(
                    stream: state.list,
                    builder: (context, snapshot) {
                      final data = snapshot.data;
                      return Expanded(
                        child: ListView.builder(
                          itemCount: data?.length,
                          itemBuilder: (context, index) {
                            final product = data?[index];
                            return Container(
                              decoration: BoxDecoration(
                                border: Border.all(),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Column(
                                children: [
                                  Image.network(
                                    product?.image ?? "",
                                    height: 200,
                                  ),
                                  Text(product?.title ?? ""),
                                  Text("${product?.price}"),
                                ],
                              ),
                            );
                          },
                        ),
                      );
                    },
                  );
                }
                return Container(child: Text("loading"));
              },
            ),
          ],
        ),
      ),
    );
  }
}
