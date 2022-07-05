import 'package:appdatec/components/button.dart';
import 'package:appdatec/models/products/televisores/televisor.dart';
import 'package:appdatec/providers/televisor_provider.dart';
import 'package:appdatec/screens/products/televisores/televisor_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TelevisorFormScreen extends StatefulWidget {
  const TelevisorFormScreen({Key? key}) : super(key: key);
  static String routeName = "/teleform";

  @override
  State<TelevisorFormScreen> createState() => _TelevisorFormScreenState();
}

enum Categorias { samsung, panasonic, lg, sony }

class _TelevisorFormScreenState extends State<TelevisorFormScreen> {
  final _formkey = GlobalKey<FormState>();
  final txtTelevisorId = TextEditingController();
  final txtDescripcion = TextEditingController();
  final txtPrecio = TextEditingController();
  final txtImagen = TextEditingController();
  Categorias? _catSeleccion = Categorias.samsung;
  bool? _estadoActivo = false;
  bool formModificado = false;

  @override
  Widget build(BuildContext context) {
    final televisorProvider = Provider.of<TelevisorProvider>(context);

    final Televisor? televisor =
        ModalRoute.of(context)!.settings.arguments as Televisor?;

    if (!formModificado) {
      if (televisor != null) {
        txtTelevisorId.text = televisor.televisorId.toString();
        txtDescripcion.text = televisor.descripcion;
        txtPrecio.text = televisor.precio.toString();
        txtImagen.text = televisor.imagen;
        print(televisor.categoria);
        print(televisor.estado);
        if (televisor.categoria == 'Categoria.samsung') {
          _catSeleccion = Categorias.samsung;
        } else {
          _catSeleccion = Categorias.lg;
        }
        _estadoActivo = (televisor.estado == 'true') ? true : false;
      } else {
        txtTelevisorId.text = '0';
        txtDescripcion.text = '';
        txtPrecio.text = '';
        txtImagen.text = '';
      }
    }
    return Scaffold(
      appBar: AppBar(
        title: const Text('REGISTRO DE TELEVISORES'),
      ),
      body: Container(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Form(
            key: _formkey,
            child: Column(
              children: <Widget>[
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  readOnly: true,
                  decoration: InputDecoration(
                      labelText: 'TelevisorId',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      )),
                  controller: txtTelevisorId,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Por favor ingrese una descripcion';
                    }
                  },
                ),
                const SizedBox(
                  height: 30,
                ),
                TextFormField(
                  decoration: InputDecoration(
                      labelText: 'Descripcion',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      )),
                  controller: txtDescripcion,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Por favor ingrese una descripcion';
                    }
                  },
                ),
                const SizedBox(
                  height: 30,
                ),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Precio',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  controller: txtPrecio,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Por favor ingrese un valor';
                    }
                  },
                ),
                const SizedBox(
                  height: 30,
                ),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'UriImagen',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  controller: txtImagen,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Por favor ingrese una url válida';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 15,
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: <Widget>[
                      const Text('Categoria'),
                      const SizedBox(
                        width: 20,
                      ),
                      Radio(
                          value: Categorias.samsung,
                          groupValue: _catSeleccion,
                          onChanged: (value) {
                            setState(() {
                              _catSeleccion = value as Categorias?;
                              print(_catSeleccion);
                              formModificado = true;
                            });
                          }),
                      const Text('Samsung'),
                      const SizedBox(
                        width: 15,
                      ),
                      Radio(
                          value: Categorias.lg,
                          groupValue: _catSeleccion,
                          onChanged: (value) {
                            setState(() {
                              _catSeleccion = value as Categorias?;
                              print(_catSeleccion);
                              formModificado = true;
                            });
                          }),
                      const Text('LG'),
                      const SizedBox(
                        width: 15,
                      ),
                      Radio(
                          value: Categorias.panasonic,
                          groupValue: _catSeleccion,
                          onChanged: (value) {
                            setState(() {
                              _catSeleccion = value as Categorias?;
                              print(_catSeleccion);
                              formModificado = true;
                            });
                          }),
                      const Text('Panasonic'),
                      const SizedBox(
                        width: 15,
                      ),
                      Radio(
                          value: Categorias.sony,
                          groupValue: _catSeleccion,
                          onChanged: (value) {
                            setState(() {
                              _catSeleccion = value as Categorias?;
                              print(_catSeleccion);
                              formModificado = true;
                            });
                          }),
                      const Text('Sony')
                    ],
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Row(
                  children: <Widget>[
                    const Text('Estado'),
                    const SizedBox(
                      width: 20,
                    ),
                    Checkbox(
                        value: _estadoActivo,
                        onChanged: (value) {
                          setState(() {
                            _estadoActivo = value;
                            print('_estadoActivo: ${_estadoActivo}');
                            formModificado = true;
                          });
                        }),
                    const Text('Activo')
                  ],
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 20, horizontal: 40),
                  child: Button(
                    text: 'Guardar',
                    press: () {
                      if (_formkey.currentState!.validate()) {
                        ScaffoldMessenger.of(context)
                            .showSnackBar(const SnackBar(
                          content: Text('Validando...'),
                        ));
                        var televisor = Televisor(
                          id: '',
                          televisorId: int.parse(txtTelevisorId.text),
                          descripcion: txtDescripcion.text,
                          precio: int.parse(txtPrecio.text),
                          imagen: txtImagen.text,
                          categoria: _catSeleccion.toString(),
                          estado: _estadoActivo.toString(),
                        );

                        televisorProvider.saveTelevisor(televisor);

                        Navigator.pushReplacementNamed(
                            context, TelevisorScreen.routeName);
                      }
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
