import 'package:get/get.dart';

import '../models/api_response_model.dart';
import '../models/viacep_model.dart';

class ViaCepRepository {
  final GetConnect connect = Get.find();

  Future<ApiResponseModel<ViaCepModel?>> searchCep(String cep) async {
    final response = await connect.get('/$cep/json/');

    

    return ApiResponseModel(
      isSuccess: response.isOk,
      data: response.isOk ? ViaCepModel.fromMap(response.body) : null,
      message: response.statusText,
    );
  }

  Future<ApiResponseModel<ViaCepModel?>> searchDefaultCep() async {
    final response = await connect.get('/58540000/json/');



    return ApiResponseModel(
      isSuccess: response.isOk,
      data: response.isOk ? ViaCepModel.fromMap(response.body) : null,
      message: response.statusText,
    );
  }
}
