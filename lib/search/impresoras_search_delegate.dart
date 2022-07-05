

import 'package:appdatec/models/products/impresoras/impresoras.dart';
import 'package:appdatec/screens/products/impresoras/impresoras_screen.dart';

import 'package:flutter/material.dart';


class ImpresoraSearchDelegate extends SearchDelegate<Producto> {

  final List<Producto> listaProductos;

  ImpresoraSearchDelegate(this.listaProductos);


  @override
  List<Widget>? buildActions(BuildContext context) {
  
    return[
      IconButton(
      icon: Icon(Icons.clear), 
      onPressed: (){
        query = '';
      },
      )
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: (){
        close(context,
        Producto(
          id: '',
          productoId: 0,
          descripcion: '',
          precio: 0,
          imagen: '',
          categoria: '',
          estado: 'false')
        );
      },
    ); 
  }

  @override
  Widget buildResults(BuildContext context) {
    return Container();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    
    final listaFiltrada = query.isEmpty ? 
                          listaProductos :
                          listaProductos.where(
                            (producto) => producto.descripcion.toLowerCase().contains(query.toLowerCase())
                            );

    return ListView.builder(
      itemCount: listaProductos.length,
      itemBuilder: (BuildContext context, int index){
        return _cardProducto(listaProductos[index], context);

        },
      );
    }
  }

Widget _cardProducto(Producto productoFiltrado, context){
  return Card(
    child: Column(
      children: <Widget>[
        ListTile(
          title: Text(productoFiltrado.descripcion),
          subtitle: Text('\S/.${productoFiltrado.precio}'),
          trailing: Icon(Icons.keyboard_arrow_down),
          onTap: (){
            Navigator.pushNamed(context, ImpresorasComScreen.routeName, 
              arguments: productoFiltrado
            );
          },
        )
      ],
    ),
  );
}
