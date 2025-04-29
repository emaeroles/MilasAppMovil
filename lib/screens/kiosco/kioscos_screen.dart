import 'package:flutter/material.dart';
import 'package:milas_app_movil/core/styles.dart';
import 'package:milas_app_movil/providers/kioscos_provider.dart';
import 'package:provider/provider.dart';

class KioscosScreen extends StatefulWidget {
  const KioscosScreen({super.key});

  @override
  State<KioscosScreen> createState() => _KioscosScreenState();
}

class _KioscosScreenState extends State<KioscosScreen> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<KioscosProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Kioscos", style: Styles.textStyle),
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
                        children:
                            provider.kioscos.map((kiosco) {
                              return Center(
                                child: Container(
                                  width: 300,
                                  padding: EdgeInsets.all(5),
                                  child: OutlinedButton(
                                    style: Styles.buttonStyle,
                                    onPressed: () {},
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
                  onPressed: () {},
                  child: Text(
                    "Inactivos",
                    style: Styles.textStyle.copyWith(fontSize: 18),
                  ),
                ),
                OutlinedButton(
                  style: Styles.footerButtonStyle,
                  onPressed: () {},
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
