import 'package:flutter/material.dart';
import 'package:flutter_app/SQLite/sqlite.dart';
import 'package:flutter_app/models/users.dart';
import 'package:flutter_app/pages/login.page.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {

  final email = TextEditingController();
  final password = TextEditingController();
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor:Colors.transparent,
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
                  top: 20,
                  left: 40,
                  right: 40,
                ),
              child: Form(
                key: formKey,
                child: ListView(
                  children: <Widget>[
                    const Text('Cadastre-se', textAlign: TextAlign.center, style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.w500)
                        ),
                    const SizedBox(
                      height: 40
                    ),
                    Container(
                      width: 128,
                      height: 172,
                      alignment: Alignment.topCenter,
                      decoration: const BoxDecoration(
                        image: DecorationImage(image: 
                        AssetImage('assets/avatar.png'))
                      ),
              
                      // -- Botão para adicionar avatar --
              
                      /*child: Container(
                        width: 64,
                        height: 256,
                        alignment: Alignment.bottomCenter,
                        child: FloatingActionButton.small(
                          backgroundColor: const Color.fromARGB(217, 42, 42, 114),
                          onPressed: () => {},
                          shape: const CircleBorder(),
                          child: const Icon(
                            Icons.add,
                            color: Colors.white),)
                      ),*/
                    ),
                   const SizedBox(
                    height: 40,
                   ),
                   TextFormField(
                    controller: email,
                    validator: (value){
                        if (value!.isEmpty){
                          return('E-mail obrigatório');
                        }
                        return null;
                      },
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
                        height: 20,
                      ),
                      TextFormField(
                        controller: password,
                        validator: (value){
                        if (value!.isEmpty){
                          return('Senha obrigatória');
                        }
                        return null;
                      },
                        keyboardType: TextInputType.text,
                        obscureText: true,
                        decoration: InputDecoration(
                          filled: true,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(40),
                        ),
                          labelText: "Senha",
                          labelStyle: const TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 20),
                        ),
                        style: const TextStyle(fontSize: 20),
                      ),
                      const SizedBox(
                        height: 50,
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
                            onPressed: () {
                                if (formKey.currentState!.validate()) {
                                    
                                  final db = DatabaseHelper();
                                  db.newUser(Users(userEmail: email.text, userpassword: password.text))
                                  .whenComplete((){
                                    Navigator.push(context, MaterialPageRoute(builder: (context) => const LoginPage()));
                                  });
                              
                            }},
                            child: const Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Cadastrar",
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: Color.fromARGB(240, 255, 255, 255),
                                  ),)],),)),
                        ),
                    
                ],
                ),
              ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}