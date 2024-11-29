import 'package:flutter/material.dart';
import 'package:flutter_app/SQLite/sqlite.dart';
import 'package:flutter_app/models/users.dart';
import 'package:flutter_app/pages/main_menu.page.dart';
import 'package:flutter_app/pages/reset_password.page.dart';
import 'package:flutter_app/pages/signup.page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  final email = TextEditingController();
  final password = TextEditingController();

  bool isLoginFalse = false;

  final db = DatabaseHelper();

  login()async {
    var response = await db.login(Users(userEmail: email.text, userpassword: password.text));
    if(response == true){
      if(!mounted) return;
        Navigator.push(context, MaterialPageRoute(builder: (context) => const MainMenu()));
      
    }else{
      setState(() {
        isLoginFalse = true;
      });
    }
  }

  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  top: 120,
                  left: 40,
                  right: 40,
                ),
                child: Form(
                  key: formKey,
                  child: ListView(
                    children: [
                      SizedBox(
                      width: 128,
                      height: 128,
                      child: Image.asset("assets/avatar.png"),
                    ),
                    const SizedBox(
                      height: 30,
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
                      Container(
                        height: 40,
                        alignment: Alignment.centerLeft,
                        child: TextButton(onPressed: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context) => const ResetPassword()));
                        }, child:  const Text("Esqueceu sua Senha?"),
                      )),
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
                              )
                          ]),
                        child: SizedBox(
                          child: TextButton(
                            onPressed: () => {
                              if(formKey.currentState!.validate()){
                                login()
                              }
                              },
                            child: const Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Entrar",
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: Color.fromARGB(240, 255, 255, 255),
                                  ),)],),)),
                        ),
                        const SizedBox(
                          height: 7,
                        ),
                        SizedBox(
                          height: 40,
                          child: TextButton(
                            onPressed: () => {
                              Navigator.push(context, MaterialPageRoute(builder: (context) => const SignUp()))
                            },
                            child: const Text(
                              'Cadastre-se',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),)),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        isLoginFalse? const Text("E-mail ou senha inválido. ",
                         style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold, fontSize: 16),
                         textAlign: TextAlign.center,)
                         : const SizedBox(),
                        ],),
                ) 
                    ),
            ],
          ),
        ),
      ),
    );
  }
}