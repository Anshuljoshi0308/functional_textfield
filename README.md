
# Functional TextField
The **Functional TextField** Flutter package simplifies text input in your Flutter applications. It provides a versatile and customizable text field widget with built-in validation and styling options.

## Installation
1 . Add the following dependency to your pubspec.yaml file
```yaml
dependencies:
  functional_textfield: ^1.0.0
```
2 . Import the package and use it in your Flutter App.

```dart
import "package:functional_textfield/functional_textfield.dart";
```

## Features

* Customization: Tailor the text field to your needs with options for labels, hints, icons, and more.
* Validation: Streamline user input with built-in validation for phone numbers, emails, and numeric values.
* Styling: Configure the appearance of your text fields, including outline color, focus color, and text color.
* Versatility: Suitable for various use cases, from simple single-line input to multi-line text areas.

![Functional TextField Example](https://drive.google.com/uc?export=view&id=1MghriBkOGS9gLfdVXtBnaRpV4key-71C)
![Functional TextField Example](https://drive.google.com/uc?export=view&id=1Mdr3nTSSmu2p4i7dFGILWj_buDCCNkOo)



## Usage
```dart
import 'package:flutter/material.dart';
import 'package:functional_textfield/functional_textfield.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Functional Text Field "),),
      body: Form(
          child: Column(
            children: [
              FunTextField(
                controller: controller,
                lable: "Name",
                hint: "Username",
                notNull: true,
              ),
              FunTextField(
                controller: controller,
                lable: "Email",
                hint: "Your Email",
                forEmail: true,
              ),
              FunTextField(
                controller: controller,
                lable: "Phone no",
                hint: "Phone No",
                forPhoneNo: true,
              ),
              Row(
                children: [
                  FunTextField(
                    controller: controller,
                    lable: "Name",
                    hint: "Username",
                    onlyNo: true,
                    forRow: true,
                  ),
                  FunTextField(
                    controller: controller,
                    lable: "Name",
                    hint: "Username",
                    fillColor: true,
                    fillColorValue: Colors.white,
                    forRow: true,
                  ),
                ],
              ),
            ],
          )),
    );
  }
}

```
## Contact
For support, issues, or feature requests, please contact Anshul Joshi via [email](mailto:CodeBunks@gmail.com) or visit the [GitHub repository](GitHub repository](https://github.com/Anshuljoshi0308/functional_textfield).

