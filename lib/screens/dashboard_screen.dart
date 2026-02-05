import 'package:flutter/material.dart';
import 'package:event_reminder_app/widgets/progress_card.dart';
import 'package:event_reminder_app/widgets/task_item.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          // Green Background Header
          Container(
            height: 300,
            decoration: const BoxDecoration(
              color: Color(0xFF00B074),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(40),
                bottomRight: Radius.circular(40),
              ),
            ),
          ),
          SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Header
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'HI! Stone',
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              'There are 3 important things ...', // Truncated as per design or use ellipsis
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.white.withValues(alpha: 0.8),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const CircleAvatar(
                        radius: 20,
                        backgroundColor: Colors.white24,
                        backgroundImage: NetworkImage('https://i.pravatar.cc/100?img=33'), // Placeholder image
                      ),
                    ],
                  ),
                ),
                
                // Horizontal Cards
                SizedBox(
                  height: 180,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    children: const [
                      ProgressCard(
                        title: 'Take the medicine',
                        subtitle: '3 times a day',
                        percentage: '33%',
                        icon: Icons.medication,
                        iconColor: Colors.orange,
                        isCompleted: false,
                      ),
                      SizedBox(width: 16),
                      ProgressCard(
                        title: 'Music lesson',
                        subtitle: 'The sixth time',
                        percentage: '0%',
                        icon: Icons.music_note,
                        iconColor: Colors.green,
                        isCompleted: true, // Just to show checkmark style
                      ),
                    ],
                  ),
                ),
                
                const SizedBox(height: 32),
                
                // Today's Plan Header
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Today's plan",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                      ),
                      Stack(
                        alignment: Alignment.center,
                        children: [
                          SizedBox(
                            width: 30,
                            height: 30,
                            child: CircularProgressIndicator(
                              value: 0.75,
                              strokeWidth: 2,
                              backgroundColor: Colors.grey[200],
                              valueColor: const AlwaysStoppedAnimation<Color>(Color(0xFF00B074)),
                            ),
                          ),
                          const Text(
                            '75%',
                            style: TextStyle(fontSize: 10, color: Color(0xFF00B074), fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                
                const SizedBox(height: 16),
                
                // Task List
                Expanded(
                  child: ListView(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    children: const [
                      TaskItem(
                        icon: Icons.checkroom, // Shirt icon
                        iconColor: Colors.orangeAccent,
                        title: 'Wash yesterday\'s clothes',
                        subtitle: 'The whole life should wash',
                        time: 'Just now',
                      ),
                      TaskItem(
                        icon: Icons.book,
                        iconColor: Colors.indigoAccent,
                        title: 'Read a design journal',
                        subtitle: 'Be the best designer',
                        time: '3 h later',
                      ),
                      TaskItem(
                        icon: Icons.credit_card,
                        iconColor: Colors.teal,
                        title: 'Go to the bank',
                        subtitle: 'Take out the design fee',
                        time: '3 h later',
                      ),
                      TaskItem(
                        icon: Icons.sports_basketball,
                        iconColor: Colors.pinkAccent,
                        title: 'Post a work on dribble',
                        subtitle: 'Hope to be recognized',
                        time: '7 h later',
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          
          // Bottom Navigation Placeholder (Floating)
          Positioned(
            bottom: 30,
            left: 24,
            right: 24,
            child: Container(
              height: 70,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(35),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.08),
                    blurRadius: 20,
                    offset: const Offset(0, 10),
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(
                    icon: const Icon(Icons.assignment, color: Color(0xFF00B074)),
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: const Icon(Icons.calendar_today_outlined, color: Colors.grey),
                    onPressed: () {
                      Navigator.pushNamed(context, '/tasks');
                    },
                  ),
                  Container(
                    width: 50,
                    height: 50,
                    decoration: const BoxDecoration(
                      color: Color(0xFF00B074),
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Color(0x4000B074),
                          blurRadius: 10,
                          offset: Offset(0, 5),
                        ),
                      ],
                    ),
                    child: const Icon(Icons.add, color: Colors.white),
                  ),
                  IconButton(
                    icon: const Icon(Icons.notifications_none, color: Colors.grey),
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: const Icon(Icons.person_outline, color: Colors.grey),
                    onPressed: () {},
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
