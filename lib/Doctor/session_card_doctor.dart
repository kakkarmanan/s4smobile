import 'package:flutter/material.dart';
import 'package:s4smobile/Doctor/session_details.dart';

class SessionCard extends StatelessWidget {
  final String balance;
  final String cardNumber;
  final Function onTopRightButtonClicked;
  final Gradient backgroundGradient;
  final Widget
      cardIcon; //Should be an Image.network(...) or Image.asset(...) Widget

  const SessionCard({
    Key? key,
    required this.onTopRightButtonClicked,
    required this.cardIcon,
    this.balance = "\$2,850.00",
    this.cardNumber = "****  ****  ****  3799",
    this.backgroundGradient =
        const LinearGradient(colors: [Colors.black87, Colors.black54]),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5), // if you need this
        side: BorderSide(
          color: Colors.grey.withOpacity(.2),
          width: 1,
        ),
      ),
      child: SizedBox(
        width: 400,
        height: 240,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.fromLTRB(8.0, 13.0, 8.0, 0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(
                    height: 50.0,
                    width: 60.0,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15.0),
                      child: Image.network(
                        'https://onlinejpgtools.com/images/examples-onlinejpgtools/coffee-resized.jpg',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const <Widget>[
                      Padding(
                        padding: EdgeInsets.fromLTRB(0, 6.0, 0, 0),
                        child: Text(
                          'Cafe Coffee Day',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      Text(
                        'Alpha 1, Greater Noida',
                        style: TextStyle(color: Colors.grey),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const Divider(
              color: Colors.black,
              thickness: .2,
              indent: 8,
              endIndent: 8,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(8.0, 0, 0, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'ITEMS',
                    style: TextStyle(color: Colors.grey[700]),
                  ),
                  const Text(
                    '5 x Cold Coffee',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    'ORDERED ON',
                    style: TextStyle(color: Colors.grey[700]),
                  ),
                  const Text(
                    '28 Feb 2020 at 1:36 PM',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    'TOTAL AMOUNT',
                    style: TextStyle(color: Colors.grey[700]),
                  ),
                  const Text(
                    '\u20B9480.00',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  )
                ],
              ),
            ),
            const Divider(
              color: Colors.black,
              thickness: .2,
              indent: 8,
              endIndent: 8,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(8.0, 0, 8.0, 0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    'Delivered',
                    style: TextStyle(color: Colors.grey[700]),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SessionDetails(),
                        ),
                      );
                    },
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: <Widget>[
                        const Padding(
                          padding: EdgeInsets.fromLTRB(0, 0, 0, 2.0),
                          child: Icon(
                            Icons.medical_services_outlined,
                            size: 12,
                          ),
                        ),
                        const SizedBox(
                          width: 3,
                        ),
                        Text(
                          'View Session Details',
                          style: TextStyle(color: Colors.grey[700]),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
