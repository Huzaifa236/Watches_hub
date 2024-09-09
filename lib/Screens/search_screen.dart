import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:watches_hub/Screens/product_detail_screen.dart';

import '../Constants/app_colors.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _searchController = TextEditingController();
  String _searchQuery = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search Products'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: _searchController,
              decoration: const InputDecoration(
                labelText: 'Search',
                border: OutlineInputBorder(),
              ),
              onChanged: (query) {
                setState(() {
                  _searchQuery = query;
                });
              },
            ),
          ),
          Expanded(
            child: StreamBuilder<QuerySnapshot>(
              stream: ( _searchQuery.isEmpty )
                  ? FirebaseFirestore.instance.collection('Products').snapshots()
                  : FirebaseFirestore.instance
                  .collection('Products')
                  .where('product_name', isGreaterThanOrEqualTo: _searchQuery)
                  .where('product_name', isLessThanOrEqualTo: '$_searchQuery\uf8ff')
                  .snapshots(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                }

                if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                  return const Center(child: Text('No results found'));
                }

                final data = snapshot.data!.docs;

                return SizedBox(
                  child: GridView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      itemCount:snapshot.data!.docs.length ,
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 5,
                          childAspectRatio: 2,
                          mainAxisExtent: 200,
                          mainAxisSpacing: 10
                      ), itemBuilder: (context,index){
                    var data = snapshot.data!.docs[index];
                    return GestureDetector(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context){
                          return  ProductDetailScreen(data: data,);
                        }));
                      },
                      child: Card(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: Column(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                    color: AppColors.buttonColor,
                                    borderRadius: BorderRadius.circular(20),
                                    image: DecorationImage(

                                        fit: BoxFit.cover,
                                        image:NetworkImage(data["product_image"],))
                                ),
                                height: 100,
                                width: 100,
                              ),
                              Center(child: Text(data["product_name"],
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(color: Colors.black,fontSize: 25),)),
                              Text("Price: ${data['product_price']}",style: const TextStyle(color: Colors.black,fontSize: 20))
                            ],
                          ),
                        ),
                      ),
                    );
                  }),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
