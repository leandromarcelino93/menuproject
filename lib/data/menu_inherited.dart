import 'package:flutter/material.dart';
import 'package:menuproject/components/menuoptions.dart';

class MenuInherited extends InheritedWidget {

   MenuInherited({
    Key? key,
    required Widget child,
  }) : super(key: key, child: child);

  final List<MenuOptions> menuList = [

    MenuOptions('Pizza','12.00','https://static6.depositphotos.com/1160567/648/i/450/depositphotos_6482741-stock-photo-slice-of-pizza.jpg'),
    MenuOptions('Hot Dog','5.00','https://novonegocio.com.br/wp-content/uploads/2014/11/fazer-cachorro-quente.jpg'),
    MenuOptions('Sanduíche','8.00','https://conteudo.imguol.com.br/c/noticias/dd/2019/09/02/tentador-zero-beef-sanduiche-com-hamburguer-a-base-de-plantas-do-bobs-1567448386323_v2_450x600.jpg.webp'),

  ];

  void newMenu(String name, String price, String photo){
    menuList.add(MenuOptions(name, price, photo));
  }

  static MenuInherited of(BuildContext context) {
    final MenuInherited? result =
        context.dependOnInheritedWidgetOfExactType<MenuInherited>();
    assert(result != null, 'No MenuInherited found in context');
    return result!;
  }

  @override
  bool updateShouldNotify(MenuInherited oldWidget) {
    return oldWidget.menuList.length != menuList.length;
  }
}
