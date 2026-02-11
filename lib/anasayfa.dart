import 'package:flutter/material.dart';

class Anasayfa extends StatefulWidget {
  const Anasayfa({super.key});

  @override
  State<Anasayfa> createState() => _AnasayfaState();
}

class _AnasayfaState extends State<Anasayfa> {
  //  Transaction verileri
  final List<Map<String, dynamic>> transactions = [
    {
      "title": "Spotify Premium",
      "time": "2 dakika önce",
      "amount": "- 20 ₺",
      "icon": Icons.music_note,
      "color": Colors.green,
    },
    {
      "title": "Steam Cüzdan",
      "time": "Dün",
      "amount": "- 50 \$",
      "icon": Icons.videogame_asset,
      "color": Colors.blueGrey,
    },
    {
      "title": "Amazon",
      "time": "3 gün önce",
      "amount": "- 89 ₺",
      "icon": Icons.shopping_cart,
      "color": Colors.orange,
    },
    {
      "title": "Canva Premium",
      "time": "1 hafta önce",
      "amount": "- 110 ₺",
      "icon": Icons.palette_outlined,
      "color": Colors.pink,
    },
    {
      "title": "Epic Games",
      "time": "2 hafta önce",
      "amount": "- 220 ₺",
      "icon": Icons.sports_esports,
      "color": Colors.black,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFFFFF),

      // ================= BOTTOM BAR =================
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: 0,
        selectedItemColor: const Color(0xFF458B73),
        unselectedItemColor: Colors.grey,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home_filled), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.bar_chart_outlined), label: "Stats"),
          BottomNavigationBarItem(icon: Icon(Icons.notifications_none), label: "Notif"),
          BottomNavigationBarItem(icon: Icon(Icons.person_outline), label: "Profile"),
        ],
      ),

      // ================= BODY =================
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              // ================= ÜST KART =================
              Container(
                margin: const EdgeInsets.all(18),
                padding: const EdgeInsets.all(18),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(26),
                  gradient: const LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Color(0xFF5FA58D),
                      Color(0xFF458B73),
                      Color(0xFF356A58),
                    ],
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Color(0xFF2E5C4D).withOpacity(0.35),
                      blurRadius: 25,
                      offset: Offset(0, 14),
                    ),
                  ],
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // üst satır
                    Row(
                      children: [
                        const CircleAvatar(radius: 22),
                        const SizedBox(width: 12),
                        const Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Merhaba!",
                                style: TextStyle(color: Colors.white70, fontSize: 12),
                              ),
                              SizedBox(height: 2),
                              Text(
                                "Alper Altakhan",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          width: 44,
                          height: 44,
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.10),
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(
                            Icons.account_balance_wallet_outlined,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 18),

                    // bakiye
                    const Text(
                      "Mevcut Bakiye",
                      style: TextStyle(color: Colors.white70, fontSize: 17),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      "253.847 ₺",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 44,
                        fontWeight: FontWeight.w700,
                        letterSpacing: -1,
                      ),
                    ),

                    const SizedBox(height: 14),
                    Divider(color: Colors.white.withOpacity(0.15)),
                    const SizedBox(height: 20),

                    // tek buton
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            height: 44,
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.10),
                              borderRadius: BorderRadius.circular(14),
                            ),
                            child: const Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.add, color: Colors.white, size: 16),
                                SizedBox(width: 10),
                                Text(
                                  "Yeni Kart Ekle",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              // ================= RECENT TRANSACTIONS =================
              const SizedBox(height: 18),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18),
                child: Row(
                  children: const [
                    Text(
                      "Son İşlemler",
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
                    ),
                    Spacer(),
                    Text(
                      "Tümünü göster",
                      style: TextStyle(
                        color: Color(0xFF458B73),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 12),

              Container(
                margin: const EdgeInsets.symmetric(horizontal: 18),
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 18,
                      offset: Offset(0, 10),
                    ),
                  ],
                ),
                child: ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: transactions.length,
                  separatorBuilder: (_, __) => const Divider(),
                  itemBuilder: (context, index) {
                    return _transactionRow(transactions[index]);
                  },
                ),
              ),

              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }

  // ================= TRANSACTION ROW =================
  Widget _transactionRow(Map<String, dynamic> tx) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          CircleAvatar(
            radius: 22,
            backgroundColor: tx["color"] as Color,
            child: Icon(tx["icon"] as IconData, color: Colors.white),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  tx["title"] as String,
                  style: const TextStyle(fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 4),
                Text(
                  tx["time"] as String,
                  style: const TextStyle(color: Colors.grey, fontSize: 12),
                ),
              ],
            ),
          ),
          Text(
            tx["amount"] as String,
            style: const TextStyle(fontWeight: FontWeight.w600),
          ),
        ],
      ),
    );
  }
}
