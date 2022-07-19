import 'dart:convert';

class ViaCepModel {
  final String cep;
  final String logradouro;
  final String complemento;
  final String bairro;
  final String localidade;
  final String uf;
  final String ibge;
  final String gia;
  final String ddd;
  final String siafi;

  ViaCepModel({
    required this.cep,
    required this.logradouro,
    required this.complemento,
    required this.bairro,
    required this.localidade,
    required this.uf,
    required this.ibge,
    required this.gia,
    required this.ddd,
    required this.siafi,
  });

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'cep': cep});
    result.addAll({'logradouro': logradouro});
    result.addAll({'complemento': complemento});
    result.addAll({'bairro': bairro});
    result.addAll({'localidade': localidade});
    result.addAll({'uf': uf});
    result.addAll({'ibge': ibge});
    result.addAll({'gia': gia});
    result.addAll({'ddd': ddd});
    result.addAll({'siafi': siafi});

    return result;
  }

  factory ViaCepModel.fromMap(Map<String, dynamic> map) {
    return ViaCepModel(
      cep: map['cep'] ?? '',
      logradouro: map['logradouro'] ?? '',
      complemento: map['complemento'] ?? '',
      bairro: map['bairro'] ?? '',
      localidade: map['localidade'] ?? '',
      uf: map['uf'] ?? '',
      ibge: map['ibge'] ?? '',
      gia: map['gia'] ?? '',
      ddd: map['ddd'],
      siafi: map['siafi'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());
  factory ViaCepModel.fromJson(String source) =>
      ViaCepModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'ViaCepModel(cep: $cep, logradouro: $logradouro, complemento: $complemento, bairro: $bairro, localidade: $localidade, uf: $uf, ibge: $ibge, gia: $gia, ddd: $ddd, siafi: $siafi)';
  }
}
