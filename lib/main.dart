import 'package:flutter/material.dart';

void main() {
  runApp(const CampusShareApp());
}

class CampusShareApp extends StatelessWidget {
  const CampusShareApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CampusShare',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: const Color(0xFF3F51B5),
        brightness: Brightness.light,
        fontFamily: 'Roboto',
        cardTheme: CardTheme(
          elevation: 2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: Colors.grey.shade50,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide.none,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide(color: Colors.grey.shade200),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: const BorderSide(color: Color(0xFF3F51B5), width: 2),
          ),
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
          ),
        ),
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
          elevation: 6,
        ),
      ),
      home: const CampusShareHomePage(),
    );
  }
}

class CampusItem {
  final String id;
  final String title;
  final String category;
  final String ownerName;
  final String ownerPhone;
  final String ownerDepartment;
  final String ownerUniversity;
  final String status;
  final String description;
  final String depositAmount;

  CampusItem({
    required this.id,
    required this.title,
    required this.category,
    required this.ownerName,
    required this.ownerPhone,
    required this.ownerDepartment,
    required this.ownerUniversity,
    required this.status,
    required this.description,
    required this.depositAmount,
  });
}

class CampusShareHomePage extends StatefulWidget {
  const CampusShareHomePage({super.key});

  @override
  State<CampusShareHomePage> createState() => _CampusShareHomePageState();
}

class _CampusShareHomePageState extends State<CampusShareHomePage>
    with SingleTickerProviderStateMixin {
  final TextEditingController _searchController = TextEditingController();
  String _selectedCategory = 'All';
  String _searchQuery = '';
  late AnimationController _fabAnimationController;
  late Animation<double> _fabScaleAnimation;

  final List<String> _categories = [
    'All',
    'Books',
    'Electronics',
    'Lab Gear',
  ];

  late List<CampusItem> _items;

  @override
  void initState() {
    super.initState();
    _fabAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
    _fabScaleAnimation = Tween<double>(begin: 1.0, end: 1.1).animate(
      CurvedAnimation(
          parent: _fabAnimationController, curve: Curves.easeInOut),
    );

    _items = [
      CampusItem(
        id: '1',
        title: 'Data Structures & Algorithms Book',
        category: 'Books',
        ownerName: 'Tanvir Ahmed',
        ownerPhone: '+880 1712-345678',
        ownerDepartment: 'Computer Science & Engineering',
        ownerUniversity: 'BUET',
        status: 'Available',
        description:
            'Comprehensive DSA textbook by Cormen (CLRS), 3rd Edition. Excellent condition with highlighted key chapters. Perfect for CSE-201 course.',
        depositAmount: '৳ 500',
      ),
      CampusItem(
        id: '2',
        title: 'Casio FX-991EX Calculator',
        category: 'Electronics',
        ownerName: 'Nusrat Jahan',
        ownerPhone: '+880 1819-876543',
        ownerDepartment: 'Electrical & Electronic Engineering',
        ownerUniversity: 'Dhaka University',
        status: 'Available',
        description:
            'Scientific calculator with natural textbook display. Supports matrix, vector, and statistical calculations. Battery recently replaced.',
        depositAmount: '৳ 800',
      ),
      CampusItem(
        id: '3',
        title: 'Standard White Lab Coat',
        category: 'Lab Gear',
        ownerName: 'Shakib Hasan',
        ownerPhone: '+880 1634-567890',
        ownerDepartment: 'Chemistry',
        ownerUniversity: 'Jahangirnagar University',
        status: 'Available',
        description:
            'Size M white lab coat, freshly laundered. Suitable for Chemistry and Biology lab sessions. Has front pockets and button closure.',
        depositAmount: '৳ 300',
      ),
      CampusItem(
        id: '4',
        title: 'Discrete Mathematics by Rosen',
        category: 'Books',
        ownerName: 'Rafiqul Islam',
        ownerPhone: '+880 1912-234567',
        ownerDepartment: 'Computer Science & Engineering',
        ownerUniversity: 'CUET',
        status: 'Available',
        description:
            'Kenneth H. Rosen\'s Discrete Mathematics, 8th Edition. Covers logic, sets, relations, graph theory. Minor wear on cover but pages are clean.',
        depositAmount: '৳ 450',
      ),
      CampusItem(
        id: '5',
        title: 'Arduino Uno R3 Starter Kit',
        category: 'Electronics',
        ownerName: 'Mehjabin Sultana',
        ownerPhone: '+880 1521-345678',
        ownerDepartment: 'Mechatronics Engineering',
        ownerUniversity: 'RUET',
        status: 'Available',
        description:
            'Complete Arduino Uno R3 kit with breadboard, jumper wires, LEDs, resistors, sensors, and LCD display. Great for ECE lab projects.',
        depositAmount: '৳ 1,200',
      ),
      CampusItem(
        id: '6',
        title: 'Chemistry Safety Goggles',
        category: 'Lab Gear',
        ownerName: 'Farhana Akter',
        ownerPhone: '+880 1678-901234',
        ownerDepartment: 'Applied Chemistry',
        ownerUniversity: 'Dhaka University',
        status: 'Available',
        description:
            'Anti-splash chemical safety goggles with adjustable strap. Meets lab safety standards. Cleaned and sanitized after each use.',
        depositAmount: '৳ 200',
      ),
      CampusItem(
        id: '7',
        title: 'Operating System Concepts (Silberschatz)',
        category: 'Books',
        ownerName: 'Kamrul Hasan Rony',
        ownerPhone: '+880 1756-789012',
        ownerDepartment: 'Software Engineering',
        ownerUniversity: 'SUST',
        status: 'Available',
        description:
            'Abraham Silberschatz OS Concepts, 10th Edition. Covers process management, memory, storage, and protection. Includes practice exercises.',
        depositAmount: '৳ 550',
      ),
      CampusItem(
        id: '8',
        title: 'Multimeter (Digital)',
        category: 'Electronics',
        ownerName: 'Tasnim Rahman',
        ownerPhone: '+880 1845-678901',
        ownerDepartment: 'Electrical Engineering',
        ownerUniversity: 'KUET',
        status: 'Available',
        description:
            'UNI-T UT61E digital multimeter. Measures voltage, current, resistance, capacitance, frequency. Auto-ranging with backlit display.',
        depositAmount: '৳ 700',
      ),
    ];
  }

  @override
  void dispose() {
    _searchController.dispose();
    _fabAnimationController.dispose();
    super.dispose();
  }

  List<CampusItem> get _filteredItems {
    return _items.where((item) {
      final matchesCategory =
          _selectedCategory == 'All' || item.category == _selectedCategory;
      final matchesSearch = _searchQuery.isEmpty ||
          item.title.toLowerCase().contains(_searchQuery.toLowerCase()) ||
          item.ownerName.toLowerCase().contains(_searchQuery.toLowerCase()) ||
          item.category.toLowerCase().contains(_searchQuery.toLowerCase());
      return matchesCategory && matchesSearch;
    }).toList();
  }

  IconData _getCategoryIcon(String category) {
    switch (category) {
      case 'Books':
        return Icons.menu_book_rounded;
      case 'Electronics':
        return Icons.devices_rounded;
      case 'Lab Gear':
        return Icons.science_rounded;
      default:
        return Icons.category_rounded;
    }
  }

  Color _getCategoryColor(String category) {
    switch (category) {
      case 'Books':
        return const Color(0xFF5C6BC0);
      case 'Electronics':
        return const Color(0xFF00897B);
      case 'Lab Gear':
        return const Color(0xFFFF7043);
      default:
        return const Color(0xFF78909C);
    }
  }

  IconData _getCategoryChipIcon(String category) {
    switch (category) {
      case 'All':
        return Icons.apps_rounded;
      case 'Books':
        return Icons.menu_book_rounded;
      case 'Electronics':
        return Icons.devices_rounded;
      case 'Lab Gear':
        return Icons.science_rounded;
      default:
        return Icons.category_rounded;
    }
  }

  void _showOwnerDetailModal(CampusItem item) {
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (context) {
        return Dialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
          insetPadding:
              const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Header
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(24),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        _getCategoryColor(item.category),
                        _getCategoryColor(item.category).withOpacity(0.7),
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(24),
                      topRight: Radius.circular(24),
                    ),
                  ),
                  child: Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.2),
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          _getCategoryIcon(item.category),
                          size: 40,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 16),
                      Text(
                        item.title,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 6),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.25),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(
                          item.category,
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontSize: 13,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                // Body
                Padding(
                  padding: const EdgeInsets.all(24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Status & Deposit
                      Row(
                        children: [
                          Expanded(
                            child: _buildInfoCard(
                              icon: Icons.check_circle_rounded,
                              iconColor: const Color(0xFF4CAF50),
                              label: 'Status',
                              value: item.status,
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: _buildInfoCard(
                              icon: Icons.account_balance_wallet_rounded,
                              iconColor: const Color(0xFFFF9800),
                              label: 'Deposit',
                              value: item.depositAmount,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),

                      // Description
                      const Text(
                        'Description',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w700,
                          color: Color(0xFF37474F),
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        item.description,
                        style: TextStyle(
                          fontSize: 14,
                          height: 1.6,
                          color: Colors.grey.shade700,
                        ),
                      ),
                      const SizedBox(height: 24),

                      // Owner Info Header
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: Colors.indigo.shade50,
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(
                              color: Colors.indigo.shade100, width: 1),
                        ),
                        child: Column(
                          children: [
                            CircleAvatar(
                              radius: 30,
                              backgroundColor: Colors.indigo.shade100,
                              child: Text(
                                item.ownerName.split(' ').map((e) => e[0]).take(2).join(),
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.indigo.shade700,
                                ),
                              ),
                            ),
                            const SizedBox(height: 12),
                            Text(
                              item.ownerName,
                              style: const TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF1A237E),
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              item.ownerDepartment,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 13,
                                color: Colors.grey.shade600,
                              ),
                            ),
                            const SizedBox(height: 2),
                            Text(
                              item.ownerUniversity,
                              style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.w600,
                                color: Colors.teal.shade700,
                              ),
                            ),
                            const SizedBox(height: 12),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 14, vertical: 8),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(12),
                                border: Border.all(
                                    color: Colors.grey.shade200, width: 1),
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Icon(Icons.phone_rounded,
                                      size: 18, color: Colors.indigo.shade400),
                                  const SizedBox(width: 8),
                                  Text(
                                    item.ownerPhone,
                                    style: const TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                      color: Color(0xFF37474F),
                                      letterSpacing: 0.5,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 24),

                      // WhatsApp Button
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton.icon(
                          onPressed: () {
                            Navigator.of(context).pop();
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Row(
                                  children: [
                                    const Icon(Icons.chat_rounded,
                                        color: Colors.white, size: 20),
                                    const SizedBox(width: 12),
                                    Expanded(
                                      child: Text(
                                        'Opening WhatsApp chat with ${item.ownerName} (${item.ownerPhone})...',
                                        style: const TextStyle(fontSize: 13),
                                      ),
                                    ),
                                  ],
                                ),
                                backgroundColor: const Color(0xFF25D366),
                                behavior: SnackBarBehavior.floating,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12)),
                                margin: const EdgeInsets.all(16),
            
