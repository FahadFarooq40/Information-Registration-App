// ignore_for_file: unnecessary_cast

import 'package:flutter/material.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({Key? key}) : super(key: key);

  @override
  _ProfileViewState createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _fatherController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();

  String? genderValue;
  List<String> genderList = ["Male", "Female"];

  String? countryValue;
  List<String> countryList = [
    "Afghanistan",
    "Albania",
    "Andorra",
    "Algeria",
    "Pakistan",
    "Armenia",
    "Bahamas",
    "India"
  ];

  String? _validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter an email';
    }
    RegExp emailRegExp = RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");

    if (!emailRegExp.hasMatch(value)) {
      return 'Please enter a valid email';
    }
    return null;
  }

  String? _validatePhone(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter a Phone Number';
    }
    if (value.length != 11) {
      return 'Please enter a valid Phone Number';
    }
    return null;
  }

  void _submitForm() {
    if (_formKey.currentState!.validate() &&
        genderValue != null &&
        countryValue != null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Form Submitted Successfully")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("INFORMATION REGISTRATION APP"),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 17, 56, 18),
        leading: const Icon(Icons.menu),
        actions: [
          IconButton(onPressed: () => {}, icon: const Icon(Icons.search)),
          IconButton(onPressed: () => {}, icon: const Icon(Icons.more_vert)),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "REGISTRATION FORM ",
                  style: TextStyle(
                    color: Color.fromARGB(255, 13, 214, 20),
                    height: 3,
                    fontFamily: "Helvetica",
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextFormField(
                  controller: _userNameController,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.person),
                    labelText: 'Enter Your Username',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.2),
                    ),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Please enter a username";
                    } else {
                      return null;
                    }
                  },
                ),
                const SizedBox(height: 16.0),
                TextFormField(
                  controller: _fatherController,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.person),
                    labelText: 'Enter Your Father Name',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.2),
                    ),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Please enter a Father Name";
                    } else {
                      return null;
                    }
                  },
                ),
                const SizedBox(height: 16.0),
                TextFormField(
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.email),
                    labelText: 'Enter Your Email',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.2),
                    ),
                  ),
                  validator: _validateEmail,
                ),
                const SizedBox(height: 16.0),
                TextFormField(
                  controller: _phoneController,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.phone),
                    labelText: 'Enter Your Phone Number',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.2),
                    ),
                  ),
                  validator: _validatePhone,
                ),
                const SizedBox(height: 16.0),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: const Color.fromARGB(137, 41, 38, 38),
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(20.2),
                    ),
                    child: DropdownButton(
                      icon: const Icon(Icons.keyboard_arrow_down),
                      hint: const Text("Select Your Gender"),
                      focusColor: Colors.black12,
                      iconSize: 36,
                      isExpanded: true,
                      underline: const SizedBox(),
                      value: genderValue,
                      style: const TextStyle(
                        color: Color.fromARGB(255, 0, 0, 0),
                      ),
                      onChanged: (newValue) {
                        setState(() {
                          genderValue = newValue as String?;
                        });
                      },
                      items: genderList.map((valueItem) {
                        return DropdownMenuItem(
                          value: valueItem,
                          child: Text(valueItem),
                        );
                      }).toList(),
                    ),
                  ),
                ),
                if (genderValue != null)
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("Selected Gender: $genderValue"),
                  ),
                const SizedBox(height: 16.0),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: const Color.fromARGB(137, 41, 38, 38),
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(20.2),
                    ),
                    child: DropdownButton(
                      icon: const Icon(Icons.keyboard_arrow_down),
                      hint: const Text("Select Your Country"),
                      focusColor: Colors.black12,
                      iconSize: 36,
                      isExpanded: true,
                      underline: const SizedBox(),
                      value: countryValue,
                      style: const TextStyle(
                        color: Color.fromARGB(255, 0, 0, 0),
                      ),
                      onChanged: (newValue) {
                        setState(() {
                          countryValue = newValue as String?;
                        });
                      },
                      items: countryList.map((valueItem) {
                        return DropdownMenuItem(
                          value: valueItem,
                          child: Text(valueItem),
                        );
                      }).toList(),
                    ),
                  ),
                ),
                if (countryValue != null)
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("Selected Country: $countryValue"),
                  ),
                const SizedBox(height: 16.0),
                SizedBox(
                  height: 50,
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: _submitForm,
                    child: const Text("Submit Information"),
                  ),
                ),
                Text(
                  "UserName: ${_userNameController.text}",
                  style: const TextStyle(
                    fontSize: 18,
                    fontFamily: "Montserrat",
                    color: Colors.black,
                  ),
                ),
                Text(
                  "Father: ${_fatherController.text}",
                  style: const TextStyle(
                    fontSize: 18,
                    fontFamily: "Montserrat",
                    color: Colors.black,
                  ),
                ),
                Text(
                  "Email: ${_emailController.text}",
                  style: const TextStyle(
                    fontSize: 18,
                    fontFamily: "Montserrat",
                    color: Colors.black,
                  ),
                ),
                Text(
                  "PhoneNumber: ${_phoneController.text}",
                  style: const TextStyle(
                    fontSize: 18,
                    fontFamily: "Montserrat",
                    color: Colors.black,
                  ),
                ),
                Text(
                  "Gender: $genderValue",
                  style: const TextStyle(
                    fontSize: 18,
                    fontFamily: "Montserrat",
                    color: Colors.black,
                  ),
                ),
                Text(
                  "Country: $countryValue",
                  style: const TextStyle(
                    fontSize: 18,
                    fontFamily: "Montserrat",
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
