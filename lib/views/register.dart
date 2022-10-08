import 'package:flutter/material.dart';
import 'package:thirumathikart_app/widgets/button/register_button.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    double deviceHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SingleChildScrollView(
        child: ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: deviceHeight,
            ),
            child: Container(
              padding: const EdgeInsets.all(20),
              decoration: const BoxDecoration(
                color: Color.fromRGBO(251, 242, 207, 1),
              ),
              child: Center(
                child: Card(
                  elevation: 12,
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      children: <Widget>[
                        const SizedBox(
                          height: 30,
                        ),
                        const Text(
                          'Thirumathikart',
                          style: TextStyle(
                              fontSize: 34,
                              color: Colors.black54,
                              fontFamily: 'Avenir',
                              fontWeight: FontWeight.bold,
                              fontStyle: FontStyle.normal),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Container(
                          margin: const EdgeInsets.symmetric(horizontal: 10),
                          child: Column(
                            children: <Widget>[
                              Container(
                                margin: const EdgeInsets.only(top: 16),
                                child: Material(
                                  color: Colors.white,
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(20)),
                                  elevation: 2,
                                  child: AspectRatio(
                                    aspectRatio: 7 / 1,
                                    child: Center(
                                      child: TextFormField(
                                        style: const TextStyle(
                                            // fontSize: 19,
                                            ),
                                        decoration: const InputDecoration(
                                          hintText: 'First Number',
                                          border: InputBorder.none,
                                          contentPadding: EdgeInsets.only(
                                              left: 10.0, bottom: 12),
                                        ),
                                        keyboardType: TextInputType.name,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.only(top: 16),
                                child: Material(
                                  color: Colors.white,
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(20)),
                                  elevation: 2,
                                  child: AspectRatio(
                                    aspectRatio: 7 / 1,
                                    child: Center(
                                      child: TextFormField(
                                        decoration: const InputDecoration(
                                          hintText: 'Last Name',
                                          border: InputBorder.none,
                                          contentPadding: EdgeInsets.only(
                                              left: 10.0, bottom: 12),
                                        ),
                                        keyboardType: TextInputType.name,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.only(top: 16),
                                child: Material(
                                  color: Colors.white,
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(20)),
                                  elevation: 2,
                                  child: AspectRatio(
                                    aspectRatio: 7 / 1,
                                    child: Center(
                                      child: TextFormField(
                                        decoration: const InputDecoration(
                                          hintText: 'Enter Email',
                                          border: InputBorder.none,
                                          contentPadding: EdgeInsets.only(
                                              left: 10.0, bottom: 12),
                                        ),
                                        keyboardType:
                                            TextInputType.emailAddress,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.only(top: 16),
                                child: Material(
                                  color: Colors.white,
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(20)),
                                  elevation: 2,
                                  child: AspectRatio(
                                    aspectRatio: 7 / 1,
                                    child: Center(
                                      child: TextFormField(
                                        decoration: const InputDecoration(
                                          hintText: 'Enter Password',
                                          border: InputBorder.none,
                                          contentPadding: EdgeInsets.only(
                                              left: 10.0, bottom: 12),
                                        ),
                                        keyboardType:
                                            TextInputType.visiblePassword,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.only(top: 16),
                                child: Material(
                                  color: Colors.white,
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(20),
                                  ),
                                  elevation: 2,
                                  child: Row(
                                    children: <Widget>[
                                      Expanded(
                                        child: AspectRatio(
                                          aspectRatio: 7 / 1,
                                          child: Center(
                                            child: TextFormField(
                                              decoration: const InputDecoration(
                                                hintText: 'Reenter Password',
                                                border: InputBorder.none,
                                                contentPadding: EdgeInsets.only(
                                                    left: 10.0, bottom: 12),
                                              ),
                                              keyboardType:
                                                  TextInputType.visiblePassword,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              const RegisterButton(),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            )),
      ),
    );
  }
}
