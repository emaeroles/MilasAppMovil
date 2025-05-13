import 'package:flutter/material.dart';
import 'package:milas_app_movil/core/styles.dart';
import 'package:milas_app_movil/main.dart';
import 'package:milas_app_movil/models/kiosco.dart';
import 'package:milas_app_movil/providers/kioscos_provider.dart';
import 'package:milas_app_movil/services/kiosco/kiosco_service.dart';
import 'package:milas_app_movil/widgets/text_field.dart';
import 'package:provider/provider.dart';

class KioscoScreen extends StatefulWidget {
  const KioscoScreen({super.key});

  @override
  State<KioscoScreen> createState() => _KioscoScreenState();
}

class _KioscoScreenState extends State<KioscoScreen> {
  final nameCtrl = TextEditingController();
  final managerCtrl = TextEditingController();
  final phoneCtrl = TextEditingController();
  final addressCtrl = TextEditingController();

  bool isActive = false;

  @override
  void initState() {
    super.initState();
    final provider = Provider.of<KioscosProvider>(context, listen: false);

    if (provider.selectedKiosco.isNotEmpty) {
      final kiosco = provider.getKiosco(id: provider.selectedKiosco);
      nameCtrl.text = kiosco.name;
      managerCtrl.text = kiosco.manager;
      phoneCtrl.text = kiosco.phone;
      addressCtrl.text = kiosco.address;
      isActive = kiosco.isActive;
    }
  }

  @override
  void dispose() {
    nameCtrl.dispose();
    managerCtrl.dispose();
    phoneCtrl.dispose();
    addressCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final kioscoService = KioscoService(navigationService);
    final provider = Provider.of<KioscosProvider>(context);

    return Scaffold(
      appBar: AppBar(title: Text("Kiosco")),
      body: Column(
        children: [
          Expanded(
            child: SizedBox(
              width: double.infinity,
              child:
                  provider.loading
                      ? Center(child: CircularProgressIndicator())
                      : Center(
                        child: SizedBox(
                          width: 300,
                          child: Column(
                            children: [
                              SizedBox(height: 25),
                              AppTextField(
                                label: "Nombre",
                                controller: nameCtrl,
                              ),
                              SizedBox(height: 25),
                              AppTextField(
                                label: "Responsable",
                                controller: managerCtrl,
                              ),
                              SizedBox(height: 25),
                              AppTextField(
                                label: "Teléfono",
                                controller: phoneCtrl,
                                keyboardType: TextInputType.number,
                              ),
                              SizedBox(height: 25),
                              AppTextField(
                                label: "Dirección",
                                controller: addressCtrl,
                              ),
                            ],
                          ),
                        ),
                      ),
            ),
          ),
          Container(
            height: 80,
            width: double.infinity,
            decoration: BoxDecoration(
              border: Border(
                top: BorderSide(
                  color: Theme.of(context).colorScheme.onPrimary,
                  width: 1,
                ),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                if (provider.selectedKiosco != "")
                  OutlinedButton(
                    style: Styles.min100ButtonStyle,
                    onPressed: () {
                      kioscoService.toggleActive(
                        context,
                        provider.selectedKiosco,
                      );
                      provider.deleteSelectedKiosco();
                    },
                    child: Text(isActive ? "Desactivar" : "Activar"),
                  ),
                OutlinedButton(
                  style: Styles.min100ButtonStyle,
                  onPressed: () {
                    Kiosco kiosco = Kiosco(
                      id: provider.selectedKiosco,
                      name: nameCtrl.text,
                      manager: managerCtrl.text,
                      phone: phoneCtrl.text,
                      address: addressCtrl.text,
                    );
                    kioscoService.guardar(context, kiosco);
                  },
                  child: Text("Guardar"),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
