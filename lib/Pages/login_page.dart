import 'package:flutter/material.dart';
import 'package:tubes/theme.dart';
import 'package:tubes/Pages/registerpage.dart';
import 'package:tubes/Pages/home.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(color: normalWhite),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 10,
              ),
              Header(),
              SizedBox(
                child: Container(
                  decoration: BoxDecoration(
                    color: defBlue,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(60),
                      topRight: Radius.circular(60),
                    ),
                  ),
                  child: InputWrapper(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Header extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Center(
            child: SizedBox(
              width: 130, // Atur lebar gambar
              height: 300, // Atur tinggi gambar
              child: Image.asset("assets/img/Logo.png"),
            ),
          ),
        ],
      ),
    );
  }
}

class InputWrapper extends StatefulWidget {
  @override
  _InputWrapperState createState() => _InputWrapperState();
}

class _InputWrapperState extends State<InputWrapper> {
  String labelText = 'Email';

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                "Login",
                style: TextStyle(
                  color: normalWhite,
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.w600,
                  fontSize: 25,
                ),
              ),
              ButtonSwap(
                onTextChanged: (newText) {
                  setState(() {
                    labelText = newText;
                  });
                },
              ),
            ],
          ),
          SizedBox(height: 10),
          Container(
            decoration: BoxDecoration(color: defBlue),
            child: InputField(
              labelText: labelText,
            ),
          ),
          SizedBox(
            height: 30,
          ),
          ButtonLogin(),
          SizedBox(height: 20),
          Text(
            "Belum Punya Akun?",
            style: TextStyle(
              color: normalWhite,
              fontFamily: 'Montserrat',
              fontWeight: FontWeight.w700,
              fontSize: 12,
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.push(
                // Gunakan Navigator.push untuk merute ke halaman RegisterPage1
                context,
                MaterialPageRoute(builder: (context) => RegisterPage()),
              );
            },
            child: Text(
              "Daftar",
              style: TextStyle(
                color: normalWhite,
                fontFamily: 'Montserrat',
                fontSize: 12,
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.italic,
                decoration: TextDecoration.combine([
                  TextDecoration.underline,
                ]),
                decorationColor: Colors.white,
                decorationStyle: TextDecorationStyle.solid,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ButtonSwap extends StatefulWidget {
  final Function(String) onTextChanged;

  ButtonSwap({required this.onTextChanged});

  @override
  _ButtonSwapState createState() => _ButtonSwapState();
}

class _ButtonSwapState extends State<ButtonSwap> {
  String buttonText = 'Email'; // Default text

  void _toggleText() {
    setState(() {
      buttonText = (buttonText == 'Email') ? 'Telepon' : 'Email';
      widget.onTextChanged(buttonText);
    });
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        foregroundColor: basicYellow,
        backgroundColor: normalWhite,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
          side: BorderSide(color: basicYellow),
        ),
        minimumSize: Size(140, 25),
      ),
      onPressed: () {
        _toggleText(); // Ketika tombol ditekan, ubah teks
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            buttonText,
            style: TextStyle(
              color: basicYellow,
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
          Icon(
            Icons.rotate_left_sharp,
            color: basicYellow,
          ),
        ],
      ),
    );
  }
}

class ButtonLogin extends StatefulWidget {
  @override
  _ButtonLoginState createState() => _ButtonLoginState();
}

class _ButtonLoginState extends State<ButtonLogin> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        foregroundColor: defBlue,
        backgroundColor: normalWhite, // Warna latar belakang tombol
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(17),
          side: BorderSide(color: defBlue),
        ),
        minimumSize: Size(160, 34), // Ukuran minimum tombol
      ),
      onPressed: () {
        Navigator.of(context).push(MaterialPageRoute(builder: (context) {
          return Home();
        }));
      },
      child: Text(
        "Masuk",
        style: TextStyle(
          fontFamily: 'Montserrat',
          fontWeight: FontWeight.w600,
          fontSize: 24,
        ),
      ),
    );
  }
}

class InputField extends StatefulWidget {
  final String labelText;

  const InputField({Key? key, required this.labelText}) : super(key: key);

  @override
  _InputFieldState createState() => _InputFieldState();
}

class _InputFieldState extends State<InputField> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 5.0),
          child: Text(
            widget.labelText,
            style: TextStyle(
              color: normalWhite,
              fontFamily: 'Montserrat',
              fontWeight: FontWeight.w600,
              fontSize: 15,
            ),
          ),
        ),
        Container(
          decoration: BoxDecoration(
              border: Border(bottom: BorderSide(color: normalWhite))),
          child: TextField(
            style: TextStyle(color: normalWhite),
            decoration: InputDecoration(
              border: InputBorder.none,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 5.0),
          child: Text(
            "Password",
            style: TextStyle(
              color: normalWhite,
              fontFamily: 'Montserrat',
              fontWeight: FontWeight.w600,
              fontSize: 15,
            ),
          ),
        ),
        Container(
          decoration: BoxDecoration(
              border: Border(bottom: BorderSide(color: normalWhite))),
          child: TextField(
            obscureText: _obscureText,
            style: TextStyle(color: normalWhite),
            decoration: InputDecoration(
              border: InputBorder.none,
              suffixIcon: IconButton(
                icon: Icon(
                  _obscureText ? Icons.visibility : Icons.visibility_off,
                  color: normalWhite,
                ),
                onPressed: () {
                  setState(() {
                    _obscureText = !_obscureText;
                  });
                },
              ),
            ),
          ),
        ),
      ],
    );
  }
}
