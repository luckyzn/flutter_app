import 'package:flutter/material.dart';
import 'package:flutter_app/models/tarefas.dart';
import 'package:flutter_app/pages/editTasks.page.dart';

class ListaTarefas extends StatelessWidget {
  final Tarefas item_tarefas;
  final dynamic estadoTarefas;
  final deleteTarefas;

  const ListaTarefas({super.key, required this.item_tarefas,required this.estadoTarefas,required this.deleteTarefas});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        bottom: 20
      ),
      child: ListTile(
        onTap: () {Navigator.push(context, MaterialPageRoute(builder: (context) => EditTasks()));},
        shape: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20)
        ),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 5
        ),
        leading: IconButton(icon: Icon(
          item_tarefas.isDone ? Icons.check_box : Icons.check_box_outline_blank), onPressed: () {estadoTarefas(item_tarefas); },),
        title: Text(item_tarefas.tarefasTitulo!),
        trailing: IconButton(
          icon: const Icon(Icons.delete_forever),
           color: Colors.red,
            iconSize: 28,
             onPressed: (){
              deleteTarefas(item_tarefas.id);
             },
           ),
        )
        
        );
  
  }
}