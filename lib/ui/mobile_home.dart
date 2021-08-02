import 'package:common/auth/auth.dart';
import 'package:common/common.dart';
import 'package:common/core/main_bottom_navigation_bar.dart';
import 'package:example/ui/tab1/tab1.dart';
import 'package:example/ui/tab2/tab2.dart';
import 'package:example/ui/tab3/tab3.dart';
import 'package:example/ui/tab4/tab4.dart';
import 'package:flutter/material.dart';
import 'package:localizations/generated/l10n.dart';

// File home
// @project example
// @author hoangminhk4b on 16-07-2021
class MobileHome extends StatefulWidget {
  @override
  _MobileHomeState createState() => _MobileHomeState();
}

class _MobileHomeState extends State<MobileHome> {
  @override
  Widget build(BuildContext context) {
    return MainBottomNavigationBar(
      bottomNavigatorBuilder:
          (BuildContext contextNavigation, int currentIndex) {
        return BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: Color(0xFFE0E1E9),
          currentIndex: currentIndex,
          onTap: (index) {
            contextNavigation.read<TabBarController>().tabIndex = index;
          },
          items: [
            BottomNavigationBarItem(
              icon: ImageIcon(
                AssetImage('assets/icon/analysis.png'),
              ),
              label: Translate.of(context).overview,
            ),
            BottomNavigationBarItem(
              icon: ImageIcon(AssetImage('assets/icon/pie-chart.png')),
              label: Translate.of(context).statistic,
            ),
            BottomNavigationBarItem(
              icon: ImageIcon(AssetImage('assets/icon/contract.png')),
              label: Translate.of(context).planning,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: Translate.of(context).setting,
            ),
          ],
        );
      },
      children: [Tab1(), Tab2(), Tab3(), Tab4()],
    );
  }
}
