import 'package:appdatec/components/button.dart';
import 'package:appdatec/screens/principal/home_screen.dart';
import 'package:flutter/material.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SizedBox(
        width: double.infinity,
        child: Column(
          children: const <Widget>[
            Text("Registrar Cuenta", style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: Colors.black,
              height: 1.5,
            ),
            ),
            Text("Complete sus datos o continúe\n con las redes sociales",
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20,),
            SignUpForm()
          ],
        ),
      ),
    );
  }
}

class SignUpForm extends StatefulWidget {
  const SignUpForm({Key? key}) : super(key: key);

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final txtNombre = TextEditingController();
    final txtEmail = TextEditingController();
    final txtPass = TextEditingController();
    final txtRPass = TextEditingController();

    return Form(
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: TextFormField(
              decoration: InputDecoration(
                  labelText: "Nombre",
                  hintText: "Ingrese su nombre completo",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  suffixIcon: const Icon(Icons.person)
              ),
              controller: txtNombre,
              validator: (value){
                if(value!.isEmpty){
                  return 'Por favor ingrese un nombre válido';
                }
                return null;
              },
            ),
          ),
          const SizedBox(height: 15,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: TextFormField(
              decoration: InputDecoration(
                  labelText: "Email",
                  hintText: "Ingrese su correo",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  suffixIcon: const Icon(Icons.email_outlined)
              ),
              controller: txtEmail,
              validator: (value){
                if(value!.isEmpty){
                  return 'Por favor ingrese un correo válido';
                }
                return null;
              },
            ),
          ),
          const SizedBox(height: 15,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: TextFormField(
              autocorrect: false,
              obscureText: true,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                labelText: "Contraseña",
                hintText: "******",
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
          ),
          const SizedBox(height: 15,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: TextFormField(
              autocorrect: false,
              obscureText: true,
              keyboardType: TextInputType.visiblePassword,
              decoration: InputDecoration(
                labelText: "Repita la contraseña",
                hintText: "******",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
                suffixIcon: const Icon(Icons.pin),
              ),
              controller: txtPass,
              validator: (value){
                if(value!.length < 6){
                  return 'La contraseña debe coincidir';
                }else{
                  return null;
                }
              },
            ),
          ),
          const SizedBox(height: 30,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Button(text: 'Continue', press: (){
              if(_formKey.currentState!.validate()){
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Validando...'),

                ));
                // VALIDANDO
                if(txtNombre.text == '  ' && txtPass.text  == '     ' && txtRPass.text == '     '){
                  Navigator.pushNamed(context, HomeScreen.routeName);
                }else{
                  ScaffoldMessenger.of(context).showSnackBar( const SnackBar(
                    content: Text('Creando Cuenta...'),
                    backgroundColor: Colors.orange,
                  ));
                }
              }
            }),
          ),
        ],
      ),
    );
  }
}
