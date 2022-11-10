import 'package:app_uit/models/user_model.dart';
import 'package:flutter/material.dart';

import '../consts.dart';

class UserPage extends StatelessWidget {
  const UserPage({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    UserModel user = UserModel.teste();
    return Container(
      color: Colors.teal.shade300,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            width: 12.0,
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15.0),
            child: Text(
              'Configurações\nda Conta',
              style: defaultTextStyleTitlePage,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Expanded(
            child: Material(
              type: MaterialType.transparency,
              child: Container(
                width: size.width,
                decoration: const BoxDecoration(
                  color: Color(0xFFFAFAFA),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: SingleChildScrollView(
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Dados cadastrais',
                                style: defaultTextStyleSubtitle,
                                overflow: TextOverflow.ellipsis,
                              ),
                              _getcard(
                                'Nome:',
                                TextField(
                                  controller:
                                      TextEditingController(text: user.name),
                                  decoration: const InputDecoration(
                                      border: InputBorder.none),
                                ),
                              ),
                              Row(
                                children: [
                                  Expanded(
                                    child: _getcard(
                                      'CEP:',
                                      TextField(
                                        controller: TextEditingController(
                                            text: user.cep),
                                        decoration: const InputDecoration(
                                            border: InputBorder.none),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 30,
                                  ),
                                  Expanded(
                                    child: _getcard(
                                      'Bairro:',
                                      TextField(
                                        controller: TextEditingController(
                                            text: user.district),
                                        decoration: const InputDecoration(
                                            border: InputBorder.none),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Expanded(
                                    child: _getcard(
                                      'Rua:',
                                      TextField(
                                        controller: TextEditingController(
                                            text: user.street),
                                        decoration: const InputDecoration(
                                            border: InputBorder.none),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 30,
                                  ),
                                  SizedBox(
                                    width: 90,
                                    child: _getcard(
                                      'Número:',
                                      TextField(
                                        controller: TextEditingController(
                                            text: user.number),
                                        decoration: const InputDecoration(
                                            border: InputBorder.none),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Expanded(
                                    child: _getcard(
                                      'Cidade:',
                                      TextField(
                                        controller: TextEditingController(
                                            text: user.city),
                                        decoration: const InputDecoration(
                                            border: InputBorder.none),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 30,
                                  ),
                                  SizedBox(
                                    width: 70,
                                    child: _getcard(
                                      'UF:',
                                      TextField(
                                        controller: TextEditingController(
                                            text: user.uf),
                                        decoration: const InputDecoration(
                                            border: InputBorder.none),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              _getcard(
                                'Telefone:',
                                TextField(
                                  controller:
                                      TextEditingController(text: user.phone),
                                  decoration: const InputDecoration(
                                      border: InputBorder.none),
                                ),
                              ),
                              _getcard(
                                'E-mail:',
                                TextField(
                                  controller:
                                      TextEditingController(text: user.mail),
                                  decoration: const InputDecoration(
                                      border: InputBorder.none),
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 12),
                                child: Text(
                                  'Alterar Senha',
                                  style: defaultTextStyleSubtitle,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              _getcard(
                                'Senha atual:',
                                const TextField(
                                  obscureText: true,
                                  decoration:
                                      InputDecoration(border: InputBorder.none),
                                ),
                              ),
                              _getcard(
                                'Nova senha:',
                                const TextField(
                                  obscureText: true,
                                  decoration:
                                      InputDecoration(border: InputBorder.none),
                                ),
                              ),
                              _getcard(
                                'Confirmar nova senha:',
                                const TextField(
                                  obscureText: true,
                                  decoration:
                                      InputDecoration(border: InputBorder.none),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 15.0, bottom: 25),
                      child: SizedBox(
                        height: 55,
                        width: size.width,
                        child: ElevatedButton(
                          style: ButtonStyle(
                              shape: MaterialStateProperty.all<
                                  RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15),
                                ),
                              ),
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  Colors.teal.shade300)),
                          onPressed: () {},
                          child: const Text(
                            'Salvar',
                            style: TextStyle(color: Colors.white, fontSize: 18),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _getcard(String label, Widget child) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: Text(
              label,
              style: defaultTextlabelBoldStyle,
            ),
          ),
          Container(
            padding: const EdgeInsets.only(left: 5, right: 10),
            height: 50,
            decoration: BoxDecoration(
                color: const Color(0xFFFAFAFA),
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.teal)),
            child: Center(child: child),
          ),
        ],
      );
}
