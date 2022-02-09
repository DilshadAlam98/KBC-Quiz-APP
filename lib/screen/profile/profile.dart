import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile"),
        centerTitle: true,
        actions: [
          Icon(Icons.share)
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(10),
              height: MediaQuery.of(context).size.height / 3.3,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(20),
                      bottomLeft: Radius.circular(20)),
                  color: Colors.blue),
              child: Column(
                children: [
                  Stack(
                    children: [
                      CircleAvatar(
                        radius: 50,
                        backgroundImage: NetworkImage(
                            "https://images.unsplash.com/photo-1644289153492-0ed7bd5f5dca?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHwyNHx8fGVufDB8fHx8&auto=format&fit=crop&w=1100&q=60"),
                      ),
                      Positioned(
                        bottom: 5.0,
                        right: 0.0,
                        child: Container(
                          padding: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white
                          ),
                          child: Icon(Icons.edit,),
                        ),
                      )
                    ],
                  ),
                  Text(
                    "Dilshad Alam",
                    style: TextStyle(fontSize: 25, color: Colors.white),
                  ),
                  Divider(
                    thickness: 1,
                    endIndent: 20,
                    indent: 20,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        children: [
                          Text(
                            "45",
                            style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                          Text(
                            "Level",
                            style: TextStyle(
                                fontSize: 19,
                                color: Colors.white.withOpacity(0.9),
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                      Column(
                        children: [
                          Text("#43",
                              style: TextStyle(
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white)),
                          Text("Rank",
                              style: TextStyle(
                                  fontSize: 19,
                                  color: Colors.white.withOpacity(0.9),
                                  fontWeight: FontWeight.bold)),
                        ],
                      )
                    ],
                  )
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "Learder Board",
              style: TextStyle(fontSize: 20),
            ),
            Expanded(
              child: ListView.separated(
                shrinkWrap: true,
                separatorBuilder: (context, index) => Divider(
                  thickness: 1,
                ),
                itemCount: 12,
                itemBuilder: (context, index) {
                  return ListTile(
                      title: Row(
                        children: [
                          CircleAvatar(
                            backgroundImage: NetworkImage(
                                "https://images.unsplash.com/photo-1644269444230-c6d1f2722e10?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHw2MXx8fGVufDB8fHx8&auto=format&fit=crop&w=1100&q=60"),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text("Dilshad"),
                        ],
                      ),
                      leading: Text(
                        "#${index + 1}",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      trailing: Text(
                        "${(2000 / (index + 1)).toString().substring(0, 5)}",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ));
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
