import 'package:flutter/material.dart';

void main() {}

class CurrencyConverterMateriaPage extends StatelessWidget {
  const CurrencyConverterMateriaPage({super.key});


  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        title: const Text('Currency Converter'),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      backgroundColor: Color.fromARGB(255, 30, 186, 37),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              color: Colors.amber,
              padding: EdgeInsets.all(20),

              child: Text(
                '0',
                style: TextStyle(
                  fontSize: 50,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                ),
              ),
            ),
            const Text(
              'Convert your currencies easily!',
              style: TextStyle(fontSize: 16, color: Colors.black),
            ),
            const Padding(
              padding: EdgeInsets.all(20),
              child: TextField(
                style: TextStyle(color: Colors.red),
                decoration: InputDecoration(
                  // label: Text("Please enter the amount to convert"),
                  // labelStyle: TextStyle(color: Colors.white, textBaseline: TextBaseline.alphabetic),
                  // helperText: "e.g. 100",
                  // helperStyle: TextStyle(color: Colors.white, fontSize: 12),
                  hintText: "Enter amount",
                  hintStyle: TextStyle(color: Colors.white, fontSize: 16),
                  // prefixText: '\$',
                  // prefixStyle: TextStyle(color: Colors.white, fontSize: 16),
                  // suffixIcon: Icon(Icons.arrow_forward, color: Colors.white), // this will make the icon be at the right
                  prefixIcon: Icon(Icons.money, color: Colors.white),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    borderSide: BorderSide(color: Colors.white, width: 2),
                  ),
                  focusedBorder: OutlineInputBorder(),
                  enabledBorder: UnderlineInputBorder(),
                ),
                keyboardType: TextInputType.numberWithOptions(
                  decimal: true,
                  signed: true,
                ),
              ),

              // button
              // button like a text or elevation button
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextButton(
                onPressed: () => debugPrint('Button clicked!'),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(Colors.blue),
                  minimumSize: MaterialStateProperty.all<Size>(Size(double.infinity, 50)),
                  foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                      side: BorderSide(color: Colors.white, width: 2),
                    ),
                  ),
                ),
              
                child: const Text('Convert'),
              ),
              // child: ElevatedButton(
              //   elevation: 15,
              //   onPressed: () => debugPrint('Button clicked!'),
              //   style: ButtonStyle(
              //     backgroundColor: MaterialStateProperty.all<Color>(Colors.blue),
              //     minimumSize: MaterialStateProperty.all<Size>(Size(double.infinity, 50)),
              //     foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
              //     shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              //       RoundedRectangleBorder(
              //         borderRadius: BorderRadius.circular(10),
              //         side: BorderSide(color: Colors.white, width: 2),
              //       ),
              //     ),
              //   ),
              
              //   child: const Text('Convert'),
              // ),
            ),
          ],
        ),
      ),
    );
  }
}
