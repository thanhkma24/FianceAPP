// File page_view_bottom_navigation
// @project example
// @author hoangminhk4b on 16-07-2021

import 'package:common/core/navigator_manager.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

typedef BottomNavigatorBuilder = Widget Function(
    BuildContext contextNavigation, int currentIndex);

class MainBottomNavigationBar extends StatefulWidget {
  final List<Widget> children;
  final List<bool>? wantKeepAliveChildren;
  final BottomNavigatorBuilder bottomNavigatorBuilder;
  final int defaultIndex;
  final Future<bool>? exitMain;

  const MainBottomNavigationBar(
      {Key? key,
      required this.children,
      this.wantKeepAliveChildren,
      this.defaultIndex = 0,
      required this.bottomNavigatorBuilder,
      this.exitMain})
      : assert(children.length > 0),
        assert(wantKeepAliveChildren == null ||
            (wantKeepAliveChildren.length == children.length)),
        super(key: key);

  @override
  _MainBottomNavigationBarState createState() =>
      _MainBottomNavigationBarState();
}

class _MainBottomNavigationBarState extends State<MainBottomNavigationBar>
    with MainBottomNavigationMixin {
  @override
  void initState() {
    super.initState();
  }

  @override
  BottomNavigatorBuilder get bottomNavigatorBuilder =>
      widget.bottomNavigatorBuilder;

  @override
  List<Widget> get children => widget.children;

  @override
  int get defaultIndex => widget.defaultIndex;

  @override
  Future<bool>? get exitMain => widget.exitMain;

  @override
  List<bool>? get wantKeepAliveChildren => widget.wantKeepAliveChildren;
}

class TabBarController extends ValueNotifier<int> {
  final PageController controller;
  final Map<int, GlobalKey<NavigatorState>> navigatorKeys;
  final int maxTapPopUntil;

  TabBarController(this.controller, this.navigatorKeys,
      {int? defaultIndex, this.maxTapPopUntil = 2})
      : super(defaultIndex ?? 0);

  int _tapDouble = 0;

  set tabIndex(int index) {
    if (value != index) {
      controller.jumpToPage(index);
      value = index;
      _tapDouble = 0;
    } else
      _tapDouble++;
    if (_tapDouble >= maxTapPopUntil) {
      var checkChild = navigatorKeys[index]?.currentState?.canPop();
      if (checkChild == true) {
        navigatorKeys[index]?.currentState?.popUntil((route) => route.isFirst);
      }
      _tapDouble = 0;
    }
  }

  GlobalKey<NavigatorState>? get navigatorKeyCurrent => navigatorKeys[value];

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}

mixin MainBottomNavigationMixin<T extends StatefulWidget> on State<T> {
  late PageController _pageController;
  Map<int, GlobalKey<NavigatorState>> _navigatorKeys = Map();
  List<Widget> _children = List.empty();

  List<Widget> get children;

  int get defaultIndex;

  List<bool>? get wantKeepAliveChildren;

  Future<bool>? get exitMain;

  BottomNavigatorBuilder get bottomNavigatorBuilder;

  @mustCallSuper
  @override
  void initState() {
    _pageController = PageController(initialPage: defaultIndex, keepPage: true);
    _children = List.generate(children.length, (index) {
      final child = children[index];
      final navigatorKey = GlobalKey<NavigatorState>();
      final wantKeepAlive = wantKeepAliveChildren?.elementAt.call(index);
      _navigatorKeys[index] = navigatorKey;
      return NavigatorItemBar(
          child: child,
          navigatorKey: navigatorKey,
          wantKeepAlive: wantKeepAlive);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (_) => TabBarController(_pageController, _navigatorKeys,
            defaultIndex: defaultIndex),
        builder: (contextProvider, child) {
          return Scaffold(
              body: WillPopScope(
                onWillPop: () async {
                  final currentIndex =
                      contextProvider.read<TabBarController>().value;
                  final navigatorCurrent = _navigatorKeys[currentIndex];
                  final navigatorState = navigatorCurrent?.currentState;
                  final canPop = navigatorState?.canPop();
                  if (canPop == true)
                    navigatorState?.maybePop();
                  else {
                    if (currentIndex == defaultIndex)
                      return exitMain ?? Future.value(true);
                    else
                      contextProvider.read<TabBarController>().tabIndex =
                          defaultIndex;
                  }
                  return false;
                },
                child: PageView(
                  physics: NeverScrollableScrollPhysics(),
                  controller: _pageController,
                  onPageChanged: (index) {
                    contextProvider.read<TabBarController>().value = index;
                  },
                  children: _children,
                ),
              ),
              bottomNavigationBar: Consumer<TabBarController>(
                builder: (BuildContext context, value, Widget? child) {
                  return bottomNavigatorBuilder(context, value.value);
                },
              ));
        });
  }
}

class NavigatorItemBar extends StatefulWidget {
  final Widget child;
  final GlobalKey<NavigatorState> navigatorKey;
  final bool? wantKeepAlive;

  const NavigatorItemBar(
      {Key? key,
      required this.child,
      required this.navigatorKey,
      this.wantKeepAlive})
      : super(key: key);

  @override
  _NavigatorItemBarState createState() => _NavigatorItemBarState();
}

class _NavigatorItemBarState extends State<NavigatorItemBar>
    with AutomaticKeepAliveClientMixin, NavigatorItemMixin {
  @override
  bool get wantKeepAlive => widget.wantKeepAlive ?? true;

  @override
  Widget get child => widget.child;

  @override
  GlobalKey<NavigatorState> get navigatorKey => widget.navigatorKey;
}
