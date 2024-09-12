import 'package:flutter/material.dart';

import '../type/Post.dart';

class AddPostScreen extends StatefulWidget {
  const AddPostScreen({super.key});

  @override
  _AddPostScreenState createState() => _AddPostScreenState();
}

class _AddPostScreenState extends State<AddPostScreen> {
  final _formKey = GlobalKey<FormState>();
  final _imageUrlController = TextEditingController();
  final _authorController = TextEditingController();
  final _countryOfOriginController = TextEditingController();
  final _tasteController = TextEditingController();
  final _aromaController = TextEditingController();
  final _locationController = TextEditingController();
  final _commentController = TextEditingController();

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      final newPost = Post(
        id: DateTime.now().toString(),
        imageUrl: _imageUrlController.text,
        author: _authorController.text,
        countryOfOrigin: _countryOfOriginController.text,
        taste: _tasteController.text,
        aroma: _aromaController.text,
        location: _locationController.text,
        comment: _commentController.text,
        timestamp: DateTime.now(),
      );

      // ここで新しい投稿を保存する処理を追加
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.secondary,
      appBar: AppBar(
        title: Text(
          '新規投稿',
          style: TextStyle(color: Theme.of(context).colorScheme.secondary),
        ),
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                controller: _imageUrlController,
                decoration: const InputDecoration(labelText: '画像URL'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return '画像URLを入力してください';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _authorController,
                decoration: const InputDecoration(labelText: '投稿者'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return '投稿者を入力してください';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _countryOfOriginController,
                decoration: const InputDecoration(labelText: '原産国'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return '原産国を入力してください';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _tasteController,
                decoration: const InputDecoration(labelText: 'Taste'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Tasteを入力してください';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _aromaController,
                decoration: const InputDecoration(labelText: 'Aroma'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Aromaを入力してください';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _locationController,
                decoration: const InputDecoration(labelText: '場所'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return '場所を入力してください';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _commentController,
                decoration: const InputDecoration(labelText: '感想'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return '感想を入力してください';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: _submitForm,
                child: const Text('投稿'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
