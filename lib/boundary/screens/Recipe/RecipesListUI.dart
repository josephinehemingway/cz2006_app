import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_app/control/Authenticator.dart';
import '../../widgets/RecipeWidgets/RecipeCard.dart';
import 'package:flutter_app/entity/Recipe.dart';
import 'package:flutter_app/entity/CurrentUser.dart';
import '../../widgets/customAppBar.dart';
import '../Home/HomeUI.dart';
import '../../widgets/bottomNavBar.dart';
import '../../widgets/animation.dart';
import 'package:flutter_app/control/APIRecipeGenerator.dart';
import 'package:percent_indicator/percent_indicator.dart';


class HealthyRecipesList extends StatefulWidget {
  static String routeName = '/recipeList';
  @override
  _HealthyRecipesListState createState() => _HealthyRecipesListState();
}

class _HealthyRecipesListState extends State<HealthyRecipesList> with SingleTickerProviderStateMixin {

  CurrentUser user= CurrentUser();
  List<Widget> recipeData = [];

  ScrollController _scrollController;
  TabController _tabController;
  int currentIndex = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _scrollController = ScrollController();
    _tabController = TabController(length: recipeData.length, vsync: this);
    _tabController.addListener(_smoothScrollToTop);
  }

  _smoothScrollToTop() {
    if (_scrollController.hasClients)
      _scrollController.animateTo(
        0,
        duration: Duration(microseconds: 300),
        curve: Curves.ease,
      );
  }

  void changePage(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  nested() {
    var userPreferenceList=[];
    int size=5;
    return NestedScrollView(
      controller: _scrollController,
      headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
        return <Widget>[
          recipeListAppBar('Healthy Recipes',
              'These healthy recipes are tailored to your preferences and will help you lead a healthier lifestyle!',
              context, HomeUI(),
              'images/appbar_recipe.png'),
        ];
      },
      body: Container(
        child: FutureBuilder<DataSnapshot>(
          future: FirebaseDatabase.instance.reference().child('User/${getUserID()}/preferences').once(),
          builder: (context, snapshot) {
            if (snapshot.hasData && snapshot.data.value != null) {
              userPreferenceList = snapshot.data.value;
            }
            else {
              userPreferenceList= [];
            }

          return FutureBuilder<List<Recipe>>(
            future: APIRecipeGenerator.instance.getListOfRecipe(3,userPreferenceList),
            builder: (context, snapshot) {
          if (snapshot.hasData) {
            final recipelist = snapshot.data;
            for (int i=0; i<3;i++) {
              var title = recipelist[i].title;
              var id = recipelist[i].id;
              var url = recipelist[i].image;
              var duration = recipelist[i].readyInMinutes;
              var summary = recipelist[i].summary;
              final start = "contains <b>";
              final end = "calories";
              final startIndex = summary.indexOf(start);
              final endIndex = summary.indexOf(end);
              var calories = summary.substring(startIndex + start.length, endIndex).trim();

              recipeData.add(RecipeCard(
                imageUrl: url,
                title: title,
                id: id,
                duration: duration,
                calories: calories,));
            }
            return ListView.builder(
              itemCount: recipeData.length,
              physics: BouncingScrollPhysics(),
              itemBuilder: (context, index){
                return FadeAnimation_Y(0.1, recipeData[index]);
              },
              padding:EdgeInsets.symmetric(horizontal: 10),
            );
          } else if (snapshot.hasError) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text("No Recipes Found", textAlign: TextAlign.center, style: TextStyle(fontSize: 24, color: Colors.grey[800]),),
                  SizedBox(height: 20),
                  // Text(snapshot.error.toString(), textAlign: TextAlign.center,),
                  SizedBox(height: 40),
            ]);
          }

          return CircularPercentIndicator(
            radius: 40.0,
            lineWidth: 4.0,
            percent: 1.0,
            progressColor: Colors.teal,
          );
        });
          }
      ),
        )
    );
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    resizeToAvoidBottomInset: false,
    bottomNavigationBar: BottomNavBar(selectedMenu: MenuState.recipe),
    body: nested(),
    floatingActionButton: FloatingActionButton(
      child: Icon(Icons.refresh),
      backgroundColor: Colors.teal[300],

      onPressed: () {

      },),
    );
}
