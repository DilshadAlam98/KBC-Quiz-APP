import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  String? name;
  String? profileUrl;
  String? rank;
  String? level;
  String? money;
  Profile({
    this.name,this.profileUrl,this.level,this.rank,this.money
  });

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile"),
        centerTitle: true,
        actions: const [
          Icon(Icons.share)
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              height: MediaQuery.of(context).size.height / 3.2,
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(20),
                      bottomLeft: Radius.circular(20)),
                  color: Colors.blue),
              child: Column(
                children: [
                  Stack(
                    children: [
                      CircleAvatar(
                        radius: 55,
                        backgroundImage: NetworkImage(widget.profileUrl.toString())
                      ),
                      Positioned(
                        bottom: 5.0,
                        right: 0.0,
                        child: Container(
                          padding: const EdgeInsets.all(5),
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white
                          ),
                          child: const Icon(Icons.edit,),
                        ),
                      )
                    ],
                  ),
                  Text(
                   widget.name!.toString(),
                    style: const TextStyle(fontSize: 25, color: Colors.white),
                  ),
                  const Divider(
                    thickness: 1,
                    endIndent: 20,
                    indent: 20,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        children: [
                          Text(
                            widget.level.toString(),
                            style: const TextStyle(
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
                          Text("#${widget.rank}",
                              style: const TextStyle(
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
            const SizedBox(
              height: 20,
            ),
            const Text(
              "Learder Board",
              style: TextStyle(fontSize: 20),
            ),
            Expanded(
              child: ListView.separated(
                shrinkWrap: true,
                separatorBuilder: (context, index) => const Divider(
                  thickness: 1,
                ),
                itemCount: 12,
                itemBuilder: (context, index) {
                  return ListTile(
                      title: Row(
                        children: const [
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
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      trailing: Text(
                        (2000 / (index + 1)).toString().substring(0, 5),
                        style: const TextStyle(fontWeight: FontWeight.bold),
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
