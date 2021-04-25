import 'package:flutter/material.dart';

class FormScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return FormScreenState();
  }
}

class FormScreenState extends State<FormScreen> {
  String _email;
  String _password;
  String _name;
  String _lembaga;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Widget _buildEmail() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Email'),
      validator: (String value) {
        if (value.isEmpty) {
          return 'Email is Required';
        }

        if (!RegExp(
            r"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?")
            .hasMatch(value)) {
          return 'Please enter a valid email Address';
        }

        return null;
      },
      onSaved: (String value) {
        _email = value;
      },
    );
  }

  Widget _buildPassword() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Password'),
      keyboardType: TextInputType.visiblePassword,
      validator: (String value) {
        if (value.isEmpty) {
          return 'Password is Required';
        }
        return null;
      },
      onSaved: (String value) {
        _password = value;
      },
    );
  }

  Widget _buildName() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Nama Lengkap'),
      maxLength: 20,
      validator: (String value) {
        if (value.isEmpty) {
          return 'Name is Required';
        }

        return null;
      },
      onSaved: (String value) {
        _name = value;
      },
    );
  }


  Widget _buildLembaga() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Lembaga/Instansi'),
      maxLength: 20,
      validator: (String value) {
        if (value.isEmpty) {
          return 'Lembaga is Required';
        }

        return null;
      },
      onSaved: (String value) {
        _lembaga = value;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Registrasi"),
        centerTitle: true,),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(24),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                _buildEmail(),
                _buildPassword(),
                _buildName(),
                _buildLembaga(),
                SizedBox(height: 50),
                SizedBox(
                    width: 150,
                    height: 50,
                    child: RaisedButton(
                      child: Text(
                        'Register',
                        style: TextStyle(color: Colors.black45, fontSize: 16),
                      ),
                      onPressed: () {
                        if (!_formKey.currentState.validate()) {
                          return;
                        }
                        _formKey.currentState.save();
                        print(_email);
                        print(_password);
                        print(_name);
                        print(_lembaga);

                        //Send to API
                      },
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50.0),
                          side: BorderSide(color: Colors.black26,width: 2)
                      ),
                    )
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
