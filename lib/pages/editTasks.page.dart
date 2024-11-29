import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';


class EditTasks extends StatefulWidget {

  const EditTasks({super.key});

  @override
  State<EditTasks> createState() => _AddTasksState();
}

class _AddTasksState extends State<EditTasks> {

  
  TextEditingController time = TextEditingController();
  TextEditingController date = TextEditingController();
  final handlerTarefas = TextEditingController();

  @override
  Widget build(BuildContext context) {
    initializeDateFormatting();
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        iconTheme: const IconThemeData(color: Colors.white),
        ),
      body: SingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints(maxHeight: MediaQuery.of(context).size.height),
          child: Stack(
            children: [
              Container(
                decoration: const BoxDecoration(
                  image: DecorationImage(image: AssetImage('assets/background.png'), fit: BoxFit.cover)),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 30,
                    vertical: 20
                  ), 
                child: ListView(
                  children: [
                    const SizedBox(height:60),
                    TextFormField(
                      
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.only(
                          top: 10,
                          left: 10,
                          right: 10,                       
                     ),
                      filled: true,
                      border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                      hintText: 'Título',
                      hintStyle: const TextStyle(
                      fontSize: 18,
                      color: Color.fromARGB(255, 95, 95, 95),
                      fontWeight: FontWeight.w800,
                      )),
                      
                      
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    TextFormField(
                      maxLines: 4,
                      maxLength: 100,
                      maxLengthEnforcement: MaxLengthEnforcement.enforced,
                      textAlign: TextAlign.start,
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.only(
                        top: 20,
                        left: 10,
                        right: 10,
                        
                      ),
                        filled: true,
                        border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                        hintText: 'Descrição',
                        hintStyle: const TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.w600,
                      ) 
                      ),
              
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      SizedBox(
                        width: 60,
                        child:TextField(
                          textAlign: TextAlign.center,
                        onTap: ()async {
                          DateTime? dateChoice = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(2000),
                            lastDate: DateTime(2100),
                            locale: Localizations.localeOf(context)
                            );
                      
              
                            if(dateChoice !=null){
                              setState(() {
                                date.text = DateFormat('dd/MM/yyyy','pt_Br').format(dateChoice);
                              });
                            }
                        },
              
                        controller: date,
                        decoration: InputDecoration(
                          icon: const Icon(Icons.date_range_rounded),
                        contentPadding: const EdgeInsets.only(
                        left: 10,
                        right: 10,  
                      ),
                        filled: true,
                        border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                        hintText: 'Data',
                        hintStyle: const TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.w600,
                      ) 
                      ),
                      ),
                      ),
                      const SizedBox(height: 20),
                      SizedBox(
                        height: 100,
                        width: 10,
                        child: TextField(
                          textAlign: TextAlign.center,
                        onTap: ()async {
                          var timeChoice = await showTimePicker(
                            context: context,
                             initialTime: TimeOfDay.now()
                             );
              
                            if(timeChoice !=null){
                              setState(() {
                               
                              });
                            }
                        },
                        controller: time,
                        decoration: InputDecoration(
                        icon: const Icon(Icons.access_time),
                        contentPadding: const EdgeInsets.only(
                        left: 10,
                        right: 10,  
                      ),
                        filled: true,
                        border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                        hintText: 'Horário',
                        hintStyle: const TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.w600,
                      ) 
                      ),
                      ),
                      ),
                      const SizedBox(height: 20),
                      Container(
                      height: 52,
                      alignment: Alignment.center,
                      margin: const EdgeInsets.only(left: 40,right: 40),
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          stops: [0,1],
                          colors: [Colors.cyan, Color.fromARGB(255, 40, 65, 177)],
                      ),
                        borderRadius: BorderRadius.all(Radius.elliptical(7, 7)),
                        boxShadow: [
                            BoxShadow(
                              blurRadius: 5,
                              color: Color.fromARGB(255, 40, 65, 177)
                            )
                        ]),
                      child: SizedBox(
                        child: TextButton(
                          onPressed: () => {
                            showDialog(context: context, builder: (context) =>
                             AlertDialog(
                                title: Text('Não Implementado'),
                                actions: [
                                    TextButton(onPressed: (){
                                      Navigator.of(context).pop();
                                    }, child: const Text('Fechar'))
                                ],
                              ))
                          },
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Adicionar",
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Color.fromARGB(240, 255, 255, 255),
                                ),)],),)),
                      ),
              
                  ],
              
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

}
