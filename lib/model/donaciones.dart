import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';

class Donaciones {
  String id;
  Timestamp fecha;
  Double monto;

  Donaciones.fromFirestore(DocumentSnapshot doc)
      : id = doc.id,
        fecha = doc.get('fecha'),
        monto = doc.get('monto');
}
