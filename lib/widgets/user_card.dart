import 'package:avaliacao_wk_tecnology_crud/models/user.dart';
import 'package:avaliacao_wk_tecnology_crud/provider/user_provider.dart';
import 'package:avaliacao_wk_tecnology_crud/routes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UserCard extends StatelessWidget {
  final User user;
  UserCard(this.user);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(
        children: [
          Container(
            height: 80,
            width: 80,
            child: Icon(
              Icons.person,
              size: 70,
            ),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Nome do Usuário: ${user.name}'),
                Text('Profissão: ${user.occupation}'),
                Text('Telefone: ${user.phoneNumber}'),
                Text('E-mail: ${user.email}'),
              ],
            ),
          ),
          IconButton(
            icon: Icon(
              Icons.edit,
              color: Colors.blue,
            ),
            onPressed: () {
              Navigator.of(context).pushNamed(
                Routes.UPDATE_PAGE,
                arguments: user,
              );
            },
          ),
          IconButton(
            icon: Icon(
              Icons.delete,
              color: Colors.redAccent,
            ),
            onPressed: () {
              showDialog(
                context: context,
                builder: (contex) => AlertDialog(
                  title: Text('Remover Usuário'),
                  content: Text('Tem certeza que deseja excluir este usuário?'),
                  actions: [
                    FlatButton(
                      onPressed: Navigator.of(context).pop,
                      child: Text('Não'),
                    ),
                    FlatButton(
                      onPressed: () {
                        Provider.of<UserProvider>(
                          context,
                          listen: false,
                        ).remove(user);

                        Navigator.of(context).pop();
                      },
                      child: Text('Sim'),
                    ),
                  ],
                ),
              );
            },
          )
        ],
      ),
    );
  }
}
