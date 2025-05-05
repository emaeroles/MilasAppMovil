import 'package:flutter/widgets.dart' show BuildContext;
import 'package:milas_app_movil/core/navigation_service.dart';
import 'package:milas_app_movil/models/kiosco.dart';
import 'package:milas_app_movil/providers/kioscos_provider.dart';
import 'package:provider/provider.dart';

class KioscoService {
  final NavigationService _navigationService;

  KioscoService(this._navigationService);

  void guardar(BuildContext context, Kiosco kiosco) async {
    final provider = Provider.of<KioscosProvider>(context, listen: false);

    if (provider.selectedKiosco.isEmpty) {
      provider.addKiosco(kiosco: kiosco);
    } else {
      provider.updateKiosco(kiosco: kiosco);
    }

    _navigationService.goBack();
  }

  void toggleActive(BuildContext context, String id) async {
    final provider = Provider.of<KioscosProvider>(context, listen: false);

    provider.toggleIsActives(id);

    _navigationService.goBack();
  }
}
