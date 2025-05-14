import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key, this.title});
  final String? title;
  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  Razorpay _razorpay = Razorpay();
  @override
  void initState() {
   
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(244, 243, 243, 1),

      appBar: AppBar(backgroundColor: Colors.white, title: Text("Payment UI")),
      drawer: Drawer(),

      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            InkWell(
              onTap: () {
                var options = {
                  'key': 'rzp_test_27Thf113vIC8Np',
                  'amount': 100, //in paise.
                  'name': 'Acme Corp.',
                  'description': 'Fine T-Shirt',
                  'timeout': 60, // in seconds
                  
                };
                _razorpay.open(options);
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Proceed to payment",
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    Fluttertoast.showToast(
      msg: response.paymentId.toString(),
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.CENTER,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.red,
      textColor: Colors.white,
      fontSize: 16.0,
    );
  }

  void _handlePaymentError(PaymentFailureResponse response) {
 
    Fluttertoast.showToast(
      msg: "${response.message} \n ${response.error}" ,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.CENTER,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.red,
      textColor: Colors.white,
      fontSize: 16.0,
    );
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
Fluttertoast.showToast(
      msg: "${response.walletName}" ,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.CENTER,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.red,
      textColor: Colors.white,
      fontSize: 16.0,
    );
  }
}
