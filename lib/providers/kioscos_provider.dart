import 'package:flutter/material.dart';
import 'package:milas_app_movil/models/kiosco.dart';
import 'package:milas_app_movil/repositories/kiosco_repo.dart';

class KioscosProvider with ChangeNotifier {
  final KioscoRepo _kioscoRepo;

  List<Kiosco> _kioscos = [];
  bool _loading = false;
  String? _error;

  KioscosProvider(this._kioscoRepo);

  List<Kiosco> get kioscos => _kioscos;
  bool get loading => _loading;
  String? get error => _error;

  Future<void> addKioscos() async {
    _loading = true;
    notifyListeners();
    try {
      _kioscos = await _kioscoRepo.getKioscos();
      _error = null;
    } catch (e) {
      _error = e.toString();
    } finally {
      _loading = false;
      notifyListeners();
    }
  }

  void addKiosco({required Kiosco kiosco}) async {
    _kioscos.add(kiosco);
    notifyListeners();
  }

  Kiosco getKiosco({required int index}) {
    return _kioscos.elementAt(index);
  }

  void updateKiosco({required Kiosco kiosco}) async {
    _kioscos.removeWhere((k) => k.id == kiosco.id);
    _kioscos.add(kiosco);
    notifyListeners();
  }

  void deleteKiosco({required String id}) async {
    _kioscos.removeWhere((k) => k.id == id);
    notifyListeners();
  }
}
