import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:login_dataproduk/listpage.dart';

void main() {
  runApp(new MaterialApp(
    home: new Halsatu(),
    title: "Data produk",
    routes: <String, WidgetBuilder>{
      '/HalSatu': (BuildContext context) => new Halsatu(),
      '/HalDua': (BuildContext context) => new HalDua(),
    },
    theme: ThemeData(
      primarySwatch: Colors.blue,
      visualDensity: VisualDensity.adaptivePlatformDensity,
    ),
  ));
}

// Halaman login
class Halsatu extends StatefulWidget {
  @override
  _HalsatuState createState() => _HalsatuState();
}

class _HalsatuState extends State<Halsatu> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  bool _isPasswordVisible = false;
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login Page'),
      ),
      body: Container(
        padding: EdgeInsets.all(30.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              backgroundColor: Color.fromARGB(255, 139, 200, 246),
              radius: 60.0,
              child: Icon(
                Icons.person,
                size: 100.0,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 20.0),
            TextFormField(
              controller: nameController,
              decoration: InputDecoration(
                labelText: 'Nama',
                prefixIcon: Icon(Icons.person),
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
            ),
            SizedBox(height: 20.0),
            TextFormField(
              controller: passwordController,
              decoration: InputDecoration(
                labelText: 'Password',
                prefixIcon: Icon(Icons.lock),
                suffixIcon: IconButton(
                  icon: Icon(
                    _isPasswordVisible
                        ? Icons.visibility_off
                        : Icons.visibility,
                  ),
                  onPressed: () {
                    setState(() {
                      _isPasswordVisible = !_isPasswordVisible;
                    });
                  },
                ),
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
              obscureText: !_isPasswordVisible,
            ),
            SizedBox(height: 30.0),
            ElevatedButton(
              onPressed: () {
                // Implement login logic here
                String name = nameController.text;
                String password = passwordController.text;
                if (name == "Rifda" && password == "Rifda123") {
                  setState(() {
                    _isLoading = true; // Show loading screen
                  });
                  Future.delayed(Duration(seconds: 2), () {
                    // Simulate loading delay
                    Navigator.pushNamed(context, '/HalDua');
                  });
                } else {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: Text('Login Gagal'),
                        content: Text('Nama atau password salah'),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: Text('OK'),
                          ),
                        ],
                      );
                    },
                  );
                }
              },
              child: _isLoading
                  ? CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(
                          Colors.white), // Set color to white
                    )
                  : Text(
                      'Login',
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
              style: ElevatedButton.styleFrom(
                primary: Colors.blue,
                padding: EdgeInsets.symmetric(
                  vertical: 12.0,
                  horizontal: 24.0,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
