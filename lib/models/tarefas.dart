class Tarefas {
  String? id;
  String? tarefasTitulo;
  String? description;
  bool isDone;

Tarefas(
  {
    required this.id,
    required this.tarefasTitulo,
    this.isDone = false,
  }
);

static List<Tarefas> tarefasLista(){
  return[
      Tarefas(id: '01', tarefasTitulo: 'Placeholder' , isDone: true),
      Tarefas(id: '02', tarefasTitulo: 'Placeholder'),
      Tarefas(id: '03', tarefasTitulo: 'Placeholder')
  ];
}

}