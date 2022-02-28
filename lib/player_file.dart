import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class PlayerFile extends StatelessWidget{
  @override //L'annotation @override marque un membre d'instance comme remplaçant un membre de superclasse portant le même nom.
  Widget build(BuildContext context){
    return Scaffold(
      appBar: MyAppBar(),
      extendBodyBehindAppBar: true, // permet d'etendre le corps jusqu'en haut de l'appli
      body: Container(),
      bottomNavigationBar: BottomSection(),


    ); // retourne une page
  }

}

class MyAppBar extends StatelessWidget implements PreferredSizeWidget{
  Size get preferredSize => new Size.fromHeight(60);

  @override //L'annotation @override marque un membre d'instance comme remplaçant un membre de superclasse portant le même nom.
  Widget build(BuildContext context){
    return AppBar(
      elevation: 0, // permet de masquer l'app barre
      leading: IconButton(//action principale bouton a gauche
        icon: Icon(
          Icons.arrow_back,
          color: Colors.black,
          size: 26,
        ),
        onPressed: null,
      ),
      actions: [
        IconButton(//bouton a droite
          icon: Icon(
            Icons.more_vert,
            color: Colors.black,
            size: 25,
          ),
          onPressed: null,),
      ],
      backgroundColor: Colors.white.withOpacity(0),



    );
  }

}


class BottomSection extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return BottomNavigationBar(
      backgroundColor: Colors.blue,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.pause, color: Colors.white,),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: Text("Gum 12", style :TextStyle(color : Colors.white),),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.arrow_upward, color: Colors.white,),
          label: '',
        ),
      ],);
  }
}
