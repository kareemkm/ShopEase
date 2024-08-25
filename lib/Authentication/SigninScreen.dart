import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'SingUpViewmodel.dart';

class SignUpScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<SignUpViewModel>(context);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body:SingleChildScrollView(
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    colors: [
                      Colors.orange.shade900,
                      Colors.orange.shade800,
                      Colors.orange.shade400
                    ]
                )
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget> [
                const SizedBox(height: 70),
                const Padding(
                  padding: EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children:<Widget>[
                      Text("Signin", style:TextStyle(color: Colors.white,fontSize: 40)),
                      SizedBox(height: 10,),
                      Text("Welcome to App" , style: TextStyle(color: Colors.white,fontSize: 18),)
                    ],
                  ),
                ),
                const SizedBox(height: 20,),
                Expanded(
                    child: Container(
                      width: double.infinity,
                      decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(topLeft:Radius.circular(60) ,topRight: Radius.circular(60))
                      ),
                      child: Padding(
                          padding: const EdgeInsets.all(30),
                        child: Column(
                          children: <Widget>[
                            const SizedBox(height: 40),
                            Container(
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(20),
                                  boxShadow: const [BoxShadow(
                                      color: Color.fromRGBO(225, 95 , 27 , .3),
                                      blurRadius: 20,
                                      offset: Offset(0, 10)

                                  )]
                              ),
                              child: Column(
                                children:<Widget> [
                                  Container(
                                    padding: const EdgeInsets.only(top: 5 , bottom: 5 , right: 20 , left: 20),
                                    decoration: BoxDecoration(border: Border(bottom: BorderSide(color: Colors.grey.shade200)),),
                                    child: const TextField(
                                      decoration: InputDecoration(
                                          hintText: "Name",
                                          hintStyle: TextStyle(color: Colors.grey),
                                          border: InputBorder.none
                                      ),
                                    ),
                                  ),
                                  Container(
                                    padding: const EdgeInsets.only(top: 5 , bottom: 5 , right: 20 , left: 20),
                                    decoration: BoxDecoration(border: Border(bottom: BorderSide(color: Colors.grey.shade200)),),
                                    child: TextField(
                                      decoration: const InputDecoration(
                                          hintText: "Email",
                                          hintStyle: TextStyle(color: Colors.grey),
                                          border: InputBorder.none
                                      ),
                                      controller: viewModel.emailController,
                                    ),
                                  ),
                                  Container(
                                    padding: const EdgeInsets.only(top: 5 , bottom: 5 , right: 20 , left: 20),
                                    decoration: BoxDecoration(border: Border(bottom: BorderSide(color: Colors.grey.shade200)),),
                                    child:  TextField(
                                      obscureText: true,
                                      decoration: const InputDecoration(
                                          hintText: "Password",
                                          hintStyle: TextStyle(color: Colors.grey),
                                          border: InputBorder.none
                                      ),
                                      controller: viewModel.passwordController,
                                    ),
                                  ),
                                  Container(
                                    padding: const EdgeInsets.only(top: 5 , bottom: 5 , right: 20 , left: 20),
                                    decoration: BoxDecoration(border: Border(bottom: BorderSide(color: Colors.grey.shade200)),),
                                    child: const TextField(
                                      obscureText: true,
                                      decoration: InputDecoration(
                                          hintText: "Confirm Password",
                                          hintStyle: TextStyle(color: Colors.grey),
                                          border: InputBorder.none
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 20),
                            const Text("already have account?" ,style: TextStyle(color: Colors.grey),),
                            const SizedBox(height: 20),
                            GestureDetector(
                              onTap: (){
                                viewModel.signUpWithEmailPassword();
                                Navigator.pushNamed(context, '/Home');
                              },
                              child: Container(
                                height: 50,
                                margin: const EdgeInsets.symmetric(horizontal: 50),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(50),
                                    color: Colors.orange.shade900
                                ),
                                child: const Center(
                                  child: Text("Signing" , style: TextStyle(color: Colors.white,fontSize: 16,fontWeight: FontWeight.bold)),
                                ),
                              ),
                            ),
                            const SizedBox(height: 20),
                            GestureDetector(
                              onTap: (){
                                viewModel.signUpWithGoogle();
                                Navigator.pushNamed(context, '/Home');
                              },
                              child: Container(
                                height: 50,
                                margin: const EdgeInsets.symmetric(horizontal: 50),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(50),
                                    color: Colors.grey.shade500
                                ),
                                child: Center(
                                  child: Image.asset('lib/assets/google.png'),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    )
                )

              ],
            ),
          ),
        )
      ),
    );
  }
}
