import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:placefavorite/providers/endroit_utilisateur.dart';
import 'package:placefavorite/vue/ajout_endrot.dart';
import 'package:placefavorite/widgets/endroits_list.dart';

void main() {
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Endroits Favorits !',
      debugShowCheckedModeBanner: false,
      home: const EndroitsInterface(),
    );
  }
}

class EndroitsInterface extends ConsumerWidget {
  const EndroitsInterface({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final endroitsUtilisateur = ref.watch(endroitsProvider);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        centerTitle: true,

        title: Text(
          'Mes endroits préfèrés !',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),

        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const AjoutEndroit()),
              );
            },
            icon: Icon(Icons.add, size: 22, color: Colors.white),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: EndroitsList(endroitsUtilisateur),
      ),
    );
  }
}
