import 'package:appdatec/components/button.dart';
import 'package:appdatec/models/payments/metodo.dart';
import 'package:appdatec/providers/metodo_provider.dart';
import 'package:appdatec/screens/principal/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MetodoScreen extends StatelessWidget {
  const MetodoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final metodoProvider = Provider.of<MetodoProvider>(context);
    final List<Metodo> listaMetodos = metodoProvider.listaMetodos;

    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Felicitaciones',
            style: TextStyle(color: Colors.black),
          ),
        ),
        body: Column(
          children: [
            Image.asset("assets/images/shopping_check.png"),
            const SizedBox(height: 20),
            const Text(
              "Tu compra se realizo con éxito!",
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w900,
                fontSize: 20,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                  "Su orden esta siendo procesada. Le informaremos una vez que se recoja el pedido del punto de venta. Compruebe el estado de su pedido."),
            ),
            const SizedBox(
              height: 60,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Button(
                  text: "Regresar al menú",
                  press: () {
                    showModalBottomSheet(
                      isScrollControlled: true,
                      isDismissible: false,
                      context: context,
                      builder: (context) {
                        return SizedBox(
                          height: 550.0,
                          child: Column(children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                IconButton(
                                    onPressed: () {
                                      Navigator.pushNamed(
                                          context, HomeScreen.routeName);
                                    },
                                    icon: const Icon(Icons.clear))
                              ],
                            ),
                          ]),
                        );
                      },
                    );
                  }),
            ),
          ],
        )

        /*Center(
        child: ListView.builder(
          itemCount: listaMetodos.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(
                listaMetodos[index].nombApellido,
                style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue),
              ),
              leading: Icon(Icons.card_giftcard),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => const HomeScreen()));
        },
        backgroundColor: Colors.blue,
      ),*/
        );
  }
}
