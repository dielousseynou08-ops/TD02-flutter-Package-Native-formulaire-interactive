import 'dart:io';

import 'package:flutter_riverpod/legacy.dart';
import '../modeles/endroits.dart';

class EndroitsUtilisateur extends StateNotifier<List<Endroits>> {
  EndroitsUtilisateur() : super(const []);

  void ajoutEndroit(String name, [File? image]) {
    final nouvelEndroit = Endroits(name: name, image: image);
    state = [nouvelEndroit, ...state];
  }
}

final endroitsProvider =
    StateNotifierProvider<EndroitsUtilisateur, List<Endroits>>(
      (ref) => EndroitsUtilisateur(),
    );
