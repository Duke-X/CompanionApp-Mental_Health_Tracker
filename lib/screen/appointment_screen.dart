import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppointmentScreen extends StatelessWidget {
  AppointmentScreen({super.key});

  final List<Map<String, dynamic>> doctors = [
    {
      "name": "Dr. Peshal Ghanghas",
      "rating": "4.5",
      "degree": "Psychiatrist",
      "image": "doctor1.jpg",
    },
    {
      "name": "Dr. Diya Juneja",
      "rating": "4.0",
      "degree": "Psychologist",
      "image": "doctor2.jpg",
    },
    {
      "name": "Dr. Dev Panwar",
      "rating": "4.8",
      "degree": "Counselor",
      "image": "doctor3.jpg",
    },
    {
      "name": "Dr. Vadish Chhatwal",
      "rating": "4.9",
      "degree": "Therapist",
      "image": "doctor4.jpg",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 50),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Stack(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: const Icon(
                          Icons.arrow_back_ios_new,
                          color: Colors.white,
                          size: 25,
                        ),
                      ),
                      InkWell(
                        onTap: () {},
                        child: const Icon(
                          Icons.more_vert,
                          color: Colors.white,
                          size: 25,
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        const CircleAvatar(
                          radius: 35,
                          backgroundImage:
                              AssetImage("assets/images/doctor1.jpg"),
                        ),
                        const SizedBox(height: 15),
                        const Text(
                          "Dr. Peshal Ghanghas",
                          style: TextStyle(
                            fontSize: 23,
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 5),
                        const Text(
                          "Psychiatrist",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 15),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              padding: const EdgeInsets.all(10),
                              decoration: const BoxDecoration(
                                color: Colors.white54,
                                shape: BoxShape.circle,
                              ),
                              child: const Icon(
                                Icons.call,
                                color: Colors.white,
                                size: 25,
                              ),
                            ),
                            const SizedBox(width: 20),
                            Container(
                              padding: const EdgeInsets.all(10),
                              decoration: const BoxDecoration(
                                color: Colors.white54,
                                shape: BoxShape.circle,
                              ),
                              child: const Icon(
                                CupertinoIcons.chat_bubble_text_fill,
                                color: Colors.white,
                                size: 25,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            Container(
              height: MediaQuery.of(context).size.height / 1.4,
              width: double.infinity,
              padding: const EdgeInsets.only(
                top: 20,
                left: 15,
              ),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: [
                  const Text(
                    "About Doctor",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 5),
                  const Text(
                    "Speciality in Psychology, did the practice in Fortis Hospital under a senior Psychologist.",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black54,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      const Text(
                        "Reviews",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(width: 10),
                      const Icon(
                        Icons.star,
                        color: Colors.amber,
                      ),
                      const Text(
                        "4.5",
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(width: 5),
                      const Text(
                        "(124)",
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                          color: Colors.teal,
                        ),
                      ),
                      const Spacer(),
                      //Spacer align next widget to the end of row
                      TextButton(
                        onPressed: () {},
                        child: const Text(
                          "See all",
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                            color: Colors.teal,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 160,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: doctors.length,
                      // Use the length of the doctors list
                      itemBuilder: (context, index) {
                        return Container(
                          margin: const EdgeInsets.all(10),
                          padding: const EdgeInsets.symmetric(vertical: 5),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: const [
                              BoxShadow(
                                color: Colors.black12,
                                blurRadius: 4,
                                spreadRadius: 2,
                              ),
                            ],
                          ),
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width / 1.4,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CircleAvatar(
                                  radius: 25,
                                  backgroundImage: AssetImage(
                                      "assets/images/${doctors[index]['image']}"),
                                ),
                                const SizedBox(width: 10),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Text(
                                            doctors[index]['name'],
                                            style: const TextStyle(
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          const Spacer(),
                                          const Icon(
                                            Icons.star,
                                            color: Colors.amber,
                                            size: 16,
                                          ),
                                          Text(
                                            doctors[index]['rating'],
                                            style:
                                                const TextStyle(fontSize: 16),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 5),
                                      const Text(
                                        "1 day ago",
                                        style: TextStyle(
                                          color: Colors.grey,
                                        ),
                                      ),
                                      const SizedBox(height: 5),
                                      const Text(
                                        "Many thanks to the Doctor. He/She is a great and professional doctor. ",
                                        style: TextStyle(
                                          color: Colors.black,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    "Location",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  ListTile(
                    leading: Container(
                      padding: const EdgeInsets.all(10),
                      decoration: const BoxDecoration(
                        color: Colors.white12,
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.location_on,
                        color: Colors.tealAccent,
                        size: 30,
                      ),
                    ),
                    title: const Text(
                      "Fortis Hospital, Mohali",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: const Text("Address Line of the Medical Center"),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(15),
        height: 130,
        decoration: const BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 4,
              spreadRadius: 2,
            ),
          ],
        ),
        child: Column(
          children: [
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Consultation Fees",
                  style: TextStyle(
                    color: Colors.black54,
                  ),
                ),
                Text(
                  "Rs.800",
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.black54,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 9),
            InkWell(
              onTap: null,
              child: Container(
                width: MediaQuery.of(context).size.width,
                padding: const EdgeInsets.symmetric(vertical: 18),
                decoration: BoxDecoration(
                  color: Colors.teal,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Center(
                  child: Text(
                    "Book Appointment",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
