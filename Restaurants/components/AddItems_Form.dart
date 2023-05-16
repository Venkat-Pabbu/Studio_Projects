import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../Restaurant list/Restaurants List.dart';
import '../../components/custom_surfix_icon.dart';
import '../../components/default_button.dart';
import '../../components/form_error.dart';
import '../../constants.dart';
import '../../size_config.dart';

class AddItem extends StatefulWidget {
  const AddItem({Key? key}) : super(key: key);

  @override
  State<AddItem> createState() => _AddItemState();
}

class _AddItemState extends State<AddItem> {

  final _formKey = GlobalKey<FormState>();
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
    DocumentReference documentReference = FirebaseFirestore.instance
        .collection('hotels list')
        .doc(Restaurant_Name);
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
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => ItemList()));
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
      keyboardType: TextInputType.phone,
      onSaved: (newValue) => Menu2 = newValue,
      onChanged: (value) {
        getMenu2(Menu2);
        if (value.isNotEmpty) {
          removeError(error: kPhoneNumberNullError);
        }
        Menu2 = value;
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
  }
}
