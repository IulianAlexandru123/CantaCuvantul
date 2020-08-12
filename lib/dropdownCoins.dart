import 'package:flutter/material.dart';
import 'package:firebase_admob/firebase_admob.dart';
import 'admob_service.dart';

Future buildShowModalBottomSheet(BuildContext context) {
  return showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20.0),
              topRight: Radius.circular(20.0),
            ),
            color: Color(0xFF005BEA),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              Container(
                height: 36,
              ),
              SizedBox(
                height: (56 * 6).toDouble(),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20.0),
                      topRight: Radius.circular(20.0),
                    ),
                    color: Colors.blueGrey[900],
                  ),
                  child: Stack(
                    alignment: Alignment(0, 0),
                    overflow: Overflow.visible,
                    children: <Widget>[
                      Positioned(
                        top: -36,
                        child: Container(
                          decoration: BoxDecoration(
                              color: Color(0xFF005BEA),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(50)),
                              border: Border.all(
                                  color: Color(0xFF005BEA), width: 10)),
                          child: Center(
                            child: ClipOval(
                              child: Icon(
                                Icons.attach_money,
                                color: Colors.greenAccent,
                                size: 50,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 30, horizontal: 40),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              'Free coins',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'Josefin',
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold),
                            ),
                            CoinsRow(money: 10, price: 'Watch Ad'),
                            Text(
                              'Paid',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'Josefin',
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold),
                            ),
                            CoinsRow(money: 20, price: '5\$'),
                            CoinsRow(money: 35, price: '7\$'),
                            CoinsRow(money: 50, price: '10\$'),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        );
      });
}

class CoinsRow extends StatelessWidget {
  final int money;
  final String price;
  const CoinsRow({
    Key key,
    this.money,
    this.price,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text(
          '$money\$',
          style: TextStyle(
              color: Colors.green,
              fontFamily: 'Josefin',
              fontSize: 20,
              fontWeight: FontWeight.bold),
        ),
        RaisedButton(
          onPressed: () {
            if (price == 'Watch Ad') {
              RewardedVideoAd.instance.load(
                  // adUnitId: 'ca-app-pub-4042459717874979/2278085570',
                  adUnitId: RewardedVideoAd.testAdUnitId,
                  targetingInfo: targetingInfo);

              RewardedVideoAd.instance.show();
            }
          },
          color: Colors.red,
          shape: RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(13.0),
          ),
          child: Text(
            price,
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'Josefin',
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}
