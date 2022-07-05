
import 'package:appdatec/screens/products/computadoras/form/com_form.dart';
import 'package:flutter/material.dart';

import '../models/products/computadoras/productos.dart';

class ProductoSearchDelegate extends SearchDelegate<Producto>{

  final List<Producto> listaProductos;
  ProductoSearchDelegate(this.listaProductos);

  @override
  List<Widget>? buildActions(BuildContext context) {

    return[
      IconButton(
          onPressed: (){
            query = '';
          }, icon: const Icon(Icons.clear)
      )
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: (){
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
        icon: const Icon(Icons.arrow_back),
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
    }
    );
  }
}
Widget _cardProducto(Producto productoFiltrado, context){
  return Card(
    child: Column(
      children: [
        ListTile(
          leading: CircleAvatar(
            backgroundImage: NetworkImage(productoFiltrado.imagen),
          ),
          title: Text(productoFiltrado.descripcion),
          subtitle: Text('S/.${productoFiltrado.precio}'),
          trailing:  const Icon(Icons.keyboard_arrow_right),
          onTap: (){
            Navigator.pushNamed(context, ProductFormComScreen.routeName,
            arguments: productoFiltrado
            );
          },
        )
      ],
    ),
  );
}