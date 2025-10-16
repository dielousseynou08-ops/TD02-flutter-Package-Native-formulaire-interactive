import 'package:flutter/material.dart';
import 'package:placefavorite/modeles/endroits.dart';

class EndroitDetail extends StatelessWidget {
  const EndroitDetail(this.endroit, {super.key});

  final Endroits endroit;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true, title: Text(endroit.name)),
      body: Center(
        child: endroit.image != null
            ? Image.file(endroit.image!)
            : Text('Aucun image disponible !'),
      ),
    );
  }
}
