import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:placefavorite/main.dart';
import 'package:placefavorite/providers/endroit_utilisateur.dart';
import 'package:placefavorite/vue/image_prise.dart';

class AjoutEndroit extends ConsumerStatefulWidget {
  const AjoutEndroit({super.key});

  @override
  ConsumerState<AjoutEndroit> createState() => _AjoutEndroitState();
}

class _AjoutEndroitState extends ConsumerState<AjoutEndroit> {
  final _nomController = TextEditingController();
  File? _photoPrise;

  void _photoSelectionnee(File image) {
    _photoPrise = image;
  }

  void _enregistrerEndroit() {
    final nameSaisi = _nomController.text;
    if (nameSaisi.isEmpty) return;
    ref.read(endroitsProvider.notifier).ajoutEndroit(nameSaisi, _photoPrise);
    Navigator.of(context).pop();
  }

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
          'Ajouter un nouveau endroit ',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 25),
            Padding(
              padding: const EdgeInsets.all(10),
              child: TextFormField(
                controller: _nomController,
                decoration: InputDecoration(
                  hintText: "Entrez le Nom de l'endroit",
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            const SizedBox(height: 10),

            ImagePrise(onPhotoSelectionnee: _photoSelectionnee),
            const SizedBox(height: 20),

            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                fixedSize: Size(250, 55),
                backgroundColor: Colors.deepPurple,
              ),
              onPressed: _enregistrerEndroit,
              label: const Text(
                'Ajouter un nouvel endroit',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
