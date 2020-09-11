import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:workshop_app/app/modules/home/components/todo/todo_controller.dart';

class ItemWidget extends StatelessWidget {
  final int index;
  
  const ItemWidget({Key key, this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    TodoController controller = Modular.get();
    return ListTile(
      title: Text(controller.list[index]),
      trailing: IconButton(
        icon: Icon(
          Icons.cancel,
          color: Colors.red,
        ),
        onPressed: () {
          controller.remove(index);
        },
      ),
    );
  }
}
