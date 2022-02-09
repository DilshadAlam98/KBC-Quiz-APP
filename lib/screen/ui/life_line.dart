import 'package:flutter/material.dart';

class LifeLineDrawer extends StatelessWidget {
  const LifeLineDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: const Text(
                "LifeLine",
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                lifelineOption("Audeence\nPole", Icons.people, 12, Colors.teal),
                lifelineOption(
                    "Ask The\nExpert", Icons.people, 0, Colors.black38),
                lifelineOption("50/50", Icons.people, 12, Colors.teal),
                lifelineOption("Audeence\nPole", Icons.people, 12, Colors.teal),
              ],
            ),
            const Divider(
              height: 10,
              thickness: 1,
              color: Colors.blue,
            ),
            Expanded(
              child: Container(
                color: Colors.teal,
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: ListView.separated(
                  itemCount: 13,
                  itemBuilder: (context, index) {
                    return Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: index==5?Colors.green:Colors.blue,
                      ),
                      height: MediaQuery.of(context).size.height / 16,
                      width: MediaQuery.of(context).size.width,
                      child: ListTile(
                        leading: Text("${index + 1}"),
                        title: index < 5
                            ? Text(
                                "Rs.${(50000) * (index + 2)}",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 17),
                              )
                            : index < 7
                                ? Text(
                                    "Rs.${(500000) * (index + 3)}",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 17),
                                  )
                                : Text(
                                    "Rs.${(5000000) * (index + 4)}",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 17),
                                  ),
                      ),
                    );
                  },
                  separatorBuilder: (context, index) => Divider(
                    thickness: 2,
                    height: 1,
                    endIndent: 14,
                    indent: 14,
                    color: Colors.green,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Column lifelineOption(
      String text, IconData icon, double double, Color color) {
    return Column(
      children: [
        Card(
          elevation: double,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(32)),
          child: Container(
            decoration: BoxDecoration(shape: BoxShape.circle, color: color),
            child: Icon(
              icon,
              size: 32,
              color: Colors.white,
            ),
          ),
        ),
        const SizedBox(
          height: 2,
        ),
        Text(
          text,
          textAlign: TextAlign.center,
        )
      ],
    );
  }
}
