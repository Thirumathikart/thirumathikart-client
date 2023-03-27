import 'package:flutter/material.dart';
import 'package:thirumathikart_app/widgets/app_bar.dart';
import 'package:thirumathikart_app/widgets/button/register_button.dart';
import 'package:thirumathikart_app/constants/textfield_constants.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    double deviceHeight = MediaQuery.of(context).size.height;
    return Scaffold(
        appBar: appBar('Register', context),
        body: SingleChildScrollView(
            child: ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: deviceHeight * 0.85,
                ),
                child: Container(
                    padding: const EdgeInsets.all(20),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                    ),
                    child: Center(
                        child: Card(
                            elevation: 12,
                            child: Padding(
                                padding: const EdgeInsets.all(10),
                                child: Column(children: <Widget>[
                                  const SizedBox(
                                    height: 30,
                                  ),
                                  const Text(
                                    'Thirumathikart',
                                    style: TextStyle(
                                        fontSize: 40,
                                        color: Colors.black54,
                                        fontFamily: 'Avenir',
                                        fontWeight: FontWeight.bold,
                                        fontStyle: FontStyle.normal),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Container(
                                    margin: const EdgeInsets.symmetric(
                                        horizontal: 10),
                                    child: Column(
                                      children: [
                                        Column(
                                            children: values
                                                .map((e) => Container(
                                                    margin:
                                                        const EdgeInsets.only(
                                                            top: 20,
                                                            left: 10,
                                                            right: 10),
                                                    decoration: BoxDecoration(
                                                        border: Border.all(
                                                          color: Colors.black,
                                                          width: 1,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10)),
                                                    child: Material(
                                                        color: Colors.white,
                                                        borderRadius:
                                                            const BorderRadius
                                                                .all(
                                                          Radius.circular(10),
                                                        ),
                                                        elevation: 2,
                                                        child: Expanded(
                                                            child: Center(
                                                                child:
                                                                    TextFormField(
                                                          obscureText:
                                                              e.istrue!,
                                                          decoration:
                                                              InputDecoration(
                                                            hintText:
                                                                e.hintword,
                                                            border: InputBorder
                                                                .none,
                                                            contentPadding:
                                                                const EdgeInsets
                                                                    .only(
                                                              left: 20.0,
                                                            ),
                                                          ),
                                                          keyboardType:
                                                              e.texttype,
                                                        ))))))
                                                .toList()),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        const RegisterButton(),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 40,
                                  )
                                ]))))))));
  }
}
