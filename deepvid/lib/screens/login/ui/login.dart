import 'package:deepvid/constant/color.dart';
import 'package:deepvid/screens/home/ui/home.dart';
import 'package:deepvid/screens/login/bloc/login_bloc.dart';
import 'package:deepvid/screens/signup/ui/signup.dart';
import 'package:deepvid/widgets/custom/custom_outlined_button.dart';
import 'package:deepvid/widgets/custom/custom_text.dart';
import 'package:deepvid/widgets/custom/custom_textformfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Login extends StatefulWidget {

  Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {

  @override
  void initState() {
    loginBloc.add(LoginInitialEvent());
    super.initState();
  }

  final LoginBloc loginBloc = LoginBloc();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginBloc, LoginState>(
      bloc: loginBloc,
      listenWhen: (previous , current) =>  current is LoginActionState,
      buildWhen: (previous , current) =>  current is! LoginActionState,
      listener: (context, state) {
        if(state is LoginNavigateToSignupActionState){
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => Signup()));
        } else if (state is LoginNavigateToHomeActionState){
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => Home()));
        }
      },
      builder: (context, state) {
        switch (state.runtimeType){
          case LoginLoadingState:
            return Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          case LoginLoadingSuccessState:
            final successState = state is LoginLoadingSuccessState;
            return Scaffold(
              body: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 100.0, horizontal: 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _logoWithText(),
                      CustomTextFormField(
                        headerText: 'Email',
                        hintText: 'example@gmail.com',
                      ),
                      CustomTextFormField(
                        headerText: 'Password',
                        hintText: 'Enter Your Password',
                        obscureText: true,
                        suffixIcon: Icon(Icons.visibility_off),
                      ),
                      _forgotPassword(),
                      _loginButton(),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            // Left line
                            Container(width: 80, height: 1, color: Colors.grey),
                            // Spacing + text
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 8.0),
                              child: Text(
                                'Or login with',
                                style: TextStyle(color: grey),
                              ),
                            ),
                            // Right line
                            Container(width: 80, height: 1, color: Colors.grey),
                          ],
                        ),
                      ),

                      _googleLoginButton(),
                    ],
                  ),
                ),
              ),
            );
          case LoginErrorState:
            return Scaffold(
              body: Center(
                child: Text('Error!'),
              ),
            );
          default:
            return SizedBox(
              child: Text('ABCDE',style:  TextStyle(color: white),),
            );
        }

      },
    );
  }

  Widget _logoWithText() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset('assets/images/deepvid_logo.png', scale: 5),
          CustomText(
            text: 'Log in - Welcome back to DeepVid ',
            fontSize: 24,
            fontWeight: FontWeight.w500,
            color: Colors.white,
            gradient: LinearGradient(
              colors: [
                linearGradient1,
                linearGradient2,
                linearGradient3,
                linearGradient4,
                linearGradient5,
                linearGradient6,
                linearGradient7,
                linearGradient8,
                linearGradient9,
                linearGradient10,
                linearGradient11,
                linearGradient12,
                linearGradient13,
                linearGradient14,
                linearGradient15,
              ],
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
            ),
          ),
          CustomText(
            text: 'AI',
            fontSize: 25,
            fontWeight: FontWeight.w500,
            gradient: LinearGradient(
              colors: [linearGradient1, linearGradient2],
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
            ),
          ),
          SizedBox(height: 20),
          // Row with normal text examples:
          Row(
            children: [
              CustomText(
                text: "Don't have an account?",
                fontSize: 16,
                color: grey,
              ),
              SizedBox(width: 5),
              InkWell(
                onTap: () {
                 loginBloc.add(SignupNavigationEvent());
                },
                child: CustomText(
                  text: 'Sign up',
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: darkBlue,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _forgotPassword() {
    return Padding(
      padding: const EdgeInsets.only(top: 40),
      child: Container(
        alignment: Alignment.centerLeft,
        child: CustomText(
          text: 'Forgot Password?',
          color: darkBlue,
          fontSize: 14,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _loginButton() {
    return InkWell(
      onTap: (){
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => Home()));
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: CustomOutlinedButton(
          childWidget: Text(
            'Log in',
            style: TextStyle(color: white, fontSize: 19),
          ),
          height: 45,
          width: double.maxFinite,
          borderSideColor: loginButtonColor,
          borderRadius: 8,
          backgroundColor: loginButtonColor,
        ),
      ),
    );
  }

  Widget _googleLoginButton() {
    return Padding(
      padding: const EdgeInsets.only(top: 30.0),
      child: Container(
        height: 50,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: googleButtonColor,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.grey.shade900, width: 0.7),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/google_logo.png', scale: 50),
            SizedBox(width: 10),
            Text(
              'Continue with Google',
              style: TextStyle(color: white, fontSize: 19),
            ),
          ],
        ),
      ),
    );
  }
}
