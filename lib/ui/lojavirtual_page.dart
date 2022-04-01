import 'package:appbar_custom_web/widget/item_produto.dart';
import 'package:appbar_custom_web/widget/mobile_appbar.dart';
import 'package:appbar_custom_web/widget/web_appbar.dart';
import 'package:flutter/material.dart';

class LojaVirtualPage extends StatefulWidget {
  const LojaVirtualPage({Key? key}) : super(key: key);

  @override
  State<LojaVirtualPage> createState() => _LojaVirtualPageState();
}

class _LojaVirtualPageState extends State<LojaVirtualPage> {
  _ajustarVisualizacao(double larguraTela) {
    int colunas = 2;
    if (larguraTela <= 600) {
      colunas = 2;
    } else if (larguraTela <= 960) {
      colunas = 4;
    } else {
      colunas = 6;
    }
    return colunas;
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraint) {
      var largura = constraint.maxWidth;
      var alturaBarra = AppBar().preferredSize.height;

      return Scaffold(
        appBar: largura < 600
            ? PreferredSize(
                child: MobileAppBar(),
                preferredSize: Size(largura, alturaBarra))
            : PreferredSize(
                child: WebAppBar(), preferredSize: Size(largura, alturaBarra)),
        body: Padding(
          padding: EdgeInsets.all(16),
          child: GridView.count(
            crossAxisCount: _ajustarVisualizacao(largura),
            crossAxisSpacing: 8,
            mainAxisSpacing: 8,
            children: [
              ItemProduto("Kit Multimídia", "2.200,00", "p1.jpg"),
              ItemProduto("Pnew Goodyear aro 16", "800,00", "p2.jpg"),
              ItemProduto("Samsung 9", "4.100,00", "p3.jpg"),
              ItemProduto("Samsung Edge", "2.150,90", "p4.jpg"),
              ItemProduto("Galaxy 10", "6.200,00", "p5.jpg"),
              ItemProduto("Iphone 10", "1.900,20", "p6.jpg"),
              ItemProduto("Kit Multimídia", "2.200,00", "p1.jpg"),
              ItemProduto("Pnew Goodyear aro 16", "800,00", "p2.jpg"),
              ItemProduto("Samsung 9", "4.100,00", "p3.jpg"),
              ItemProduto("Samsung Edge", "2.150,90", "p4.jpg"),
              ItemProduto("Galaxy 10", "6.200,00", "p5.jpg"),
              ItemProduto("Iphone 10", "1.900,20", "p6.jpg"),
            ],
          ),
        ),
      );
    });
  }
}
