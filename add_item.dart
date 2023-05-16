import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../components/custom_surfix_icon.dart';
import '../components/default_button.dart';
import '../components/form_error.dart';
import '../constants.dart';
import '../size_config.dart';

class AddItem extends StatefulWidget {
  const AddItem({Key? key}) : super(key: key);

  @override
  State<AddItem> createState() => _AddItemState();
}

class _AddItemState extends State<AddItem> {




/*  final _formKey = GlobalKey<FormState>();
  final List<String?> errors = [];
  String? Restaurant_Name;
  String? Menu;
  String? Menu1;
  String? Menu2;
  String? Menu3;
  String? Menu4;

  getRestaurant_Name(restaurant) {
    Restaurant_Name = restaurant;
  }
  getMenu(dish) {
    Menu = dish;
  }
  getMenu1(dish1) {
    Menu1 = dish1;
  }
  getMenu2(dish2) {
    Menu2 = dish2;
  }
  getMenu3(dish3) {
    Menu3 = dish3;
  }
  getMenu4(dish4) {
    Menu4 = dish4;
  }


  createData() {
    DocumentReference documentReference =
    FirebaseFirestore.instance.collection('hotels list').doc(Restaurant_Name);
    //create map
    Map<String, dynamic> users = {
      "Restaurant": Restaurant_Name,
      "menu": Menu,
      "menu1": Menu1,
      "menu2": Menu2,
      "menu3": Menu3,
      "menu4": Menu4,
    };
    documentReference
        .set(users)
        .whenComplete(() => {print("$Restaurant_Name Created")});
  }

  get kNameNullError => null;

  void addError({String? error}) {
    if (!errors.contains(error))
      setState(() {
        errors.add(error);
      });
  }

  void removeError({String? error}) {
    if (errors.contains(error))
      setState(() {
        errors.remove(error);
      });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          buildRestaurantFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildMenuFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildMenu1FormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildMenu2FormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildMenu3FormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildMenu4FormField(),
          FormError(errors: errors),
          SizedBox(height: getProportionateScreenHeight(40)),
          DefaultButton(
            text: "Add Details",
            press: () {
              if (_formKey.currentState!.validate()) {
                createData();
                Navigator.pushNamed(context, OtpScreen.routeName);
              }
            },
          ),
        ],
      ),
    );
  }

  TextFormField buildMenu4FormField() {
    return TextFormField(
      onSaved: (newValue) => Menu4 = newValue,
      onChanged: (value) {
        getMenu4(Menu4);
        if (value.isNotEmpty) {
          removeError(error: kAddressNullError);
        }
        Menu4 = value;
      },
      validator: (value) {
        if (value!.isEmpty) {
          addError(error: kAddressNullError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "Dish",
        hintText: "Enter your Dish",
        // If  you are using latest version of flutter then label text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon:
        CustomSurffixIcon(svgIcon: "assets/icons/Location point.svg"),
      ),
    );
  }

  TextFormField buildMenu3FormField() {
    return TextFormField(
      keyboardType: TextInputType.phone,
      onSaved: (newValue) => Menu3 = newValue,
      onChanged: (value) {
        getMenu3(Menu3);
        if (value.isNotEmpty) {
          removeError(error: kPhoneNumberNullError);
        }
        Menu3 = value;
      },
      validator: (value) {
        if (value!.isEmpty) {
          addError(error: kPhoneNumberNullError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "Dish",
        hintText: "Enter your Dish",
        // If  you are using latest version of flutter then label text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Phone.svg"),
      ),
    );
  }

  TextFormField buildMenu2FormField() {
    return TextFormField(
      onSaved: (newValue) => Menu2 = newValue,
      onChanged: (String last) {
        getMenu2(last);
      },
      decoration: InputDecoration(
        labelText: "Dish",
        hintText: "Enter your Dish",
        // If  you are using latest version of flutter then label text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/User.svg"),
      ),
    );
  }

  TextFormField buildMenu1FormField() {
    return TextFormField(
      onSaved: (newValue) => Menu1 = newValue,
      onChanged: (value) {
        getMenu1(Menu1);
        if (value.isNotEmpty) {
          removeError(error: kNameNullError);
        }
        Menu1 = value;
      },
      validator: (value) {
        if (value!.isEmpty) {
          addError(error: kNameNullError);
          return "";
        }

        return null;
      },
      decoration: InputDecoration(
        labelText: "Dish",
        hintText: "Enter your Dish",
        // If  you are using latest version of flutter then label text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/User.svg"),
      ),
    );
  }

  TextFormField buildMenuFormField() {
    return TextFormField(
      onSaved: (newValue) => Menu = newValue,
      onChanged: (value) {
        getMenu(Menu);
        if (value.isNotEmpty) {
          removeError(error: kNameNullError);
        }
        Menu = value;
      },
      validator: (value) {
        if (value!.isEmpty) {
          addError(error: kNameNullError);
          return "";
        }

        return null;
      },
      decoration: InputDecoration(
        labelText: "Dish",
        hintText: "Enter your Dish",
        // If  you are using latest version of flutter then label text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/User.svg"),
      ),
    );
  }

  TextFormField buildRestaurantFormField() {
      return TextFormField(
        onSaved: (newValue) => Restaurant_Name = newValue,
        onChanged: (value) {
          getRestaurant_Name(Restaurant_Name);
          if (value.isNotEmpty) {
            removeError(error: kNameNullError);
          }
          Restaurant_Name = value;
        },
        validator: (value) {
          if (value!.isEmpty) {
            addError(error: kNameNullError);
            return "";
          }

          return null;
        },
        decoration: InputDecoration(
          labelText: "Dish",
          hintText: "Enter your Dish",
          // If  you are using latest version of flutter then label text and hint text shown like this
          // if you r using flutter less then 1.20.* then maybe this is not working properly
          floatingLabelBehavior: FloatingLabelBehavior.always,
          suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/User.svg"),
        ),
      );
  }*/






  final TextEditingController _controllerName = TextEditingController();
  final TextEditingController _controllerQuantity = TextEditingController();
  final TextEditingController _controllerQuantity1 = TextEditingController();
  final TextEditingController _controllerQuantity2 = TextEditingController();
  final TextEditingController _controllerQuantity3 = TextEditingController();
  final TextEditingController _controllerQuantity4 = TextEditingController();

  GlobalKey<FormState> key = GlobalKey();

  final CollectionReference _reference =
      FirebaseFirestore.instance.collection('hotels list');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add The Restaurant Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: key,
          child: Column(
            children: [
              const SizedBox(height: 20),



              TextFormField(
                controller: _controllerName,
                decoration: const InputDecoration(
                    hintText: 'Enter the name of the Restaurant'),
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the Restaurant name';
                  }

                  return null;
                },
              ),
              const SizedBox(height: 30),
              TextFormField(
                controller: _controllerQuantity,
                decoration: const InputDecoration(
                    hintText: 'Enter the name of the Dish'),
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the Dish';
                  }

                  return null;
                },
              ),
              const SizedBox(height: 30),
              TextFormField(
                controller: _controllerQuantity1,
                decoration: const InputDecoration(
                    hintText: 'Enter the name of the Dish'),
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the Dish';
                  }

                  return null;
                },
              ),
              const SizedBox(height: 30),
              TextFormField(
                controller: _controllerQuantity2,
                decoration: const InputDecoration(
                    hintText: 'Enter the name of the Dish'),
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the Dish';
                  }

                  return null;
                },
              ),
              const SizedBox(height: 30),
              TextFormField(
                controller: _controllerQuantity3,
                decoration: const InputDecoration(
                    hintText: 'Enter the name of the Dish'),
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the Dish';
                  }

                  return null;
                },
              ),
              const SizedBox(height: 30),
              TextFormField(
                controller: _controllerQuantity4,
                decoration: const InputDecoration(
                    hintText: 'Enter the name of the Dish'),
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the Dish';
                  }

                  return null;
                },
              ),
              const SizedBox(height: 50),
              ElevatedButton(
                  onPressed: () async {
                    if (key.currentState!.validate()) {
                      String itemName = _controllerName.text;
                      String itemQuantity = _controllerQuantity.text;
                      String itemQuantity1 = _controllerQuantity1.text;
                      String itemQuantity2 = _controllerQuantity2.text;
                      String itemQuantity3 = _controllerQuantity3.text;
                      String itemQuantity4 = _controllerQuantity4.text;

                      //Create a Map of data
                      Map<String, String> dataToSend = {
                        'hotel_name': itemName,
                        'menu': itemQuantity,
                        'menu1': itemQuantity1,
                        'menu2': itemQuantity2,
                        'menu3': itemQuantity3,
                        'menu4': itemQuantity4,
                      };

                      //Add a new item
                      _reference.add(dataToSend);
                     // _reference.add({FieldValue.serverTimestamp()});
                      //`FirebaseFirestore.instance.collection('hotels list').add({'timestamp':FieldValue.serverTimestamp()});
                    }

                    print("**************** Restaurant Details are Added to Database *****************");
                  },
                  child: const Text('Submit')),
            ],
          ),
        ),
      ),
    );
  }
}