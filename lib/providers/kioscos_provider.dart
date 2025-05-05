import 'package:flutter/material.dart';
import 'package:milas_app_movil/models/kiosco.dart';
import 'package:milas_app_movil/repositories/kiosco_repo.dart';

class KioscosProvider with ChangeNotifier {
  final KioscoRepo _kioscoRepo;

  bool _loading = false;
  String? _error;

  List<Kiosco> _kioscos = [];
  String _selectedKiosco = "";
  bool _isActives = true;

  KioscosProvider(this._kioscoRepo);

  // Methods
  bool get loading => _loading;
  String? get error => _error;

  List<Kiosco> get kioscos => _kioscos;

  Future<void> addKioscos() async {
    _loading = true;
    notifyListeners();
    try {
      _kioscos = await _kioscoRepo.getKioscos();
      _isActives = true;
      notifyListeners();
      _error = null;
    } catch (e) {
      _error = e.toString();
    } finally {
      _loading = false;
      notifyListeners();
    }
  }

  Future<void> addInactivesKioscos() async {
    _loading = true;
    notifyListeners();
    try {
      _kioscos = await _kioscoRepo.getInactivesKioscos();
      _isActives = false;
      notifyListeners();
      _error = null;
    } catch (e) {
      _error = e.toString();
    } finally {
      _loading = false;
      notifyListeners();
    }
  }

  String get selectedKiosco => _selectedKiosco;

  void addSelectedKiosco({required String id}) async {
    _selectedKiosco = id;
    notifyListeners();
  }

  void deleteSelectedKiosco() async {
    _selectedKiosco = "";
    notifyListeners();
  }

  bool get isActives => _isActives;

  Kiosco getKiosco({required String id}) {
    return _kioscos.firstWhere((k) => k.id == id);
  }

  void addKiosco({required Kiosco kiosco}) async {
    _loading = true;
    notifyListeners();
    try {
      await _kioscoRepo.addKiosco(kiosco);
      _kioscos = await _kioscoRepo.getKioscos();
      notifyListeners();
      _error = null;
    } catch (e) {
      _error = e.toString();
    } finally {
      _loading = false;
      notifyListeners();
    }
  }

  void updateKiosco({required Kiosco kiosco}) async {
    _loading = true;
    notifyListeners();
    try {
      await _kioscoRepo.updateKiosco(kiosco);
      _kioscos = await _kioscoRepo.getKioscos();
      notifyListeners();
      _error = null;
    } catch (e) {
      _error = e.toString();
    } finally {
      _loading = false;
      notifyListeners();
    }
  }

  void toggleIsActives(String id) async {
    _loading = true;
    notifyListeners();
    try {
      await _kioscoRepo.toggleActiveKiosco(id);
      _kioscos.removeWhere((k) => k.id == id);
      notifyListeners();
      _error = null;
    } catch (e) {
      _error = e.toString();
    } finally {
      _loading = false;
      notifyListeners();
    }
    notifyListeners();
  }
}
