import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Registration',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: const Color(0xFFF8F9FA),
      ),
      home: const RegistrationScreen(),
    );
  }
}

class RegistrationScreen extends StatelessWidget {
  const RegistrationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {},
        ),
        title: const Text(
          'REGISTRATION',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.menu, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Date Header
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const Text(
                  'May 2026',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                ),
                const SizedBox(width: 8),
                const Icon(Icons.access_time, color: Colors.black87),
              ],
            ),
            const SizedBox(height: 24),

            // Yearly Target
            _buildTargetCard(
              iconColor: const Color(0xFF4CAF50),
              title: 'Yearly target',
              subtitle: '2026',
              actual: '82,198',
              target: '360,000',
              percentage: 22,
              circleColor: const Color(0xFFCDDC39),
              isPercentage: true,
            ),
            const SizedBox(height: 16),

            // Monthly Target
            _buildTargetCard(
              iconColor: const Color(0xFF4CAF50),
              title: 'Monthly target',
              subtitle: 'May 2026',
              actual: '7,076',
              target: '34,000',
              percentage: 34,
              circleColor: const Color(0xFF26A69A),
              isPercentage: true,
            ),
            const SizedBox(height: 16),

            // Over Last Month
            _buildComparisonCard(
              title: 'Over last month',
              subtitle: 'May 2026 vs May 2025',
              currentLabel: "May'26",
              currentValue: '7,076',
              previousLabel: "Apr'26",
              previousValue: '26,127',
              difference: '-19,051',
              circleColor: const Color(0xFF81D4FA),
            ),
            const SizedBox(height: 16),

            // Over Last Year
            _buildComparisonCard(
              title: 'Over last year',
              subtitle: 'May 2026 vs May 2025',
              currentLabel: "May'26",
              currentValue: '7,076',
              previousLabel: "May'25",
              previousValue: '21,540',
              difference: '-14,464',
              circleColor: const Color(0xFF80CBC4),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTargetCard({
    required Color iconColor,
    required String title,
    required String subtitle,
    required String actual,
    required String target,
    required int percentage,

    required Color circleColor,
    required bool isPercentage,
  }) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(6),
                        decoration: BoxDecoration(
                          color: iconColor.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Icon(
                          Icons.grid_view,
                          color: iconColor,
                          size: 20,
                        ),
                      ),
                      const SizedBox(width: 12),
                      Text(
                        title,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Text(
                    subtitle,
                    style: const TextStyle(fontSize: 16, color: Colors.black87),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'actual : $actual',
                    style: const TextStyle(fontSize: 15),
                  ),
                  Text(
                    'target : $target',
                    style: const TextStyle(fontSize: 15),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 16),
            _buildPercentageCircle(percentage, circleColor),
          ],
        ),
      ),
    );
  }

  Widget _buildComparisonCard({
    required String title,
    required String subtitle,
    required String currentLabel,
    required String currentValue,
    required String previousLabel,
    required String previousValue,
    required String difference,
    required Color circleColor,
  }) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(6),
                        decoration: BoxDecoration(
                          color: const Color(0xFF4CAF50).withOpacity(0.1),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: const Icon(
                          Icons.grid_view,
                          color: Color(0xFF4CAF50),
                          size: 20,
                        ),
                      ),
                      const SizedBox(width: 12),
                      Text(
                        title,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Text(
                    subtitle,
                    style: const TextStyle(fontSize: 15, color: Colors.black87),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    '$currentLabel : $currentValue',
                    style: const TextStyle(fontSize: 15),
                  ),
                  Text(
                    '$previousLabel : $previousValue',
                    style: const TextStyle(fontSize: 15),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 16),
            _buildDifferenceCircle(difference, circleColor),
          ],
        ),
      ),
    );
  }

  Widget _buildPercentageCircle(int percentage, Color color) {
    return SizedBox(
      width: 110,
      height: 110,
      child: Stack(
        alignment: Alignment.center,
        children: [
          SizedBox(
            width: 110,
            height: 110,
            child: CircularProgressIndicator(
              value: percentage / 100,
              strokeWidth: 12,
              backgroundColor: Colors.grey.shade200,
              valueColor: AlwaysStoppedAnimation<Color>(color),
            ),
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                '$percentage%',
                style: const TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildDifferenceCircle(String difference, Color color) {
    return SizedBox(
      width: 110,
      height: 110,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            width: 110,
            height: 110,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: color, width: 12),
            ),
          ),
          Text(
            difference,
            style: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
