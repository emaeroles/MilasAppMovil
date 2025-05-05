import 'package:flutter/material.dart';
import 'package:milas_app_movil/core/styles.dart';
import 'package:milas_app_movil/main.dart';
import 'package:milas_app_movil/providers/kioscos_provider.dart';
import 'package:milas_app_movil/services/kiosco/kioscos_service.dart';
import 'package:provider/provider.dart';

class KioscosScreen extends StatelessWidget {
  const KioscosScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final kioscosService = KioscosService(navigationService);
    final provider = Provider.of<KioscosProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          provider.isActives ? "Kioscos" : "Kioscos Inactivos",
          style: Styles.textStyle,
        ),
        backgroundColor: Color(0xFF1a1a1a),
        foregroundColor: Color(0xFFe3e3e3),
      ),
      backgroundColor: Color(0xFF242424),
      body: Column(
        children: [
          Expanded(
            child: SizedBox(
              width: double.infinity,
              child:
                  provider.loading
                      ? Center(
                        child: CircularProgressIndicator(
                          valueColor: AlwaysStoppedAnimation<Color>(
                            Color(0xFFe3e3e3),
                          ),
                        ),
                      )
                      : ListView(
                        padding: EdgeInsets.only(top: 8),
                        children:
                            provider.kioscos.map((kiosco) {
                              return Center(
                                child: Container(
                                  width: 300,
                                  padding: EdgeInsets.only(top: 8, bottom: 8),
                                  child: OutlinedButton(
                                    style: Styles.buttonStyle,
                                    onPressed: () {
                                      kioscosService.goTo(context, kiosco.id);
                                    },
                                    child: Text(
                                      kiosco.name,
                                      style: Styles.textStyle,
                                    ),
                                  ),
                                ),
                              );
                            }).toList(),
                      ),
            ),
          ),
          Container(
            height: 80,
            width: double.infinity,
            decoration: BoxDecoration(
              border: Border(
                top: BorderSide(color: Color(0xFFFFFFFF), width: 1),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                OutlinedButton(
                  style: Styles.footerButtonStyle,
                  onPressed: () {
                    if (provider.isActives) {
                      provider.addInactivesKioscos();
                    } else {
                      provider.addKioscos();
                    }
                  },
                  child: Text(
                    provider.isActives ? "Inactivos" : "Activos",
                    style: Styles.textStyle.copyWith(fontSize: 18),
                  ),
                ),
                OutlinedButton(
                  style: Styles.footerButtonStyle,
                  onPressed: () {
                    provider.deleteSelectedKiosco();
                    kioscosService.goTo(context, "");
                  },
                  child: Text(
                    "Nuevo",
                    style: Styles.textStyle.copyWith(fontSize: 18),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
