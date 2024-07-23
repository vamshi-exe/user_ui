import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rbl_app/pages/utils/expiry_formatter.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  File? frontDocument;
  File? backDocument;

  Future<void> pickDocument(bool isFront) async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['jpg', 'jpeg', 'png', 'pdf'],
    );

    if (result != null && result.files.single.path != null) {
      setState(() {
        if (isFront) {
          frontDocument = File(result.files.single.path!);
        } else {
          backDocument = File(result.files.single.path!);
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: const Color.fromARGB(249, 255, 255, 255),
        body: SingleChildScrollView(
          // padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                height: 120,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 3, 56, 129),
                  border: const Border(top: BorderSide.none),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Align(
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        'RBL BANK CREDIT CARD',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 24),
                      ),
                    )),
              ),
              Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8),
                        boxShadow: const [
                          BoxShadow(
                              offset: Offset(0, 1),
                              color: Color.fromARGB(255, 210, 210, 210),
                              blurRadius: 0.3,
                              spreadRadius: 1)
                        ],
                      ),
                      width: double.infinity,
                      child: const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          'Hello, RBL Bank Customer\nComplete your card details in a few simple steps',
                          style: TextStyle(fontSize: 14.0),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20.0),
                    const Center(
                      child: Column(
                        children: [
                          // insert your logo
                          FlutterLogo(
                            size: 60,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            'Customer service: 02261156300 | Credit cards-cpl-c 0223232 2727',
                            textAlign: TextAlign.start,
                            style: TextStyle(
                                fontSize: 12,
                                color: Colors.black,
                                fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20.0),
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color: const Color.fromARGB(255, 3, 56, 129),
                          )),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Center(
                            child: Padding(
                              padding: EdgeInsets.all(4),
                              child: Text(
                                'RBL Credit Card',
                                style: TextStyle(
                                    fontSize: 24.0,
                                    fontWeight: FontWeight.bold,
                                    color: Color.fromARGB(255, 3, 56, 129)),
                              ),
                            ),
                          ),
                          const Divider(
                            color: Color.fromARGB(255, 3, 56, 129),
                            thickness: 2,
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'Card 16-Digit Number',
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black),
                                ),
                                TextFormField(
                                  enabled: true,
                                  keyboardType: TextInputType.number,
                                  inputFormatters: [
                                    CreditCardNumberInputFormatter(),
                                    LengthLimitingTextInputFormatter(19),
                                  ],
                                  decoration: const InputDecoration(
                                    border: InputBorder.none,
                                    prefixIconConstraints: BoxConstraints(
                                        minWidth: 23, maxHeight: 20),
                                    prefixIcon: Padding(
                                      padding: EdgeInsets.only(right: 20),
                                      child: Icon(
                                        Icons.credit_card,
                                      ),
                                    ),
                                    hintText: "XXXX-XXXX-XXXX-XXXX",
                                  ),
                                ),
                                Row(
                                  children: <Widget>[
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const Text(
                                            'Expiry Date',
                                            style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w400,
                                                color: Colors.black),
                                          ),
                                          TextFormField(
                                            keyboardType: TextInputType.number,
                                            inputFormatters: [
                                              DateInputFormatter(),
                                              LengthLimitingTextInputFormatter(
                                                  5),
                                            ],
                                            decoration: const InputDecoration(
                                              prefixIconConstraints:
                                                  BoxConstraints(
                                                      minWidth: 23,
                                                      maxHeight: 20),
                                              border: InputBorder.none,
                                              hintText: "00/00",
                                              prefixIcon: Padding(
                                                padding:
                                                    EdgeInsets.only(right: 20),
                                                child: Icon(
                                                  Icons.calendar_month,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    const SizedBox(width: 20.0),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const Text(
                                            'CVV',
                                            style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w500,
                                                color: Colors.black),
                                          ),
                                          TextFormField(
                                            keyboardType: TextInputType.number,
                                            obscureText: true,
                                            inputFormatters: [
                                              LengthLimitingTextInputFormatter(
                                                  3),
                                            ],
                                            decoration: const InputDecoration(
                                              prefixIconConstraints:
                                                  BoxConstraints(
                                                      minWidth: 23,
                                                      maxHeight: 20),
                                              hintText: "123",
                                              border: InputBorder.none,
                                              prefixIcon: Icon(Icons.lock),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          )
                        ],
                      ),
                    ),
                    const SizedBox(height: 20.0),
                    if (frontDocument != null)
                      Image.file(frontDocument!,
                          height: 200, fit: BoxFit.cover),
                    ElevatedButton(
                      onPressed: () => pickDocument(true),
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.black,
                        backgroundColor: Colors.grey[200],
                        minimumSize: const Size(double.infinity, 50),
                      ),
                      child: Text(frontDocument != null
                          ? "Re-Take"
                          : 'UPLOAD FRONT DOCUMENTS'),
                    ),
                    const SizedBox(height: 10.0),
                    if (backDocument != null)
                      Image.file(backDocument!, height: 200, fit: BoxFit.cover),
                    ElevatedButton(
                      onPressed: () => pickDocument(false),
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.black,
                        backgroundColor: Colors.grey[200],
                        minimumSize: const Size(double.infinity, 50),
                      ),
                      child: Text(backDocument != null
                          ? "Re-Take"
                          : 'UPLOAD BACK DOCUMENTS'),
                    ),
                    const SizedBox(height: 20.0),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.white,
                        backgroundColor: Colors.blue,
                        minimumSize: const Size(double.infinity, 50),
                      ),
                      child: const Text('SUBMIT'),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
