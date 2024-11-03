import 'package:flutter/material.dart';
import 'package:fourkwall/Constants/ApiEndpoints.dart';
import 'package:fourkwall/Constants/Categories.dart';
import 'package:fourkwall/Constants/CustomDrawer.dart';
import 'package:fourkwall/Constants/ReUsableCardForImage.dart';
import 'package:fourkwall/Constants/Styles/appstyles.dart';
import 'package:fourkwall/Model/categorymodel.dart';
import 'package:fourkwall/Providers/dataservice.dart';
import 'package:hive/hive.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  final List<CategoryModel> tabNames = [
    CategoryModel(categoryname: "Nature", categoryimage: "assets/images/nature.jpg",categoryurl:UnsplashEndpoints.AllEndpoints[0]),
    CategoryModel(categoryname: "Cityscapes", categoryimage: "assets/images/cityscapes.jpg",categoryurl:UnsplashEndpoints.AllEndpoints[1]),
    CategoryModel(categoryname: "Architecture", categoryimage: "assets/images/architecture.jpg",categoryurl:UnsplashEndpoints.AllEndpoints[2]),
    CategoryModel(categoryname: "Animals", categoryimage: "assets/images/animals.jpg",categoryurl:UnsplashEndpoints.AllEndpoints[3]),
    CategoryModel(categoryname: "Technology", categoryimage: "assets/images/technology.jpg",categoryurl:UnsplashEndpoints.AllEndpoints[4]),
    CategoryModel(categoryname: "Food", categoryimage: "assets/images/food.jpg",categoryurl:UnsplashEndpoints.AllEndpoints[5]),
    CategoryModel(categoryname: "People", categoryimage: "assets/images/people.jpg",categoryurl:UnsplashEndpoints.AllEndpoints[6]),
    CategoryModel(categoryname: "Abstract Art", categoryimage: "assets/images/abstractart.jpg",categoryurl:UnsplashEndpoints.AllEndpoints[7]),
    CategoryModel(categoryname: "Sports", categoryimage: "assets/images/sports.jpg",categoryurl:UnsplashEndpoints.AllEndpoints[8]),
    CategoryModel(categoryname: "Travel", categoryimage: "assets/images/travel.jpg",categoryurl:UnsplashEndpoints.AllEndpoints[9]),
    CategoryModel(categoryname: "AI Art", categoryimage: "assets/images/ai.jpg",categoryurl:UnsplashEndpoints.AllEndpoints[10]),
    CategoryModel(categoryname: "Digital Art", categoryimage: "assets/images/digital.jpg",categoryurl:UnsplashEndpoints.AllEndpoints[11]),
    CategoryModel(categoryname: "Illustrations", categoryimage: "assets/images/illustrations.jpg",categoryurl:UnsplashEndpoints.AllEndpoints[12]),
    CategoryModel(categoryname: "World", categoryimage: "assets/images/world.jpg",categoryurl:UnsplashEndpoints.AllEndpoints[13]),
  ];

   DataService dataService = DataService();   

   LoadAllData() async{
    final hiveBox = await Hive.openBox("DataBox");
    print("All Length Is ${hiveBox.values.toList()}");
   } 

  
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: tabNames.length + 1, vsync: this); // Adjusted length
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
 @override
Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      title: const Text(
        "4K Wall",
        style: Appstyles.appbarstyle,
      ),
      actions: [
        IconButton(onPressed: () {}, icon: const Icon(Icons.search_outlined))
      ],
      backgroundColor: Colors.black.withOpacity(0.84),
      iconTheme: const IconThemeData(color: Colors.white),
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(48.0), // Height for the TabBar
        child: TabBar(
          controller: _tabController,
          isScrollable: true,
          indicatorColor: Colors.red,
          indicatorWeight: 4.0,
          labelColor: Colors.white,
          unselectedLabelColor: Colors.grey[400],
          tabs: [
            const Tab(
              child: Text(
                'Categories',
                style: TextStyle(color: Colors.white),
              ),
            ),
            ...tabNames.map((name) => Tab(text: name.categoryname)),
          ],
        ),
      ),
    ),
    drawer:  const CustomDrawer(),
    body: TabBarView(
      controller: _tabController,
      children: [
        Center(child: CategoriesSection(categories: tabNames,)),
        /// Second to Onwards Tabs
        ...tabNames.map((name) {
          return FutureBuilder(
            future: DataService.FetchData(name.categoryurl),
            builder: (context, snapshot) {
              print("Url Is ${name.categoryurl}");
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return const Center(child: Text("Error: Something Went Wrong"));
              } else if (snapshot.hasData) {
                final List<dynamic> data = snapshot.data as List<dynamic>; // Adjust the type as necessary
                return GridView.builder(
                  itemCount: data.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount:2),
                  itemBuilder: (context, index) {
                    final eachdata = data[index];
                    // Assuming eachdata contains the image URL you need
                    return ReUsableCardForGridImage(model: eachdata,title: name.categoryname,); // Adjust key as needed
                  },
                );
              } else {
                return const Center(child: Text("No data found"));
              }
            },
          );
        }),
      ],
    ),
  );
}

}
