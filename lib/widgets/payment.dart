import 'package:flutter/material.dart';

class PaymentContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Card(
        elevation: 10,
        child: Container(
          width: mq.width,
          height: mq.height * 0.5,
          child: Row(children: <Widget>[
            Container(
              padding: EdgeInsets.all(10),
              color: Theme.of(context).primaryColorLight,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Card(
                    child: Padding(
                      padding: const EdgeInsets.all(5),
                      child: Icon(
                        Icons.credit_card,
                        color: Theme.of(context).primaryColorDark,
                        size: 40,
                      ),
                    ),
                    color: Colors.white,
                    elevation: 20,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  
                  Icon(
                    Icons.help_outline,
                    color: Colors.white,
                    size: 30,
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                padding:
                    EdgeInsets.only(top: 20, right: 15, left: 15, bottom: 15),
                color: Colors.white,
                child: Form(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        "Credit Card Details",
                        style: TextStyle(
                            color: Theme.of(context).primaryColorLight,
                            fontSize: 20),
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: "Name",
                        ),
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: "Card Number",
                        ),
                        keyboardType: TextInputType.number,
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: "CVV",
                        ),
                        keyboardType: TextInputType.number,
                      ),
                      Center(
                        // child: Container(
                        //   decoration: BoxDecoration(
                        //     borderRadius: BorderRadius.circular(50),
                        //     color: Theme.of(context).primaryColorDark,
                        //     gradient: new LinearGradient(
                        //         colors: [
                        //           Theme.of(context).primaryColorLight,
                        //           Theme.of(context).primaryColor
                        //         ],
                        //         begin: Alignment.centerLeft,
                        //         end: Alignment.centerRight),
                        //   ),
                        //   child: FlatButton(
                        //     child: Row(
                        //       mainAxisAlignment: MainAxisAlignment.center,
                        //       children: <Widget>[
                        //         Text(
                        //           "Pay",
                        //           style: TextStyle(
                        //             color: Colors.white,
                        //             fontSize: 28,
                        //           ),
                        //         ),
                        //         SizedBox(width: 10,),
                        //         Icon(
                        //           Icons.check_circle_outline,
                        //           color: Colors.white,
                        //           size: 30,
                        //         ),
                        //       ],
                        //     ),
                        //     onPressed: () {},
                        //   ),
                        //),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
