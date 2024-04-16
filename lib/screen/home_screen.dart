import 'package:demo_app/screen/video_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:youtube_explode_dart/youtube_explode_dart.dart' as yt;
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'appointment_screen.dart';

class HomeScreen extends StatelessWidget {
  final videoUrls = [
    'https://youtu.be/IcViyJmh4HE?si=7-XYxjJql4TGG_7P',
    'https://youtu.be/TLKxdTmk-zc?si=jbEssOZ1bGVa7bFB',
    'https://youtu.be/godVDNVWeso?si=e_PNyCl3ffB1sIry',
    'https://youtu.be/JJdMUYeUyU0?si=RJPc98vFZGmF59tc',
    'https://youtu.be/b3ttfXIGg9E?si=ybcVFMZ3voJNDlBW',
  ];
  final List symptoms = [
    "Stress",
    "Anxiety",
    "Depression",
    "PTSD",
    "Anger",
    "Loneliness",
    "Panic Disorder",
  ];
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

  HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Padding(
            padding: const EdgeInsets.only(top: 40),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Hello Friend",
                        style: TextStyle(
                          fontSize: 23,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      InkWell(
                        onTap: (){
                          FlutterPhoneDirectCaller.callNumber('+918194800216');
                          // _makeEmergencyCall();
                        },
                        child: const Icon(Icons.notifications_active),
                      ),
                      const CircleAvatar(
                        radius: 25,
                        backgroundImage: AssetImage("assets/images/user.jpeg"),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 35,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    InkWell(
                      onTap: () {},
                      child: Container(
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: Colors.teal,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.black12,
                              blurRadius: 6,
                              spreadRadius: 4,
                            ),
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              padding: const EdgeInsets.all(8),
                              decoration: const BoxDecoration(
                                color: Colors.white,
                                shape: BoxShape.circle,
                              ),
                              child: const Icon(
                                Icons.add,
                                color: Colors.teal,
                                size: 35,
                              ),
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            const Text(
                              "Clinic Visit",
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            const Text(
                              "Make an appointment",
                              style: TextStyle(
                                color: Colors.white54,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {},
                      child: Container(
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: Colors.white70,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.black12,
                              blurRadius: 6,
                              spreadRadius: 4,
                            ),
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              padding: const EdgeInsets.all(8),
                              decoration: const BoxDecoration(
                                color: Colors.white54,
                                shape: BoxShape.circle,
                              ),
                              child: const Icon(
                                Icons.home_filled,
                                color: Colors.teal,
                                size: 35,
                              ),
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            const Text(
                              "Home Visit",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            const Text(
                              "Call the doctor home",
                              style: TextStyle(
                                color: Colors.black54,
                              ),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 25),
                const Padding(
                  padding: EdgeInsets.only(left: 15),
                  child: Text(
                    "What are your Symptoms?",
                    style: TextStyle(
                      fontSize: 23,
                      fontWeight: FontWeight.w500,
                      color: Colors.black54,
                    ),
                  ),
                ),
                SizedBox(
                  height: 70,
                  child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: symptoms.length,
                    itemBuilder: (content, index) {
                      return Container(
                        margin: const EdgeInsets.symmetric(
                          vertical: 10,
                          horizontal: 15,
                        ),
                        padding: const EdgeInsets.symmetric(horizontal: 25),
                        decoration: BoxDecoration(
                          color: const Color(0xFFF4F6FA),
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.black12,
                              blurRadius: 4,
                              spreadRadius: 2,
                            ),
                          ],
                        ),
                        child: Center(
                          child: Text(
                            symptoms[index],
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: Colors.black54,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(height: 15),
                const Padding(
                  padding: EdgeInsets.only(left: 15),
                  child: Text(
                    "Popular Doctors",
                    style: TextStyle(
                      fontSize: 23,
                      fontWeight: FontWeight.w500,
                      color: Colors.black54,
                    ),
                  ),
                ),
                GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                  ),
                  itemCount: doctors.length,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => AppointmentScreen(),
                          ),
                        );
                      },
                      child: Container(
                        margin: const EdgeInsets.all(5),
                        padding: const EdgeInsets.symmetric(vertical: 10),
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
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            CircleAvatar(
                              radius: 45,
                              backgroundImage: AssetImage(
                                "assets/images/${doctors[index]['image']}",
                              ),
                            ),
                            Text(
                              doctors[index]['name'],
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: Colors.black54,
                              ),
                            ),
                            Text(
                              doctors[index]['degree'],
                              style: const TextStyle(
                                color: Colors.black54,
                              ),
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Icon(
                                  Icons.star,
                                  color: Colors.amber,
                                ),
                                Text(
                                  doctors[index]['rating'],
                                  style: const TextStyle(
                                    color: Colors.black45,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 15),
                  child: Text(
                    "Browse Session",
                    style: TextStyle(
                      fontSize: 23,
                      fontWeight: FontWeight.w500,
                      color: Colors.black54,
                    ),
                  ),
                ),
                SizedBox(
                  height: 150,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: videoUrls.map((url) {
                        return FutureBuilder<yt.Video>(
                          future: fetchVideoDetails(url),
                          builder: (context, snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              return const CircularProgressIndicator();
                            } else if (snapshot.hasError) {
                              return const Text('Error loading video');
                            } else {
                              return thumbnailWidget(context, snapshot.data!);
                            }
                          },
                        );
                      }).toList(),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<yt.Video> fetchVideoDetails(String url) async {
    final extractor = yt.YoutubeExplode();
    final videoId = yt.VideoId.parseVideoId(url);
    final video = await extractor.videos.get(videoId);
    extractor.close();
    return video;
  }

  Widget thumbnailWidget(BuildContext context, yt.Video video) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => VideoPlayerScreen(videoId: video.id.value),
          ),
        );
      },
      child: Container(
        height: 110,
        width: 148,
        margin: const EdgeInsets.all(10),
        color: Colors.teal,
        child: Image.network(video.thumbnails.highResUrl),
      ),
    );
  }

  void _makeEmergencyCall() async {
    const url = 'tel:8194800216'; // Replace '911' with your specific emergency number
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url));
    } else {
      throw 'Could not launch $url';
    }
  }
}
