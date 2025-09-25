import 'package:BlueChain/configs/app_settings.dart';
import 'package:BlueChain/models/moeda.dart';
import 'package:BlueChain/pages/moedas_detalhes_page.dart';
import 'package:BlueChain/repositories/favoritas_repository.dart';
import 'package:BlueChain/repositories/moedas_repository.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class MoedasPage extends StatefulWidget {
  const MoedasPage({super.key});

  @override
  _MoedasPageState createState() => _MoedasPageState();
}

class _MoedasPageState extends State<MoedasPage> {
  final tabela = MoedaRepository.tabela;
  late NumberFormat real;
  late Map<String, String> loc;
  List<Moeda> selecionadas = [];
  late FavoritasRepository favoritas;

  readNumberFormat() {
    loc = context.watch<AppSettings>().locale;
    real = NumberFormat.currency(locale: loc['locale'], name: loc['name']);
  }

  changeLanguageButton() {
    final locale = loc['locale'] == 'pt_BR' ? 'en_US' : 'pt_BR';
    final name = loc['locale'] == 'pt_BR' ? '\$' : 'R\$';

    return PopupMenuButton(
      icon: Icon(Icons.language, color: Colors.white),
      itemBuilder: (context) => [
        PopupMenuItem(
          child: ListTile(
            leading: Icon(Icons.swap_vert),
            title: Text('Usar $locale'),
            onTap: () {
              context.read<AppSettings>().setLocale(locale, name);
              Navigator.pop(context);
            },
          ),
        ),
      ],
    );
  }

  appBarDinamica() {
    if (selecionadas.isEmpty) {
      return AppBar(
        title: Text('Cripto Moedas'),
        actions: [changeLanguageButton()],
        centerTitle: true,
        titleTextStyle: TextStyle(color: Colors.white, fontSize: 20),
      );
    } else {
      return AppBar(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(12)),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            setState(() {
              selecionadas = [];
            });
          },
        ),
        title: Text('${selecionadas.length} selecionadas'),
        titleTextStyle: TextStyle(
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.w500,
        ),
        backgroundColor: Colors.indigo[300],
      );
    }
  }

  //Navegação.
  mostrarDetalhes(Moeda moeda) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (__) => MoedasDetalhesPage(moeda: moeda)),
    );
  }

  limparSelecionadas() {
    setState(() {
      selecionadas = [];
    });
  }

  @override
  Widget build(BuildContext context) {
    // favoritas = Provider.of<FavoritasRepository>(context);
    favoritas = context.watch<FavoritasRepository>();
    readNumberFormat();
    return Scaffold(
      appBar: appBarDinamica(),
      body: ListView.separated(
        itemBuilder: (BuildContext context, int moeda) {
          return ListTile(
            leading: (selecionadas.contains(tabela[moeda]))
                ? CircleAvatar(child: Icon(Icons.check))
                : SizedBox(child: Image.asset(tabela[moeda].icone), width: 40),

            title: Row(
              children: [
                Text(
                  tabela[moeda].nome,
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.w400),
                ),
                if (favoritas.lista.any((fav) => fav.sigla == tabela[moeda].sigla))
                  Icon(Icons.star, color: Colors.amber, size: 14),
              ],
            ),
            trailing: Text(real.format(tabela[moeda].preco)),
            selected: selecionadas.contains(tabela[moeda]),
            selectedTileColor: Colors.indigo[100],
            onLongPress: () {
              setState(() {
                (selecionadas.contains(tabela[moeda]))
                    ? selecionadas.remove(tabela[moeda])
                    : selecionadas.add(tabela[moeda]);
              });
            },
            onTap: () => mostrarDetalhes(tabela[moeda]),
          );
        },
        padding: EdgeInsets.all(16),
        separatorBuilder: (__, ___) => Divider(),
        itemCount: tabela.length,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: selecionadas.isNotEmpty
          ? FloatingActionButton.extended(
              onPressed: () {
                favoritas.saveAll(selecionadas);
                limparSelecionadas();
              },
              icon: Icon(Icons.star, color: Colors.amber),
              label: Text(
                'FAVORITAR',
                style: TextStyle(
                  letterSpacing: 0,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
            )
          : null,
    );
  }
}
