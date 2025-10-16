import 'package:flutter/material.dart';
import 'package:placefavorite/modeles/endroits.dart';
import 'package:placefavorite/vue/endroit_detail.dart';

class EndroitsList extends StatelessWidget {
  const EndroitsList(this.endroits, {super.key});

  final List<Endroits> endroits;

  @override
  Widget build(BuildContext context) {
    if (endroits.isEmpty) {
      return const Center(child: Text('Aucun Endroit favori ajouté !'));
    }
    return ListView.builder(
      itemCount: endroits.length,
      itemBuilder: (context, index) => Card(
        child: ListTile(
          leading: endroits[index].image != null
              ? CircleAvatar(backgroundImage: FileImage(endroits[index].image!))
              : const Icon(Icons.place),
          title: Text(endroits[index].name),
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => EndroitDetail(endroits[index]),
              ),
            );
          },
        ),
      ),
    );
  }
}
