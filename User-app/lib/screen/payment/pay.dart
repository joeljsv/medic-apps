import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:medic_app/models/call_api.dart';
import 'package:medic_app/providers/auth/auth.dart';
import 'package:medic_app/screen/doctor/doctorDetail/onwait.dart';
import 'package:medic_app/theme/theme.dart';
import 'package:medic_app/utils/apis/server.dart';
import 'package:medic_app/utils/essentials/appbar.dart';
import 'package:medic_app/widgets/doctorScreen/chat/chat.dart';
import 'package:provider/provider.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

class Payment extends StatefulWidget {
  final String payAmount;
  final bool isOff;
  final String name;
  final Call_API api;

  const Payment({Key key, this.payAmount, this.isOff, this.name, this.api}) : super(key: key);
  @override
  _PaymentState createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {
  Razorpay _razorpay;

  @override
  void initState() {
    super.initState();
    _razorpay = Razorpay();
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
  }

  @override
  void dispose() {
    super.dispose();
    _razorpay.clear();
  }

  void openCheckout() async {
    var options = {
      'key': RAZOR_PAY_KEY,
      'amount': widget.payAmount,
      'name': '<Name>',
      'description': 'Payment',
      'prefill': {'contact': '1234567890', 'email': 'test@gmail.com'},
      'external': {
        'wallets': ['paytm']
      }
    };

    try {
      _razorpay.open(options);
    } catch (e) {
      debugPrint(e);
    }
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) async{
    Fluttertoast.showToast(
      msg: "SUCCESS: " + response.paymentId,
    );
    if(widget.isOff){
       await Provider.of<AuthProvder>(context, listen: false).confirm();
    }
     Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (ctx) =>
                      widget.isOff ? WaitConfirm() : ChatScreen("${widget.name}",widget.api)));
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    Fluttertoast.showToast(
      msg: "ERROR: " + response.code.toString() + " - " + response.message,
    );
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    Fluttertoast.showToast(
      msg: "EXTERNAL_WALLET: " + response.walletName,
    );
  }

  final Color clr = AppTheme.appColor.primary;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: inAppBar("Checkout"),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 150,
              height: 100,
              child: Image.asset("assets/img/icon.png")),
            Text(
              "Continue to pay",
              style: AppTheme.textTheme.headline2
                  .copyWith(fontSize: 25, color: clr),
            ),
            Text(
              "Rs: ${widget.payAmount}",
              style: AppTheme.textTheme.headline2
                  .copyWith(fontSize: 35, color: clr),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: FlatButton.icon(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                  ),
                onPressed: ()=>openCheckout(),
                
                color: clr,
                icon: Icon(
                  Icons.arrow_forward,
                  color: Colors.white,
                ),
                label: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Continue to pay",
                    style: AppTheme.textTheme.headline2
                        .copyWith(fontSize: 25, color: Colors.white),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
