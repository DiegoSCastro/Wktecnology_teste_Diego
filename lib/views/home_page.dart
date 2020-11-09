import 'package:avaliacao_wk_tecnology_crud/provider/user_provider.dart';
import 'package:avaliacao_wk_tecnology_crud/routes.dart';
import 'package:avaliacao_wk_tecnology_crud/widgets/user_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    Provider.of<UserProvider>(context, listen: false).loadData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final UserProvider users = Provider.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Sistema CRUD'),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              Navigator.of(context).pushNamed(Routes.REGISTE_PAGE);
            },
          )
        ],
      ),
      body: ListView.builder(
        itemCount: users.count,
        itemBuilder: (context, index) {
          return UserCard(users.byIndex(index));
        },
      ),
    );
  }
}
