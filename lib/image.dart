import 'package:flutter/material.dart';
import 'package:mcqquiz/image.dart';

 class Image extends StatelessWidget {
   const Image({super.key, required NetworkImage image});
 
   @override
   Widget build(BuildContext context) {
     
 
    return Scaffold(
      backgroundColor: Colors.blueAccent,
      appBar: AppBar(

        centerTitle: true,
        title:  Text("Varanasi Software Junction"),
        backgroundColor: Colors.blueGrey,
      ),

      body:
        image: NetworkImage(
            "https://3.bp.blogspot.com/-py5FbTZgvjo/YDi1bsQq16I/AAAAAAAACB0/BxejbJBcHA4AVfkB33WYC3YlVmxElM7BwCK4BGAYYCw/s1600/Varanasi%2BSoftware%2BJunction%2BPhone%2BLogo.png"),
      ),
      ),

    );
  }
}
