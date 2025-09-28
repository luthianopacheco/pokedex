import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MobileLayout extends StatelessWidget {
  final Widget? mobileBody;
  const MobileLayout({super.key, required this.mobileBody});

  int _currentIndex(String location) {
    if (location.startsWith('/')) return 0;
    if (location.startsWith('/regions')) return 1;
    if (location.startsWith('/favorite')) return 2;
    if (location.startsWith('/profile')) return 3;
    return 0;
  }

  void _onItemTapped(BuildContext context, int index) {
    switch (index) {
      case 0:
        context.go('/');
        break;
      case 1:
        context.go('/regions');
        break;
      case 2:
        context.go('/favorites');
        break;
      case 3:
        context.go('/profile');
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    final location = GoRouterState.of(context).matchedLocation;
    final currentIndex = _currentIndex(location);
    return Scaffold(
      body: mobileBody ?? const SizedBox(),
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          hoverColor: Colors.transparent,
        ),
        child: BottomNavigationBar(
          currentIndex: currentIndex,
          selectedItemColor: Color(0xff173EA5),
          onTap: (index) => _onItemTapped(context, index),
          items: _items(),
        ),
      ),
    );
  }

  List<BottomNavigationBarItem> _items() {
    return [
      BottomNavigationBarItem(
        activeIcon: _buildImageAsset(imageName: 'pokedex-selected.png'),
        icon: _buildImageAsset(imageName: 'pokedex-unselected.png'),
        label: 'Pokédex',
      ),
      BottomNavigationBarItem(
        activeIcon: _buildImageAsset(imageName: 'region-selected.png'),
        icon: _buildImageAsset(imageName: 'region-unselected.png'),
        label: 'Regiões',
      ),
      BottomNavigationBarItem(
        activeIcon: _buildImageAsset(imageName: 'fav-selected.png'),
        icon: _buildImageAsset(imageName: 'fav-unselected.png'),
        label: 'Favoritos',
      ),
      BottomNavigationBarItem(
        activeIcon: _buildImageAsset(imageName: 'profile-selected.png'),
        icon: _buildImageAsset(imageName: 'profile-unselected.png'),
        label: 'Perfil',
      ),
    ];
  }

  Widget _buildImageAsset({required String imageName}) {
    return Image.asset(
      'assets/icons/nav_icons/$imageName',
      width: 24,
      height: 24,
    );
  }
}
