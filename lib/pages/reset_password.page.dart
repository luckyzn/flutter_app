import 'package:flutter/material.dart';

class ResetPassword extends StatelessWidget {
  const ResetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    
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
                padding: const EdgeInsets.only(
                  top: 60,
                  left: 40,
                  right: 40,
                ),
                child: ListView(children: [
                  SizedBox(
                    width: 128,
                    height: 150,
                    child: Image.asset('assets/keyPassword.png'),),
                  const SizedBox(height: 30),
                  const Text(
                    'Redefinir Senha',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.w700),
                    textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 15),
                  const Text(
                    'Informe seu e-mail cadastrado para a recuperação da sua conta: ', 
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 18,
                    )),
                  const SizedBox(
                    height: 30,
                  ),
                  TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      filled: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(40),
                      ),
                      labelText: "E-mail",
                      labelStyle: const TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 20,)
                    ),
                    style: const TextStyle(fontSize: 20),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
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
                            )]),
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
                                "Redefinir Senha",
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Color.fromARGB(240, 255, 255, 255)
                                ),)],),)),
              
                    ),
                ],)     
              ),
            ],
          ),
        ),
      ),
    );
  }
}