
import 'package:flutter/material.dart';
// Ryan Xavier Paz Corrêa Amaral
void main() {
  runApp(const CatalogoApp());
}

class PontoTuristico {
  final String nome;
  final String cidade;
  final String descricao;
  final String imagem;

  PontoTuristico({
    required this.nome,
    required this.cidade,
    required this.descricao,
    required this.imagem,
  });
}

class CatalogoApp extends StatelessWidget {
  const CatalogoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Catálogo da Baixada Santista',
      home: TelaCatalogo(),
    );
  }
}

class TelaCatalogo extends StatelessWidget {
  TelaCatalogo({super.key});

  final List<PontoTuristico> pontos = [
    PontoTuristico(
      nome: 'Museu do Café',
      cidade: 'Santos',
      descricao: 'Museu instalado na antiga Bolsa Oficial de Café, que conta a história do café no Brasil.',
      imagem: 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9TLIBuKcmXvCm73k_ab00qyth3XoUSpvOxes1kJV1Sdr7LqFX7lm3lBAVN921TKYF1i1SNBv5LqQZB_mY7cQkOpln0RLEkHpxYWck0KOP4pg9wOhxQgCS7e4NHV0iCg6Ck83IePl9bo19o=s680-w680-h510',
    ),
    PontoTuristico(
      nome: 'Ponte Pênsil',
      cidade: 'São Vicente',
      descricao: 'Ponte histórica que liga a Ilha de São Vicente ao continente.',
      imagem: 'https://upload.wikimedia.org/wikipedia/commons/thumb/4/43/Ponte_Pensil_-_S%C3%A3o_Vicente_1.jpg/960px-Ponte_Pensil_-_S%C3%A3o_Vicente_1.jpg',
    ),
    PontoTuristico(
      nome: 'Praia do Tombo',
      cidade: 'Guarujá',
      descricao: 'Praia conhecida pelas ondas e pela beleza natural.',
      imagem: 'https://imgmd.net/images/c_limit%2Cw_2400/v1/guia/5064406/praia-do-tombo.jpg',
    ),
    PontoTuristico(
      nome: 'Plataforma de Pesca',
      cidade: 'Mongaguá',
      descricao: 'Plataforma em formato de T que avança sobre o mar e atrai visitantes e pescadores.',
      imagem: 'https://ecrie.com.br/sistema/conteudos/imagem/m_55_0_1_01102025164621.jpg',
    ),
    PontoTuristico(
      nome: 'Forte São Jorge',
      cidade: 'Guarujá',
      descricao: 'Fortificação histórica da região da Barra Grande.',
      imagem: 'https://upload.wikimedia.org/wikipedia/commons/a/a6/Forte_de_S%C3%A3o_Jorge_de_Oitavos.jpg?utm_source=pt.wikipedia.org&utm_campaign=index&utm_content=original',
    ),
    PontoTuristico(
      nome: 'Cama de Anchieta',
      cidade: 'Itanhaém',
      descricao: 'Formação rochosa à beira-mar associada à história de José de Anchieta.',
      imagem: 'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/33/52/36/a7/e-um-passeio-rapido-leva.jpg?w=1000&h=1000&s=1',
    ),
    PontoTuristico(
      nome: 'Aquário Municipal',
      cidade: 'Santos',
      descricao: 'Aquário que apresenta diversas espécies de animais aquáticos.',
      imagem: 'https://upload.wikimedia.org/wikipedia/commons/5/5b/Aqu%C3%A1rio_Municipal_de_Santos_-_panoramio.jpg?utm_source=pt.wikipedia.org&utm_campaign=index&utm_content=original',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ryan Xavier Paz Corrêa Amaral'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(10),
        itemCount: pontos.length,
        itemBuilder: (context, index) {
          return montarCartao(pontos[index]);
        },
      ),
    );
  }

  Widget montarCartao(PontoTuristico ponto) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.black12),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.network(
              ponto.imagem,
              width: 150,
              height: 150,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  width: 150,
                  height: 150,
                  color: Colors.grey.shade200,
                  child: const Icon(Icons.image_not_supported),
                );
              },
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  ponto.nome,
                  style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 6),
                Row(
                  children: [
                    const Icon(Icons.location_on, size: 16, color: Colors.blue),
                    const SizedBox(width: 4),
                    Expanded(child: Text(ponto.cidade)),
                  ],
                ),
                const SizedBox(height: 6),
                Text(ponto.descricao),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

