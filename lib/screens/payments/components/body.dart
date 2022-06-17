import 'package:appdatec/components/button.dart';
import 'package:appdatec/models/payments/metodo.dart';
import 'package:appdatec/providers/metodo_provider.dart';
import 'package:appdatec/screens/payments/metodo.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _Body();
}

class _Body extends State<Body> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final metodoProvider = Provider.of<MetodoProvider>(context);
    final txtNombre = TextEditingController();
    final txtNumero = TextEditingController();
    final txtVencimiento = TextEditingController();

    final txtCodigo = TextEditingController();

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            key: _formKey,
            child: Column(children: <Widget>[
              Image.asset(
                'assets/images/tarjeta.png',
                width: 400,
                height: 150,
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Nombre completo del titular',
                  prefixIcon: const Icon(Icons.person),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0)),
                ),
                controller: txtNombre,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Por favor ingrese nombre completo del titular';
                  }
                },
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.card_giftcard),
                    labelText: 'Número de tarjeta',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0))),
                controller: txtNumero,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Por favor ingrese un número de tarjeta';
                  }
                },
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.calendar_month),
                    labelText: 'MM/AA',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0))),
                controller: txtVencimiento,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Por favor ingrese una fecha';
                  }
                },
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.security),
                    labelText: 'CVV',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0))),
                controller: txtCodigo,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Por favor ingrese su código';
                  }
                },
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                  child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Button(
                        text: "Pagar",
                        press: () {
                          if (_formKey.currentState!.validate()) {
                            ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(content: Text('Procesando...')));

                            var metodo = Metodo(
                              id: '',
                              metodoId: 0,
                              cvv: int.parse(txtCodigo.text),
                              nombApellido: txtNombre.text,
                              tarjeta: int.parse(txtNumero.text),
                              vencimiento: txtVencimiento.text,
                            );

                            metodoProvider.saveMetodo(metodo);

                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const MetodoScreen()));
                          }
                        }),
                  )
                ],
              ))
            ]),
          ),
        ),
      ),
    );
  }
}
