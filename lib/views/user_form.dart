import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:usuarios/models/users.dart';
import 'package:usuarios/provider/users_provider.dart';

class UserForm extends StatefulWidget {
  const UserForm({Key? key}) : super(key: key);

  @override
  State<UserForm> createState() => _UserFormState();
}

class _UserFormState extends State<UserForm> {
  final _key = GlobalKey<FormState>();
  final Map<String, String> _formData = {};

  @override
  Widget build(BuildContext context) {
    final user = ModalRoute.of(context)!.settings.arguments as User;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Formulários'),
        actions: [
          IconButton(
            onPressed: () {
              final user = ModalRoute.of(context)!.settings.arguments as User;

              // _loadFormData();

              final isValid = _key.currentState!.validate();

              if (isValid) {
                _key.currentState!.save();

                Provider.of<UsersProvider>(context, listen: false).put(
                  User(
                    id: user.id,
                    name: _formData['name']!,
                    email: _formData['email']!,
                    urlAvatar: _formData['urlAvatar']!,
                  ),
                );

                Navigator.of(context).pop();
              }
            },
            icon: const Icon(Icons.save),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Form(
          key: _key,
          child: Column(
            children: [
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Nome',
                ),
                validator: (value) {
                  if (value!.trim().isEmpty) {
                    return 'Digite o nome';
                  }

                  if (value.trim().length < 3) {
                    return 'O nome deve conter no mínimo 3 caracteres';
                  }
                  return null;
                },
                onSaved: (value) => _formData['name'] = value!,
                onChanged: (value) => _formData['name'] = value,
                initialValue: user.name,
              ),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'E-mail',
                ),
                validator: (value) {
                  if (value!.trim().isEmpty) {
                    return 'Informe o e-mail';
                  }

                  if (!value.trim().contains('@')) {
                    return 'E-mail inválido';
                  }

                  return null;
                },
                onSaved: (value) => _formData['email'] = value!,
                onChanged: (value) => _formData['email'] = value,
                initialValue: user.email,
              ),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'URL do avatar',
                ),
                onSaved: (value) => _formData['urlAvatar'] = value!,
                onChanged: (value) => _formData['urlAvatar'] = value,
                initialValue: user.urlAvatar,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
