import 'dart:async';
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
// import 'database_helper.dart';
import 'package:matrimony4/api_service.dart';


class AnalyticsPage extends StatefulWidget {
  const AnalyticsPage({super.key});

  @override
  State<AnalyticsPage> createState() => _AnalyticsPageState();
}

class _AnalyticsPageState extends State<AnalyticsPage> {
  int totalUsers = 0;
  Map<String, int> hobbiesCount = {};
  Map<String, int> genderCount = {};
  Map<String, int> cityCount = {};

  final PageController _pageController = PageController();
  Timer? _autoScrollTimer;

  @override
  void initState() {
    super.initState();
    // fetchAnalyticsData();
    fetchAnalyticsData();
    _startAutoScroll();
  }

  @override
  void dispose() {
    _autoScrollTimer?.cancel();
    _pageController.dispose();
    super.dispose();
  }

  // Future<void> fetchAnalyticsData() async {
  //   final db = DatabaseHelper.instance;
  //   totalUsers = await db.getTotalUsersCount();
  //   hobbiesCount = await db.getHobbiesCount();
  //   genderCount = await db.getGenderCount();
  //   cityCount = await db.getCityCount();
  //   setState(() {});
  // }

  Future<void> fetchAnalyticsData() async {
    try {
      List<Map<String, dynamic>> users = await ApiService.fetchUsers();
      setState(() {
        totalUsers = users.length;

        hobbiesCount = {};
        genderCount = {};
        cityCount = {};

        for (var user in users) {
          // Handle gender
          String gender = user['gender'] ?? 'Unknown';
          genderCount[gender] = (genderCount[gender] ?? 0) + 1;

          // Handle city
          String city = user['city'] ?? 'Unknown';
          cityCount[city] = (cityCount[city] ?? 0) + 1;

          // Handle hobbies - clean up, split into individual hobbies, and count each one
          if (user['hobbies'] != null) {
            List<String> userHobbies;
            if (user['hobbies'] is String) {
              String hobbiesString = user['hobbies'] as String;
              // Clean up the string: replace typos (e.g., "Gmaing" -> "Gaming"), remove extra spaces, and split
              hobbiesString = hobbiesString.replaceAll('Gmaing', 'Gaming').trim();
              // Split by comma, trim each hobby, remove duplicates, and filter out empty entries
              userHobbies = hobbiesString
                  .split(',')
                  .map((hobby) => hobby.trim())
                  .where((hobby) => hobby.isNotEmpty)
                  .toSet() // Remove duplicates
                  .toList();
            } else if (user['hobbies'] is List) {
              userHobbies = List<String>.from(user['hobbies'])
                  .map((hobby) => hobby.toString().trim())
                  .where((hobby) => hobby.isNotEmpty)
                  .toSet() // Remove duplicates
                  .toList();
            } else {
              userHobbies = [];
            }

            for (var hobby in userHobbies) {
              if (hobby.isNotEmpty) {
                hobbiesCount[hobby] = (hobbiesCount[hobby] ?? 0) + 1;
              }
            }
          }
        }
      });
    } catch (e) {
      print("Error fetching analytics data: $e");
    }
  }


  void _startAutoScroll() {
    _autoScrollTimer = Timer.periodic(const Duration(seconds: 5), (timer) {
      if (!_pageController.hasClients) return;

      final nextPage = (_pageController.page?.toInt() ?? 0) + 1;
      if (nextPage > 2) {
        _pageController.jumpToPage(0);
      } else {
        _pageController.animateToPage(
          nextPage,
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeInOut,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Analytics', style: TextStyle(color: Colors.white)),
        backgroundColor: Color(0xFFB24592),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.center,
            colors: [
              Color(0xFFB24592),
              Color(0xFFF3E5F5),
            ],
          ),
        ),
        child: Column(
          children: [
            _buildTotalUsersCard(),
            Expanded(
              child: PageView(
                controller: _pageController,
                children: [
                  _buildChartCard('Hobbies Distribution', hobbiesCount, [
                    Colors.purple, Colors.green, Colors.orange, Colors.blue, Colors.pink, Colors.limeAccent
                  ]),
                  _buildChartCard('Gender Distribution', genderCount, [
                    Colors.blue, Colors.pink, Colors.limeAccent
                  ]),
                  _buildChartCard('City Distribution', cityCount, [
                    Colors.red, Colors.teal, Colors.amber, Colors.indigo
                  ]),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTotalUsersCard() {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      elevation: 4,
      margin: const EdgeInsets.all(16),
      color: Colors.white,  // Keep card white for contrast
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.group, size: 50, color: Color(0xFFB24592)),
            const SizedBox(width: 16),
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Total Users', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                Text('$totalUsers', style: const TextStyle(fontSize: 32, fontWeight: FontWeight.bold)),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildChartCard(String title, Map<String, int> data, List<Color> colors) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        elevation: 4,
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Text(title, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              const SizedBox(height: 16),
              Expanded(child: _buildPieChart(data, colors)),
              const SizedBox(height: 16),
              _buildLegend(data, colors),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPieChart(Map<String, int> data, List<Color> colors) {
    if (data.isEmpty) {
      return const Center(child: Text('No Data'));
    }
    final total = data.values.fold(0, (sum, count) => sum + count);

    return PieChart(
      PieChartData(
        sectionsSpace: 2,
        centerSpaceRadius: 40,
        sections: data.entries.map((entry) {
          final index = data.keys.toList().indexOf(entry.key);
          final percentage = (entry.value / total) * 100;
          return PieChartSectionData(
            color: colors[index % colors.length],
            value: entry.value.toDouble(),
            title: '${percentage.toStringAsFixed(1)}%',
            radius: 60,
            titleStyle: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.white),
          );
        }).toList(),
      ),
    );
  }

  Widget _buildLegend(Map<String, int> data, List<Color> colors) {
    return Wrap(
      spacing: 12,
      children: data.keys.map((key) {
        final index = data.keys.toList().indexOf(key);
        return Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(width: 16, height: 16, color: colors[index % colors.length]),
            const SizedBox(width: 4),
            Text(key, style: const TextStyle(fontSize: 14)),
          ],
        );
      }).toList(),
    );
  }
}