import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../widgets/custom_text_form_field.dart';

class AddProductPage extends StatefulWidget {
  const AddProductPage({super.key});

  @override
  State<AddProductPage> createState() => _AddProductPageState();
}

class _AddProductPageState extends State<AddProductPage> {

  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _categoryController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  Future<void> _addProduct() async {
    final url = Uri.parse('https://fakestoreapi.com/products');

    final Map<String, dynamic> productData = {
      'title': _titleController.text,
      'price': double.parse(_priceController.text),
      'description': _descController.text,
      'category': _categoryController.text,
      'image': "assets/images/shopping.svg",
    };


    try {
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(productData),
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        // نجاح الإضافة
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Product added successfully!')),
        );
      } else {
        // خطأ في الطلب
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to add product.')),
        );
      }
    } catch (error) {
      // خطأ في الاتصال
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error occurred: $error')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        width: size.width,
        height: size.height,
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              CustomTextFormField(textController: _categoryController, textInputType: TextInputType.text,hintText: "category",),
              const SizedBox(height: 20,),
              CustomTextFormField(textController: _titleController, textInputType: TextInputType.text,hintText: "title",),
              const SizedBox(height: 20,),
              CustomTextFormField(textController: _descController, textInputType: TextInputType.text,hintText: "discrption",),
              const SizedBox(height: 20,),
              CustomTextFormField(textController: _priceController, textInputType: TextInputType.text,hintText: "price",),
              const SizedBox(height: 20,),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    _addProduct(); // استدعاء وظيفة الإضافة
                  }
                },
                child: Text('Add Product'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
