import 'package:flutter/material.dart';
import 'package:flutter_app/models/tarefas.dart';
import 'package:flutter_app/pages/settings.page.dart';
import 'package:flutter_app/widgets/lista_tarefas.dart';

class MainMenu extends StatefulWidget {
  const MainMenu({super.key});

  @override
  State<MainMenu> createState() => _MainMenuState();
}

class _MainMenuState extends State<MainMenu> {
  final menuTarefas = Tarefas.tarefasLista();
  final handlerTarefas = TextEditingController();
  List<Tarefas> pesquisarTarefas = []; 

  @override
  void initState() {
    pesquisarTarefas = menuTarefas;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        //iconTheme:  const IconThemeData(color: Colors.black),
        automaticallyImplyLeading: false,
        actions: <Widget>[
          IconButton(onPressed: () => {{Navigator.push(context, MaterialPageRoute(builder: (context) => const Settings()))},}, icon: const Icon(Icons.more_vert))
        ],
      ),
      body: SingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints(maxHeight: MediaQuery.of(context).size.height),
          child: Stack(
            children: [
              Container(
                decoration: const BoxDecoration(
                  image:  DecorationImage(image: AssetImage('assets/background.png'), fit: BoxFit.cover)
                ), 
                padding: const EdgeInsets.only(
                  left: 30,
                  right: 30,
                ),
                child: ListView(
                  children: [
                    const SizedBox(
                      height: 30,
                    ),
                    TextFormField(
                      onChanged: (value){filtrarResultados(value);},
                      decoration: InputDecoration(
                      contentPadding: const EdgeInsets.only(
                        left: 10,
                        right: 10,
                      ),
                      filled: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      prefixIcon: const Icon(Icons.search),
                      hintText: 'Buscar',
                      hintStyle: const TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.w600
                      )
                    ),
                    style: const TextStyle(fontSize: 18),
                    ),
                    const SizedBox(
                      height: 45,
                    ),
                    const Text(
                      "Lista de Tarefas",
                      style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.w500
                      ),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    for (Tarefas tarefaFor in pesquisarTarefas )
                    ListaTarefas(
                      item_tarefas: tarefaFor,
                      estadoTarefas: concluirTarefas,
                      deleteTarefas: deletarTarefas,
                      ),
                  ],
                ),
                
                
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Row(
                  children: [
              Expanded(
                child: Container(
                  margin: const EdgeInsets.only(
                    right: 20,
                    left: 20,
                    bottom: 20
          ),
                child: TextFormField(
                    controller: handlerTarefas,
                    decoration: InputDecoration(
                      hintText: 'Adicione uma nova tarefa',
                      hintStyle: const TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.w600
                  ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                  ),
                    ),
            )
            ),
            ),  
            Container(
              margin: const EdgeInsets.only(
                right: 20,
                bottom: 20
              ),
              child: FloatingActionButton(
              onPressed: (){
                adicionarTarefas(handlerTarefas.text);
              },
              elevation: 10,
              backgroundColor: const Color.fromARGB(217, 42, 42, 114),
              child: const Icon(
                        Icons.add,
                        color: Colors.white),
              /* Botão antigo escrito 'Adicionar' -- Abrir a página de tarefas mais completa.
              
              label: const Text('Adicionar',
                style: TextStyle(color: Colors.white),
              ),*/
              ),
            ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      
      );
    
  }

  void filtrarResultados(String tecladoPesquisa){
      List<Tarefas> resultados = [];
      if (tecladoPesquisa.isEmpty){
        resultados = menuTarefas;
      }
      else {
        resultados = menuTarefas.where((item)=> item.tarefasTitulo!.toLowerCase().contains(tecladoPesquisa.toLowerCase())).toList();
      }
      setState(() {
        pesquisarTarefas = resultados;
      });
  }

  void deletarTarefas(String id)
  {
    setState(() {
      menuTarefas.removeWhere((item) => item.id == id);
    });   
  }

  void concluirTarefas(Tarefas tarefasTitulo){
      setState(() {
        tarefasTitulo.isDone = !tarefasTitulo.isDone;
      });  
  }
  void adicionarTarefas(String itemTarefas){
    setState(() {
      menuTarefas.add(Tarefas(id: DateTime.now().millisecondsSinceEpoch.toString(), tarefasTitulo: itemTarefas));
    }); 
    handlerTarefas.clear();
}
}