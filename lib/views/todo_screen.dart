import 'package:ecommerce_app/blocs/todo/todo_bloc.dart';
import 'package:ecommerce_app/blocs/todo/todo_event.dart';
import 'package:ecommerce_app/blocs/todo/todo_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TodoScreen extends StatefulWidget {
  const TodoScreen({super.key});

  @override
  State<TodoScreen> createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoScreen> {
  TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Todo Screen")),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextFormField(
              controller: controller,
              decoration: InputDecoration(
                label: Text("Enter Todo"),
                border: OutlineInputBorder(),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                context.read<TodoBloc>().add(AddTodo(controller.text));
              },
              child: Text("Enter"),
            ),
            SizedBox(height: 60),
            Text(
              "Your Todo Data",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            BlocBuilder<TodoBloc, TodoState>(
              builder: (context, state) {
                if (state is LoadTodoSuccess) {
                  final List<String> responseList = state.todos;
                  return SizedBox(
                    height: 500,
                    child: ListView.builder(
                      itemCount: responseList.length,
                      itemBuilder: (context, index) {
                        final String listData = responseList[index];
                        return Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                listData,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 22,
                                ),
                              ),
                              IconButton(
                                onPressed: () {
                                  context.read<TodoBloc>().add(
                                    RemoveTodo(index),
                                  );
                                },
                                icon: Icon(Icons.delete, color: Colors.red),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  );
                }
                return Container();
              },
            ),
            // Text("I eat food"),
          ],
        ),
      ),
    );
  }
}
