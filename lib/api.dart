import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';

class Api {
  static BaseOptions options = new BaseOptions(
    baseUrl: "http://solutionapp.ddns.net:9000/",
    connectTimeout: 10000,
  );

  Dio _dio = Dio(options);

  Dio get request => _dio;

  funcionarios() async {
    return await request.get('/');
  }

  funcionario(int id) async {
    var response = await request.get('/read.php', queryParameters: {'id': id});

    return jsonDecode(response.data);
  }

  setFuncionario(nome, matricula, senha) async {
    var response = await request.post('/create.php', data: {
      "nome": nome,
      'matricula': matricula,
      'senha': senha,
      'ativo': 1
    }).catchError((error) => print(error.toString()));

    if (response != null) print('insert ' + response.data.toString());
  }

  updateFuncionario(id, nome, matricula, senha, ativo) async {
    var response = await request.post('/update.php', data: {
      "id": id,
      "nome": nome,
      'matricula': matricula,
      'senha': senha,
      'ativo': ativo
    }).catchError((error) => print(error.toString()));

    if (response != null) print('update ' + response.data.toString());
  }

  deleteFuncionario(id) async {
    var response =
        await request.get('/delete.php', queryParameters: {'id': id});

    print('delete ' + response.data);
    return jsonDecode(response.data);
  }

  usuario(email, senha) async {
    var response = await request
        .get('/user.php', queryParameters: {'email': email, 'senha': senha});

    return jsonDecode(response.data);
  }
}
