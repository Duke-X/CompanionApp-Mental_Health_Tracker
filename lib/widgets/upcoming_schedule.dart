import 'package:flutter/material.dart';

class UpcomingSchedule extends StatelessWidget {
  // Define the list of doctors outside the class and make it static const
  static const List<Map<String, dynamic>> doctors = [
    {
      "name": "Dr. Peshal Ghanghas",
      "rating": "4.5",
      "degree": "Psychiatrist",
      "image": "doctor1.jpg",
      "date": "20/05/2024",
      "time": "10:30 AM",
      "status": "Confirmed",
    },
    {
      "name": "Dr. Diya Juneja",
      "rating": "4.0",
      "degree": "Psychologist",
      "image": "doctor2.jpg",
      "date": "25/05/2024",
      "time": "11:00 AM",
      "status": "Declined",
    },
    {
      "name": "Dr. Dev Panwar",
      "rating": "4.8",
      "degree": "Counselor",
      "image": "doctor3.jpg",
      "date": "29/02/2024",
      "time": "02:00 PM",
      "status": "Confirmed",
    },
    {
      "name": "Dr. Vadish Chhatwal",
      "rating": "4.9",
      "degree": "Therapist",
      "image": "doctor4.jpg",
      "date": "22/04/2024",
      "time": "04:20 PM",
      "status": "Confirmed",
    },
  ];

  const UpcomingSchedule({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "About Doctor",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 15),
          Column(
            children: List.generate(doctors.length, (index) {
              final doctor = doctors[index];
              return Container(
                padding: const EdgeInsets.symmetric(vertical: 10),
                margin: const EdgeInsets.only(bottom: 10), // Add margin for gap
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
                child: Column(
                  children: [
                    ListTile(
                      title: Text(
                        doctor['name'],
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Text(doctor['degree']),
                      trailing: CircleAvatar(
                        radius: 25,
                        // Use the doctor's image from the defined list
                        backgroundImage: AssetImage('assets/images/${doctor['image']}'),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15),
                      child: Divider(
                        thickness: 1,
                        height: 20,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Row(
                          children: [
                            const Icon(Icons.calendar_month, color: Colors.black54),
                            const SizedBox(width: 5),
                            Text(
                              doctor['date'],
                              style: const TextStyle(color: Colors.black54),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            const Icon(Icons.access_time_filled, color: Colors.black54),
                            const SizedBox(width: 5),
                            Text(
                              doctor['time'],
                              style: const TextStyle(color: Colors.black54),
                            ),
                            const SizedBox(width: 5),
                            Container(
                              width: 10,
                              height: 10,
                              padding: const EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                color: doctor['status'] == "Confirmed" ? Colors.green : Colors.red,
                                shape: BoxShape.circle,
                              ),
                              child: Row(
                                children: [
                                  const SizedBox(width: 2,),
                                  Text(doctor['status'],
                                    style: const TextStyle(color: Colors.black54, fontSize: 10),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 15),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children:[
                        InkWell(
                          onTap: (){},
                          child: Container(
                            width: 150,
                            padding: const EdgeInsets.symmetric(vertical: 12),
                            decoration: BoxDecoration(
                              color: const Color(0xFFF4F6FA),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: const Center(
                              child: Text(
                                "Cancel",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: (){},
                          child: Container(
                            width: 150,
                            padding: const EdgeInsets.symmetric(vertical: 12),
                            decoration: BoxDecoration(
                              color: Colors.teal,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: const Center(
                              child: Text(
                                "Reschedule",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              );
            }),
          ),
        ],
      ),
    );
  }
}
