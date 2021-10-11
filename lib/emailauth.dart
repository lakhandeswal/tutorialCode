import 'package:flutter/material.dart';
import 'package:email_auth/email_auth.dart';

class EmailAuth extends StatefulWidget {
  @override
  _EmailAuthState createState() => _EmailAuthState();
}

class _EmailAuthState extends State<EmailAuth> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController otpController = TextEditingController();

  void sendOtp() async{
    // EmailAuth.sessionName = 'Test Session';
    // var res = await EmailAuth.sendOtp(receiverMail:emailController.text);
    // if(res){
    //   print('otp sent');
    // } else{
    //   print('error sending otp');
    // }
  }

  void verifyOtp(){
    // var res = EmailAuth.validate(receiverEmail:emailController.text,userOTP:otpController.text);
    // if(res){
    //   print('otp is correct');
    // }else{
    //   print('otp is incorrect');
    // }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child:Form(
        child: ListView(
          children: [
            TextFormField(
              controller: emailController,
              decoration: InputDecoration(
                hintText: 'Enter email',
                labelText: 'Email',
                suffixIcon: TextButton(
                  child:Text('Send Otp'),
                  onPressed: ()=>sendOtp()
                )
              ),
            ),
            TextFormField(
              controller: otpController,
              decoration: InputDecoration(
                  hintText: 'Enter otp',
                  labelText: 'Otp'
              ),
            ),
            SizedBox(
              height:20.0
            ),
            FlatButton(onPressed: ()=> verifyOtp()
            ,
                color: Colors.indigo,
                child: Text('Verify otp'))
          ],
        ),
      )
    );
  }
}
