import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ConsultarDonaciones extends StatefulWidget {
  const ConsultarDonaciones({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<ConsultarDonaciones> {
  TextEditingController nombre = TextEditingController();
  TextEditingController telefono = TextEditingController();
  TextEditingController direccion = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 30,
        right: 30,
      ),
      child: Column(
        children: [
          TextField(
            controller: nombre,
            decoration: InputDecoration(
              labelText: 'Nombre',
            ),
          ),
          TextField(
            controller: telefono,
            decoration: InputDecoration(
              labelText: 'Telefono',
            ),
          ),
          TextField(
            controller: direccion,
            decoration: InputDecoration(
              labelText: 'Direccion',
            ),
          ),
          TextButton(
            child: Text('Agregar'),
            onPressed: () => agregar(
              nombre.text,
              telefono.text,
              direccion.text,
            ),
          ),
          Expanded(
            child: StreamBuilder(
                stream: FirebaseFirestore.instance
                    .collection('donantes')
                    .snapshots(),
                builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (snapshot.hasError) {
                    return Center(
                      child: Text(
                        snapshot.error.toString(),
                      ),
                    );
                  }
                  if (!snapshot.hasData) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  List<DocumentSnapshot> docs = snapshot.data.docs;

                  return ListView.builder(
                    itemCount: docs.length,
                    itemBuilder: (context, index) {
                      //Timestamp t = docs[index].get('fecha');
                      //DateTime d = t.toDate();

                      return ListTile(
                        title: Text(
                          '${docs[index].get('nombre')}',
                        ),
                        leading: Text('Nombre'),
                      );
                    },
                  );
                }),
          ),
        ],
      ),
    );
  }
}

void agregar(String nombre, String telefono, String direccion) {
  var fecha = DateTime(2021, 6, 12);
  Timestamp t = Timestamp.fromDate(fecha);
  var db2 = FirebaseFirestore.instance.collection('donantes');
  /*var db = FirebaseFirestore.instance.collection('donaciones');
  db.add({'monto': 2500, 'fecha': t});*/
  db2.add({
    'nombre': nombre,
    'telefono': telefono,
    'direccion': direccion,
  });
}
