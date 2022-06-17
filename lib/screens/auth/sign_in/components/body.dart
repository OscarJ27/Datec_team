import 'package:appdatec/components/button.dart';
import 'package:appdatec/screens/auth/sign_up/sign_up.dart';
import 'package:appdatec/screens/principal/home_screen.dart';

import 'package:flutter/material.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: SizedBox(
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20,),
            child: Column(
              children: const <Widget>[
                 Text(
                  "Bienvenido de nuevo",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "Inicie sesión con su correo electrónico y contraseña \no continúe con las redes sociales",
                  textAlign: TextAlign.center,
                ),
                SignForm()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
class SignForm extends StatefulWidget {
  const SignForm({Key? key}) : super(key: key);

  @override
  State<SignForm> createState() => _SignFormState();
}

class _SignFormState extends State<SignForm> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final txtUser = TextEditingController();
    final txtPass = TextEditingController();

    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            TextFormField(
              decoration: InputDecoration(
                labelText: "Email",
                hintText: "Ingrese su usuario o correo",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
                suffixIcon: const Icon(Icons.person)
                ),
            controller: txtUser,
              validator: (value){
                if(value!.isEmpty){
                  return 'Por favor ingresa un usuario';
                }
                return null;
              },
              ),
            const SizedBox(height: 20,),
            TextFormField(
              autocorrect: false,
              obscureText: true,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                labelText: "Contraseña",
                hintText: "Ingrese su contraseña",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
                suffixIcon: const Icon(Icons.lock_clock_outlined),
              ),
              controller: txtPass,
              validator: (value){
                if(value!.length < 6){
                  return 'La contraseña debe tener minimo 6 caracteres';
                }else{
                  return null;
                }
              },
            ),
             const SizedBox(height: 30,),
            Button(text: 'Continue', press: (){
                if(_formKey.currentState!.validate()){
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Validando...'),

                  ));
                  // VALIDANDO
                  if(txtUser.text == 'Admin' && txtPass.text == '123456'){
                    Navigator.pushNamed(context, HomeScreen.routeName);
                  }else{
                    ScaffoldMessenger.of(context).showSnackBar( const SnackBar(
                      content: Text('Credenciales Incorrectas...'),
                      backgroundColor: Colors.orange,
                    ));
                  }
                }
            }),
            const SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                const Text("¿No tienes cuenta?"),
                TextButton(
                  onPressed: (){
                    Navigator.pushNamed(context, SignUpScreen.routeName);
                  },
                  child: const Text('Registrate',
                  style: TextStyle(color: Colors.black),),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

