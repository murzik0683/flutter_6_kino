import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(primarySwatch: Colors.blue),
    home: Scaffold(
        appBar: AppBar(
            title: const Text('Проверка возраста для кино'),
            centerTitle: true,
            titleTextStyle: const TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: Colors.white)),
        body: const MyForm())));

class MyForm extends StatefulWidget {
  const MyForm({Key? key}) : super(key: key);

  @override
  State createState() => MyFormState();
}

class MyFormState extends State {
  final _formKey = GlobalKey<FormState>();
  int _age = 0;
  final myController = TextEditingController();
  var _text = '';

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Container(
        padding: const EdgeInsets.all(20),
        child: Center(
          child: Column(
            children: [
              const Text(
                'Ваш возраст',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              TextFormField(
                  controller: myController,
                  textAlign: TextAlign.center,
                  decoration: const InputDecoration(
                      hintText: 'Введите ваш возраст',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20)))),
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Пожалуйста введите ваш возраст';
                    }
                    return null;
                  }),
              const SizedBox(height: 10),
              TextButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.blue)),
                  child: const Text(
                    'Проверить',
                    style: TextStyle(color: Colors.black),
                  ),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      setState(() {
                        _age = int.parse(myController.text);
                        //myController.clear();
                        String text;
                        if (_age <= 16) {
                          text = "Лучше посмотри мультики";
                        } else if (_age >= 18) {
                          text = "Вам можно на этот фильм";
                        } else {
                          text = "Можно в сопровождении взрослых";
                        }
                        _text = text;
                        // Scaffold.of(context).showSnackBar(SnackBar(
                        //   content: Text(
                        //     text,
                        //     style: TextStyle(fontSize: 20),
                        //   ),
                        //   backgroundColor: Colors.blue,
                        // ));
                      });
                    }
                  }),
              const SizedBox(height: 10),
              Text(
                _text,
                style: const TextStyle(
                    fontStyle: FontStyle.italic,
                    //backgroundColor: Colors.blue,
                    color: Colors.redAccent,
                    fontSize: 25,
                    fontWeight: FontWeight.bold),
              )
            ],
          ),
        ),
      ),
    );
  }
}
