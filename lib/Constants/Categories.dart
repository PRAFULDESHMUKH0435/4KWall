import 'package:flutter/material.dart';
import 'package:fourkwall/Constants/Styles/appstyles.dart';
import 'package:fourkwall/Model/categorymodel.dart';

class CategoriesSection extends StatefulWidget {
  final categories;
  const CategoriesSection({super.key, required this.categories});

  @override
  State<CategoriesSection> createState() => _CategoriesSectionState();
}

class _CategoriesSectionState extends State<CategoriesSection> {
   

@override
  void initState() {
    // TODO: implement initState
    WidgetsBinding.instance.addPostFrameCallback((_){
      for(CategoryModel model in widget.categories){
        precacheImage(AssetImage(model.categoryimage), context);
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      body: GridView.builder(
        itemCount: widget.categories.length, 
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (context,index){
          return Card(
            shadowColor: Colors.red,
            color: Colors.white,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(12.0)),
                image: DecorationImage(image: AssetImage(widget.categories[index].categoryimage),fit: BoxFit.cover)
              ),
              child: Center(child: Text(widget.categories[index].categoryname,style:Appstyles.categorycardstyle,)),
            ),
          );
        },
      ),
    );
  }
}