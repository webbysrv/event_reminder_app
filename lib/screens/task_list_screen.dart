import 'package:flutter/material.dart';

class TaskListScreen extends StatefulWidget {
  const TaskListScreen({super.key});

  @override
  State<TaskListScreen> createState() => _TaskListScreenState();
}

class _TaskListScreenState extends State<TaskListScreen> {
  // Mock data for the timeline
  final List<Map<String, dynamic>> _sections = [
    {
      'title': 'In the morning',
      'tasks': [
        {'title': 'Take medicine on time', 'completed': false},
        {'title': 'Wash yesterday\'s clothes', 'completed': true},
      ]
    },
    {
      'title': 'After work',
      'tasks': [
        {'title': 'Go to the bank', 'completed': false},
        {'title': 'Regular in the wave release a work', 'completed': true},
        {'title': 'See a movie', 'completed': false},
      ]
    },
    {
      'title': 'Going to bed',
      'tasks': [
        {'title': 'Call mom', 'completed': false},
        {'title': 'Read a design journal', 'completed': true},
      ]
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF00B074), // Green background for top part
      body: Stack(
        children: [
          SafeArea(
            child: Column(
              children: [
                // Header
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
                  child: Row(
                    children: [
                      const Text(
                        '14',
                        style: TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(width: 8),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: const [
                              Text(
                                'October',
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.white,
                                ),
                              ),
                              Icon(Icons.keyboard_arrow_down, color: Colors.white, size: 20),
                            ],
                          ),
                        ],
                      ),
                      const Spacer(),
                      IconButton(
                        icon: const Icon(Icons.sort, color: Colors.white), // Menu icon placeholder
                        onPressed: () {},
                      ),
                    ],
                  ),
                ),
                
                const SizedBox(height: 16),
                
                // White Content Container
                Expanded(
                  child: Container(
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(40),
                        topRight: Radius.circular(40),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(top: 32.0, left: 24.0, right: 24.0),
                      child: ListView.builder(
                        itemCount: _sections.length,
                        itemBuilder: (context, index) {
                          return _buildTimelineSection(index);
                        },
                      ),
                    ),
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
                    icon: const Icon(Icons.assignment_outlined, color: Colors.grey),
                    onPressed: () {
                       Navigator.pop(context);
                    },
                  ),
                  IconButton(
                    icon: const Icon(Icons.calendar_today, color: Color(0xFF00B074)), // Active
                    onPressed: () {},
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

  Widget _buildTimelineSection(int index) {
    final section = _sections[index];
    final tasks = section['tasks'] as List<dynamic>;
    
    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Timeline Line
          Column(
            children: [
              Container(
                width: 20,
                height: 20,
                decoration: BoxDecoration(
                  color: Colors.orangeAccent.withValues(alpha: 0.2),
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Container(
                    width: 8,
                    height: 8,
                    decoration: const BoxDecoration(
                      color: Colors.orangeAccent,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  width: 2,
                  color: Colors.grey[200],
                ),
              ),
            ],
          ),
          const SizedBox(width: 16),
          // Content
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  section['title'],
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 16),
                ...tasks.map((task) => _buildTaskItem(task)),
                const SizedBox(height: 24),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTaskItem(Map<String, dynamic> task) {
    bool isCompleted = task['completed'];
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Row(
        children: [
          Container(
            width: 24,
            height: 24,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: isCompleted ? const Color(0xFF00B074) : Colors.grey[300]!,
                width: 2,
              ),
              color: isCompleted ? const Color(0xFF00B074) : Colors.transparent,
            ),
            child: isCompleted
                ? const Icon(Icons.check, size: 16, color: Colors.white)
                : null,
          ),
          const SizedBox(width: 12),
          Text(
            task['title'],
            style: TextStyle(
              fontSize: 16,
              color: isCompleted ? Colors.grey[400] : Colors.black87,
              decoration: isCompleted ? TextDecoration.lineThrough : null,
            ),
          ),
          const Spacer(),
          if (!isCompleted)
            Icon(Icons.more_vert, color: Colors.grey[400], size: 20),
        ],
      ),
    );
  }
}
