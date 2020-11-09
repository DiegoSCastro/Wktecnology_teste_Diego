import 'package:avaliacao_wk_tecnology_crud/models/user.dart';
import 'package:avaliacao_wk_tecnology_crud/provider/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _form = GlobalKey<FormState>();

  final Map<String, String> formData = {};

  void loadFormData(User user) {
    if (user != null) {
      formData['id'] = user.id;
      formData['name'] = user.name;
      formData['phoneNumber'] = user.phoneNumber;
      formData['email'] = user.email;
      formData['occupation'] = user.occupation;
      formData['imageUrl'] = user.imageUrl;
    }
    return;
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final User user = ModalRoute.of(context).settings.arguments;
    loadFormData(user);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Formulário de Usuário'),
        actions: [
          IconButton(
            icon: Icon(Icons.save),
            onPressed: () {
              final isValid = _form.currentState.validate();

              if (isValid) {
                _form.currentState.save();
                var user = User(
                  id: formData['id'],
                  name: formData['name'],
                  phoneNumber: formData['phoneNumber'],
                  email: formData['email'],
                  occupation: formData['occupation'],
                  imageUrl: formData['imageUrl'],
                );

                Provider.of<UserProvider>(context, listen: false).addUser(
                  user,
                );
                Provider.of<UserProvider>(context, listen: false).loadData();
                Navigator.of(context).pop();
              }
            },
          )
        ],
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: Form(
          key: _form,
          child: SingleChildScrollView(
            child: Column(
              children: [
                TextFormField(
                  initialValue: formData['name'],
                  decoration: InputDecoration(labelText: 'Nome'),
                  onSaved: (value) => formData['name'] = value,
                  validator: (value) {
                    if (value.trim().length < 3) {
                      return 'O nome deve ter pelo menos 3 caracteres';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  initialValue: formData['phoneNumber'],
                  decoration: InputDecoration(labelText: 'Telefone'),
                  onSaved: (value) => formData['phoneNumber'] = value,
                ),
                TextFormField(
                  initialValue: formData['email'],
                  decoration: InputDecoration(labelText: 'e-mail'),
                  onSaved: (value) => formData['email'] = value,
                ),
                TextFormField(
                  initialValue: formData['occupation'],
                  decoration: InputDecoration(labelText: 'Profissão'),
                  onSaved: (value) => formData['occupation'] = value,
                ),
                TextFormField(
                  initialValue: formData['imageUrl'],
                  decoration: InputDecoration(labelText: 'Url da Imagem'),
                  onSaved: (value) => formData['imageUrl'] = value,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
