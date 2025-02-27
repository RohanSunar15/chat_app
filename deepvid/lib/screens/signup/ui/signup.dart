import 'package:deepvid/constant/color.dart';
import 'package:deepvid/widgets/custom/custom_outlined_button.dart';
import 'package:deepvid/widgets/custom/custom_text.dart';
import 'package:deepvid/widgets/custom/custom_textformfield.dart';
import 'package:flutter/material.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _logoWithText(),
              Container(
                width: MediaQuery.of(context).size.width,
                child: Row(
                  children: [
                    Expanded(
                      child: CustomTextFormField(
                        headerText: 'First Name',
                        hintText: 'Example',
                      ),
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: CustomTextFormField(
                        headerText: 'Last Name',
                        hintText: 'Example',
                      ),
                    ),
                  ],
                ),
              ),

              CustomTextFormField(
                headerText: 'Vibe ID',
                hintText: 'example_001',
              ),
              CustomTextFormField(
                headerText: 'Email Address',
                hintText: 'example@gmail.com',
              ),
              CustomTextFormField(
                headerText: 'Password',
                hintText: 'Enter new password',
                obscureText: true,
                suffixIcon: Icon(Icons.visibility_off),
              ),
              CustomTextFormField(
                headerText: 'Confirm Password',
                hintText: 'Confirm new password',
                obscureText: true,
                suffixIcon: Icon(Icons.visibility_off),
              ),

              _signupButton(),
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
                        'Or Signup with',
                        style: TextStyle(color: grey),
                      ),
                    ),
                    // Right line
                    Container(width: 80, height: 1, color: Colors.grey),
                  ],
                ),
              ),
              _googleSignupButton(),
            ],
          ),
        ),
      ),
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
            text: 'Sign Up- Welcome back to DeepVid ',
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
                text: "Already have an account?",
                fontSize: 16,
                color: grey, // Use your predefined grey color.
              ),
              SizedBox(width: 5),
              InkWell(
                onTap: () {
                },
                child: CustomText(
                  text: 'Log in',
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

  Widget _signupButton() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: CustomOutlinedButton(
        childWidget: Text(
          'Create account',
          style: TextStyle(color: white, fontSize: 19),
        ),
        height: 45,
        width: double.maxFinite,
        borderSideColor: loginButtonColor,
        borderRadius: 8,
        backgroundColor: loginButtonColor,
      ),
    );
  }

  Widget _googleSignupButton() {
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
