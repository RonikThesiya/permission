import 'package:flutter/material.dart';
import 'package:permission/home_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  HomeProvider? homeProvidertrue;
  HomeProvider? homeProviderfalse;
  @override
  Widget build(BuildContext context) {

    homeProviderfalse = Provider.of<HomeProvider>(context,listen: false);
    homeProvidertrue = Provider.of<HomeProvider>(context,listen: true);

    return SafeArea(child: Scaffold(
      appBar: AppBar(
        title: Text("Permission"),
        actions: [
          IconButton(onPressed: ()async{

            Map<Permission,PermissionStatus> map =
            await[Permission.location,Permission.camera].request();

            if(await Permission.camera.isDenied)
              {
                print("Permission Denny");
              }
            if(await Permission.location.isDenied)
              {
                print("Location Denny");
              }

          }, icon: Icon(Icons.camera_alt))
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(onPressed: (){

              homeProviderfalse!.getlocation();
            }, child: Text("Get Location")),
            SizedBox(height: 50),

            Text("${homeProvidertrue!.long}   /  ${homeProvidertrue!.lat} "),
            Text("${homeProvidertrue!.p1}"),
          ],
        ),
      ),
    ));
  }
}
