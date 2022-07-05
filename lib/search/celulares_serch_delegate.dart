import 'package:appdatec/screens/products/celulares/form/cel_form.dart';
import 'package:flutter/material.dart';

import '../models/products/celulares/moviles.dart';
import '../screens/products/celulares/celulares_screen.dart';


class CelularSearchDelegate extends SearchDelegate<Producto> {
  final List<Producto> listaProductos;

  CelularSearchDelegate(this.listaProductos);

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          icon: Icon(Icons.clear,color: Colors.blueAccent,),
          onPressed: () {
            query = '';
          })
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back,color: Colors.blueAccent,),
      onPressed: () {
        close(
            context,
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
                          ).toList();

    return ListView.builder(
      itemCount: listaFiltrada.length,
      itemBuilder: (BuildContext context, int index){
        return _cardProducto(listaFiltrada[index], context);  
      },
    );
  }
}

Widget _cardProducto(Producto productoFiltrado, context){
  return Card(
    child: Column(
      children: <Widget>[
        ListTile(
          leading:  CircleAvatar(
            backgroundImage: NetworkImage(productoFiltrado.imagen),
          ),
          title: Text(productoFiltrado.descripcion),
          subtitle: Text('\S/.${productoFiltrado.precio}'),
          trailing: Icon(Icons.keyboard_arrow_right),
          onTap: (){
            Navigator.pushNamed(context, MovilesCelScreen.routeName, 
              arguments: productoFiltrado
            );
          },
        )
      ],
    ),
  );
}
