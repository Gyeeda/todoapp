import 'package:flutter/material.dart';
import 'package:flutter_application_2/utils.dart';
import 'package:skeleton_text/skeleton_text.dart';

class Todo_Tile extends StatelessWidget {
  const Todo_Tile({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: SkeletonAnimation(
        shimmerColor: customColor(date: 'appbarColor'),
        child: Card(
          child: Row(
            children: [
            const Expanded(
              child:  Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.0),
                child: Icon(
                    Icons.check_circle_outline),
              ),
            ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children:  [
                      const SizedBox(height: 10,),
                      Text('Trip to maldives', 
                      style: TextStyle(color: customColor(date: 'appbarColor'),
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0,
                      ),),
                     const Text('the trip will last a week',
                     maxLines: 2,
                     overflow: TextOverflow.ellipsis,
                     ),
                     const SizedBox(width: 10.0,)
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal:8.0),
                        child: Icon(Icons.notifications,size: 16.0,
                        color: customColor(date: 'Tomorrow'),
                     
                        ),
                      ),
                      Text(
                        'Tomorrow',
                        style: TextStyle(
                          color: customColor(date: 'Tomorrow'),
                        ),
                      )
                     
                    ],
                  ),
                )
                ],
                
          ),
        ),
      ),
    );
  }
}