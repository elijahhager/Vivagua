// import 'data.dart';
// class AddDiveSitePage extends StatefulWidget {
//   const AddDiveSitePage({Key key}) : super(key: key);
//   @override
//   _AddDiveSitePageState createState() => new _AddDiveSitePageState();
// }

// enum AppBarBehavior { normal, pinned, floating, snapping }

// class _AddDiveSitePageState extends State<AddDiveSitePage>{
//   AnimationController _containerController;
//   Animation<double> width;
//   Animation<double> heigth;
//   _AddDiveSitePageState({});
//   List diveSites = diveItems;
//   double _appBarHeight = 350;
//   AppBarBehavior _appBarBehavior = AppBarBehavior.pinned;

//   void initState() {
//     _containerController = new AnimationController(
//         duration: new Duration(milliseconds: 2000), vsync: this);
//     super.initState();
//     width = new Tween<double>(
//       begin: 200.0,
//       end: 220.0,
//     ).animate(
//       new CurvedAnimation(
//         parent: _containerController,
//         curve: Curves.ease,
//       ),
//     );
//     heigth = new Tween<double>(
//       begin: 400.0,
//       end: 400.0,
//     ).animate(
//       new CurvedAnimation(
//         parent: _containerController,
//         curve: Curves.ease,
//       ),
//     );
//     heigth.addListener(() {
//       setState(() {
//         if (heigth.isCompleted) {}
//       });
//     });
//     _containerController.forward();
//   }

//   @override
//   void dispose() {
//     _containerController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     timeDilation = 0.7;
//     int img = data.indexOf(spe); // spe used to be type
//     //print("detail");
//     return new Theme(
//       data: new ThemeData(
//         brightness: Brightness.light,
//         primaryColor: const Color(0xff2298f2),
//         platform: Theme.of(context).platform,
//       ),
//       child: new Container(
//         width: width.value,
//         height: heigth.value,
//         color: new Color(0xff2298f2),
//         child: new Hero(
//           tag: "img",
//           child: new Card(
//             color: Colors.transparent,
//             child: new Container(
//               alignment: Alignment.center,
//               width: width.value,
//               height: heigth.value,
//               decoration: new BoxDecoration(
//                 color: Colors.white,
//                 borderRadius: new BorderRadius.circular(10.0),
//               ),
//               child: new Stack(
//                 alignment: AlignmentDirectional.bottomCenter,
//                 children: <Widget>[
//                   new CustomScrollView(
//                     shrinkWrap: false,
//                     slivers: <Widget>[
//                       new SliverAppBar(
//                         elevation: 0.0,
//                         forceElevated: true,
//                         leading: new IconButton(
//                           onPressed: () {
//                             Navigator.of(context).pop();
//                           },
//                           icon: new Icon(
//                             Icons.arrow_back,
//                             color: Colors.white,
//                             size: 45.0,
//                           ),
//                         ),
//                         expandedHeight: _appBarHeight,
//                         pinned: _appBarBehavior == AppBarBehavior.pinned,
//                         floating: _appBarBehavior == AppBarBehavior.floating ||
//                             _appBarBehavior == AppBarBehavior.snapping,
//                         snap: _appBarBehavior == AppBarBehavior.snapping,
//                         flexibleSpace: new FlexibleSpaceBar(
//                           title: new Text(spe.name),
//                           background: new Stack(
//                             fit: StackFit.expand,
//                             children: <Widget>[
//                               new Container(
//                                 width: width.value,
//                                 height: _appBarHeight,
//                                 decoration: new BoxDecoration(
//                                   image: data[img].image,
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ),
//                       new SliverList(
//                         delegate: new SliverChildListDelegate(<Widget>[
//                           new Container(
//                             color: Colors.white,
//                             child: new Padding(
//                               padding: const EdgeInsets.all(35.0),
//                               child: new Column(
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: <Widget>[
//                                   new Container(
//                                     padding: new EdgeInsets.only(bottom: 20.0),
//                                     alignment: Alignment.center,
//                                     decoration: new BoxDecoration(
//                                         color: Colors.white,
//                                         border: new Border(
//                                             bottom: new BorderSide(
//                                                 color: Colors.black12))),
//                                     child: new Row(
//                                       mainAxisAlignment:
//                                           MainAxisAlignment.end,
//                                       children: <Widget>[
//                                         new Row(
//                                           children: <Widget>[
//                                             new Icon(
//                                               Icons.brightness_1,
//                                               color: spe.color,
//                                             ),
//                                             new Padding(
//                                               padding:
//                                                   const EdgeInsets.all(8.0),
//                                              child: new Text(spe.status),
//                                             )
//                                           ],
//                                         ),
//                                       ],
//                                     ),
//                                   ),
//                                   new Padding(
//                                     padding: const EdgeInsets.only(
//                                         top: 16.0, bottom: 8.0),
//                                     child: new Text(
//                                       "ABOUT",
//                                       style: new TextStyle(
//                                           fontWeight: FontWeight.bold),
//                                     ),
//                                   ),
//                                   new Text(spe.about, style: new TextStyle(fontSize: 16),),
//                                   new Container(
//                                     margin: new EdgeInsets.only(top: 25.0),
//                                     padding: new EdgeInsets.only(
//                                         top: 5.0, bottom: 10.0),
//                                     height: 120.0,
//                                     decoration: new BoxDecoration(
//                                         color: Colors.white,
//                                         border: new Border(
//                                             top: new BorderSide(
//                                                 color: Colors.black12))),
//                                     child: new Column(
//                                       mainAxisAlignment:
//                                           MainAxisAlignment.spaceEvenly,
//                                       crossAxisAlignment:
//                                           CrossAxisAlignment.start,
//                                       children: <Widget>[
//                                         new Text(
//                                           "Unique Characteristics",
//                                           style: new TextStyle(
//                                               fontWeight: FontWeight.bold),
//                                         ),
//                                         new Row(
//                                           mainAxisAlignment:
//                                               MainAxisAlignment.spaceAround,
//                                           crossAxisAlignment:
//                                               CrossAxisAlignment.start,
//                                           children: <Widget>[
//                                             new CircleAvatar(
//                                                 backgroundImage: avatar1),
//                                             new CircleAvatar(
//                                               backgroundImage: avatar2,
//                                             ),
//                                             new CircleAvatar(
//                                               backgroundImage: avatar3,
//                                             ),
                                            
//                                           ],
//                                         )
//                                       ],
//                                     ),
//                                   ),
//                                   new Container(
//                                     height: 100.0,
//                                   )
//                                 ],
//                               ),
//                             ),
//                           ),
//                         ]),
//                       ),
//                     ],
//                   ),

//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }