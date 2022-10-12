import 'package:flutter/material.dart';
import 'package:hello_world/page/detail_article.dart';
import 'package:hello_world/page/list_product_page.dart';
import 'package:hello_world/page/review_page.dart';
import 'package:provider/provider.dart';
import 'model/product_model.dart';
import 'page/cart_page.dart';
import 'package:go_router/go_router.dart';
import 'model/cart_model.dart';

void main() {
  runApp(
      ChangeNotifierProvider<CartModel>(create: (_)=> CartModel([]),
          child: MyApp())
  );
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _router,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        //textTheme: TextTheme(titleLarge: ) -> redéfinir le titleLarge
      ),

    );
  }

  final GoRouter _router = GoRouter(
    initialLocation: '/list',
    routes: <GoRoute>[
      GoRoute(
        path: '/list',
        builder: (_, state) {
          return ListProductPage();
        },
        routes:[
          GoRoute(
            path: 'cart',
            builder: (_, state) {
              return CartPage();
            },
          ),
          GoRoute(
            path: 'detail',
            builder: (_, state) {
              return DetailArticle(state.extra as Product);
            },
            routes: [
              GoRoute(
                path: 'avis',
                builder: (_,state){
                    return ReviewPage(state.extra as Product);
                }
              )
            ]
          ),
        ],
      )
    ],
  );
}
