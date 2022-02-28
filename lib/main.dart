import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'player_file.dart';

void main(){
  runApp(MyApp());
  
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Music Player",
      home: HomePage(
        //color: Colors.amber,

      ),

    );
  }
}

class HomePage extends StatelessWidget{
  @override //L'annotation @override marque un membre d'instance comme remplaçant un membre de superclasse portant le même nom.
  Widget build(BuildContext context){
    return Scaffold(
      extendBodyBehindAppBar: true, // permet d'etendre le corps jusqu'en haut de l'appli
      appBar: MyAppBar(),
      body: SingleChildScrollView( // contenu de la page
        child: Column(
          children: [
            HeaderSection(),
            PlaylistSection(),


          ],
        ),
        //child: Text('Hello World'),
      ),
      bottomNavigationBar: BottomSection(),

    ); // retourne une page
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

class MyAppBar extends StatelessWidget implements PreferredSizeWidget{
  Size get preferredSize => new Size.fromHeight(60);

  @override //L'annotation @override marque un membre d'instance comme remplaçant un membre de superclasse portant le même nom.
  Widget build(BuildContext context){
    return AppBar(
        elevation: 0, // permet de masquer l'app barre
        leading: IconButton(//action principale bouton a gauche
          icon: Icon(
            Icons.menu,
            color: Colors.white,
            size: 25,
          ),
          onPressed: null,
        ),
        actions: [
          IconButton(//bouton a droite
          icon: Icon(
            Icons.more_vert,
            color: Colors.white,
            size: 25,
          ),
            onPressed: null,),
        ],
      backgroundColor: Colors.white.withOpacity(0),



      );
  }

}

class HeaderSection extends StatelessWidget {
  @override
  Widget build(BuildContext context){
    return Container(
      height: 500,
      decoration: BoxDecoration(
        color: Colors.greenAccent,
        image: DecorationImage(
            image: AssetImage('images/cliff.jpg'),
            fit: BoxFit.cover,
        ),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(50),
        )



      ),
      child: Stack(children: [
        
        Positioned(
            left: 20,
            bottom: 30,
            child: Text('Cliff \n on the sea',
            style: GoogleFonts.arizonia(
              color: Colors.white,
              fontSize: 50,
              fontWeight: FontWeight.w800,

            ),),
        ),
        Positioned(
          right: 0,
          bottom: 20,
          child:
            MaterialButton(
              color: Colors.blue,
              shape: CircleBorder(),
              onPressed: (){
                print('Ouvre la page Player');
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => PlayerFile())
                );
              },
              child: Padding(
              padding: EdgeInsets.all(17),
              child: Icon(
                Icons.play_arrow_rounded,
                size: 30,
                color: Colors.white,
              ),
        ),
            ))

      ],
      ),


    );

  }
}

class PlaylistSection extends StatelessWidget {
  final List playList =[
    {
      'title':'Pignons de pin',
      'duration':'3:16',
      'Isplayed':false,

    },

    {
      'title':'Boquette',
      'duration':'3:14',
      'Isplayed':false,

    },
    {
      'title':'Gum12',
      'duration':'2:21',
      'Isplayed':true,

    },
    {
      'title':'Avène',
      'duration':'1:16',
      'Isplayed':false,

    },

    {
      'title':'Bienvenue',
      'duration':'2:16',
      'Isplayed':false,

    },


  ];
  @override
  Widget build(BuildContext context){
    return Container(
      padding: EdgeInsets.fromLTRB(30, 40, 20, 20),
      child: Column(
        children: [
          //Container(height: 100,color: Colors.green,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Popular',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 25,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Container(
                margin: EdgeInsets.only(right: 10),
                child: Text('Show all',
                style: TextStyle(
                  color: Colors.blue,
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                ),),

              )
            ],
          ),
          SizedBox(height: 20),
          Column(children: playList.map((song){
            return Container(
              height: 100,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [

                Text(song['title'],style: TextStyle(// ppur changer la couleur en fonction de la variable played true false
                    color: song['Isplayed']
                        ? Colors.blue
                        : Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w400,


                ),
                ), // ? alors : else
                Row(children: [
                  Text(song['duration'],style: TextStyle(// ppur changer la couleur en fonction de la variable played true false
                    color: song['Isplayed']
                        ? Colors.blue
                        : Colors.black,
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),),
                  Icon(Icons.more_vert, color: song['Isplayed']
                      ? Colors.blue
                      : Colors.grey,)
                ],)

              ],)
            );
          }
          ).toList(),



          )

        ],

      ),
    );

  }
}