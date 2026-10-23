import 'package:flutter/material.dart';
//Feito por: Ryan Xavier
const String RyanXavier = 'Ryan Xavier Paz Corrêa Amaral';

void main() {
  runApp(const CatalogoApp());
}

class PontoTuristico {
  final String nome;
  final String cidade;
  final String descricao;

  const PontoTuristico({
    required this.nome,
    required this.cidade,
    required this.descricao,
  });
}

class CatalogoApp extends StatelessWidget {
  const CatalogoApp({super.key});

  final List<PontoTuristico> pontosTuristicos = const [
    PontoTuristico(
      nome: 'Museu do Café',
      cidade: 'Santos',
      descricao: 'Museu instalado na antiga Bolsa Oficial de Café, que conta a história do café no Brasil.',
    ),
    PontoTuristico(
      nome: 'Ponte Pênsil',
      cidade: 'São Vicente',
      descricao: 'Ponte histórica que liga a Ilha de São Vicente ao continente.',
    ),
    PontoTuristico(
      nome: 'Praia do Tombo',
      cidade: 'Guarujá',
      descricao: 'Praia conhecida pelas ondas fortes e pela prática de surfe.',
    ),
    PontoTuristico(
      nome: 'Fortaleza de Itaipu',
      cidade: 'Praia Grande',
      descricao: 'Complexo militar histórico construído para proteger o litoral paulista.',
    ),
    PontoTuristico(
      nome: 'Forte São João',
      cidade: 'Bertioga',
      descricao: 'Fortificação histórica próxima ao Canal de Bertioga, ligada ao período colonial.',
    ),
    PontoTuristico(
      nome: 'Plataforma de Pesca',
      cidade: 'Mongaguá',
      descricao: 'Plataforma em formato de T que avança sobre o mar e atrai visitantes e pescadores.',
    ),
    PontoTuristico(
      nome: 'Cama de Anchieta',
      cidade: 'Itanhaém',
      descricao: 'Formação rochosa à beira-mar, acessível por uma passarela e ligada à história de Anchieta.',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: _titulo(),
        body: _corpo(),
      ),
    );
  }

  AppBar _titulo() {
    return AppBar(
      title: const Text(RyanXavier),
      centerTitle: true,
      backgroundColor: Colors.blue,
      foregroundColor: Colors.white,
    );
  }

  Widget _corpo() {
    return ListView.builder(
      itemCount: pontosTuristicos.length,
      itemBuilder: (context, indice) {
        return _itemPonto(pontosTuristicos[indice]);
      },
    );
  }

  Widget _itemPonto(PontoTuristico ponto) {
    return Container(
      margin: const EdgeInsets.all(12),
      padding: const EdgeInsets.all(16),
      color: Colors.blue.shade50,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(ponto.nome, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          const SizedBox(height: 6),
          Text('Cidade: ${ponto.cidade}'),
          const SizedBox(height: 6),
          Text(ponto.descricao),
        ],
      ),
    );
  }
}
