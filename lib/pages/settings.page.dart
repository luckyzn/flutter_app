import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app/widgets/notification_service.dart';
import 'package:get/get.dart';

class Settings extends StatefulWidget {

  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  bool isSwitched = false;


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor:Colors.transparent,
        iconTheme: const IconThemeData(color: Colors.white),
        ),
      body: Container(
        padding: const EdgeInsets.only(
          left: 20,
          right: 20
        ),
        decoration: const BoxDecoration(
          image: DecorationImage(image: AssetImage('assets/background.png'), fit: BoxFit.cover)),
          child: ListView(
            children: [
              const SizedBox(
                height: 40,
              ),
              const Text(
                'Configurações',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 60,
              ),
              const Text(
                'Conta',
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w500
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Card(
                child: ListTile(
                onTap: (){},
                leading: Image.asset('assets/avatar.png', scale: 2.5),
                title: Text('Name Placeholder'),
                trailing: const Icon(
                  Icons.chevron_right_sharp,
                  size: 26,
                ),
              ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                'Geral',
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w500
                ),
              ),
              const SizedBox(
                height: 20,
              ),

              Card(
                child: ListTile(
                  leading: const Icon(Icons.bedtime),
                  title: const Text('Modo Escuro'),
                  trailing: Switch(
                    thumbColor: WidgetStatePropertyAll(Colors.white),
                    activeColor: Color.fromARGB(255, 40, 229, 229),
                    value: isSwitched,
                    onChanged: (value)
                    {
                      isSwitched = value;
                      if(isSwitched == false){
                        setState(() {
                          Get.changeTheme(ThemeData.light());
                        });
                      }else {
                        setState(() {
                        Get.changeTheme(ThemeData.dark());
                      });
                      }
                    },),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
               Card(
                child: ListTile(
                  onTap: () {
                    NotificationService().showNotification(title: 'Aviso!', body: 'Você ainda tem lembretes ativos');
                  },
                  leading: const Icon(Icons.notifications),
                  title: const Text('Notificações'),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Card(
                  child: ListTile(
                    leading: Icon(Icons.question_mark),
                    title: Text('Sobre'),
                    trailing: Text('Versão: 0.0.2'),
                  ),
              ),
              const SizedBox(height: 10),
              Card(
                child: ListTile(
                  onTap: (){
                      SystemChannels.platform.invokeMethod<void>('SystemNavigator.pop');
                  },
                  title: const Text(
                    'Sair',
                    style: TextStyle(color: Colors.red)),
                  leading: const Icon(
                    Icons.error_outline,
                    color: Colors.red),
                ),
              )
              
            ]
          ),
      ),
    );

  }
}