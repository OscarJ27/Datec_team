import 'package:appdatec/components/button.dart';
import 'package:appdatec/models/products/celulares/moviles.dart';
import 'package:appdatec/providers/celulares_provider.dart';
import 'package:appdatec/screens/products/celulares/report/report_celular_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';



class CelularesForm extends StatefulWidget {
  const CelularesForm({Key? key}) : super(key: key);
  static String routeName = "/movilForm";
  @override
  State<CelularesForm> createState() => _CelularesForm();
}

enum Categorias {computadoras, celulares, sonido, accesorios}

class _CelularesForm extends State<CelularesForm> {
   
   final _formkey = GlobalKey<FormState>();
  final txtDescripcion = TextEditingController();
  final txtPrecio = TextEditingController();
  final txtImagen = TextEditingController();

  Categorias? _catSeleccion = Categorias.computadoras;
  bool? _estadoActivo = false;

  @override
  Widget build(BuildContext context) {
    final celularProvider = Provider.of<CelularProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('REGISTRO DE PRODUCTO'),
      ),
      body: Container(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Form(
            key: _formkey,
            child: Column(children: <Widget>[
              const SizedBox(height: 20,),
              TextFormField(
                decoration: InputDecoration(
                    labelText: 'Descripcion',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    )
                ),
                controller: txtDescripcion,
                validator: (value){
                  if (value!.isEmpty){
                    return 'Por favor ingrese una descripcion';
                  }
                },
              ),
              const SizedBox(height: 30,),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Precio',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                controller: txtPrecio,
                validator: (value){
                  if (value!.isEmpty){
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
                validator: (value){
                  if (value!.isEmpty){
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
                        value: Categorias.computadoras,
                        groupValue: _catSeleccion,
                        onChanged: (value){
                          setState((){
                            _catSeleccion = value as Categorias?;
                            print(_catSeleccion);
                          });
                        }),
                    const Text('Computadoras'),
                    const SizedBox(
                      width: 15,
                    ),
                    Radio(
                        value: Categorias.sonido,
                        groupValue: _catSeleccion,
                        onChanged: (value){
                          setState((){
                            _catSeleccion = value as Categorias?;
                            print(_catSeleccion);
                          });
                        }),
                    const Text('Sonido'),
                    const SizedBox(
                      width: 15,
                    ),
                    Radio(
                        value: Categorias.celulares,
                        groupValue: _catSeleccion,
                        onChanged: (value){
                          setState((){
                            _catSeleccion = value as Categorias?;
                            print(_catSeleccion);
                          });
                        }),
                    const Text('Celulares'),
                    const SizedBox(
                      width: 15,
                    ),
                    Radio(
                        value: Categorias.accesorios,
                        groupValue: _catSeleccion,
                        onChanged: (value){
                          setState((){
                            _catSeleccion = value as Categorias?;
                            print(_catSeleccion);
                          });
                        }),
                    const Text('Accesorios')
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
                      onChanged: (value){
                        setState((){
                          _estadoActivo = value;
                          print('_estadoActivo: ${_estadoActivo}');
                        });
                      }),
                  const Text('Activo')
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 40),
                child: Button(
                  text: 'Guardar',
                  press: (){
                    if (_formkey.currentState!.validate()) {
                      ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Validando...'),)
                      );
                      var producto = Producto(
                        id: '',
                        productoId: 0,
                        descripcion: txtDescripcion.text,
                        precio: int.parse(txtPrecio.text),
                        imagen: txtImagen.text,
                        categoria: _catSeleccion.toString(),
                        estado: _estadoActivo.toString(),
                      );

                      celularProvider.saveProducto(producto);

                      Navigator.pushReplacementNamed(
                          context, CelularesForm.routeName);
                    }
                  },
                ),
              )
            ],),
          ),
        ),
      ),
    );
  }
}