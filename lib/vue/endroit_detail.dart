import 'package:flutter/material.dart';
import 'package:placefavorite/main.dart';
import 'package:placefavorite/modeles/endroits.dart';

class EndroitDetail extends StatelessWidget {
  const EndroitDetail(this.endroit, {super.key});

  final Endroits endroit;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => EndroitsInterface()),
            );
          },
          icon: Icon(Icons.arrow_back, color: Colors.white),
        ),
        title: Text(
          endroit.name,
          style: TextStyle(
            color: Colors.white,
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ClipRRect(
            borderRadius: BorderRadiusGeometry.circular(15),
            child: endroit.image != null
                ? Image.file(endroit.image!)
                : Text('Aucun image disponible !'),
          ),
        ),
      ),
    );
  }
}
