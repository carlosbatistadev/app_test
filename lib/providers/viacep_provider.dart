import 'dart:io';

import 'package:app_test/repositories/viacep_repository.dart';

import '../models/api_response_model.dart';
import '../models/viacep_model.dart';

class ViaCepProvider {
  final _repository = ViaCepRepository();

  Future<ApiResponseModel<ViaCepModel?>> searchCep(String cep) async {
    try {
      final response = await _repository.searchCep(cep);
      return ApiResponseModel.fromMap(response.toMap());
    } on SocketException {
      return ApiResponseModel(
        isSuccess: false,
        message: 'Problema de conexão com a internet',
      );
    } catch (e) {
      return ApiResponseModel(
        isSuccess: false,
        message: 'Ocorrreu um erro desconhecido: $e',
      );
    }
  }

  Future<ApiResponseModel<ViaCepModel?>> searchDefaultCep() async {
    try {
      final response = await _repository.searchDefaultCep();
      return ApiResponseModel.fromMap(response.toMap());
    } on SocketException {
      return ApiResponseModel(
        isSuccess: false,
        message: 'Problema de conexão com a internet',
      );
    } catch (e) {
      return ApiResponseModel(
        isSuccess: false,
        message: 'Ocorrreu um erro desconhecido: $e',
      );
    }
  }
}
