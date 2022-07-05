import 'package:appdatec/models/products/televisores/televisor.dart';
import 'package:appdatec/screens/products/televisores/form/tele_form.dart';
import 'package:flutter/material.dart';

class TelevisorSearchDelegate extends SearchDelegate<Televisor> {
  final List<Televisor> listaTelevisor;

  TelevisorSearchDelegate(this.listaTelevisor);

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      )
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        close(
            context,
            Televisor(
              id: '',
              televisorId: 0,
              descripcion: '',
              precio: 0,
              imagen: '',
              categoria: '',
              estado: 'false',
            ));
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return Container();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final listaFiltrada = query.isEmpty
        ? listaTelevisor
        : listaTelevisor
            .where((televisor) => televisor.descripcion
                .toLowerCase()
                .contains(query.toLowerCase()))
            .toList();
    return ListView.builder(
      itemCount: listaFiltrada.length,
      itemBuilder: (BuildContext context, int index) {
        return _cardTelevisor(listaFiltrada[index], context);
      },
    );
  }
}

Widget _cardTelevisor(Televisor televisorFiltrado, context) {
  return Card(
    child: Column(
      children: <Widget>[
        ListTile(
          leading: CircleAvatar(
            backgroundImage: NetworkImage(televisorFiltrado.imagen),
          ),
          title: Text(televisorFiltrado.descripcion),
          subtitle: Text('\S/.${televisorFiltrado.precio}'),
          trailing: Icon(Icons.keyboard_arrow_right),
          onTap: () {
            Navigator.pushNamed(context, TelevisorFormScreen.routeName,
                arguments: televisorFiltrado);
          },
        )
      ],
    ),
  );
}
