import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_base_architecture/ui/base_widget.dart';
import 'package:graphql/client.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:provider/provider.dart';
import 'di/providers.dart';
import 'flutter_graphql_landing_page_application.dart';
import 'flutter_graphql_landing_page_application_viewmodel.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initHiveForFlutter();
  runApp(
      MultiProvider(
        providers: providers,
        child: MainAppWidget(),
      ));
}

class MainAppWidget extends StatelessWidget {
  ValueNotifier<GraphQLClient> graphQLClient = ValueNotifier(
    GraphQLClient(
      link: HttpLink('https://rickandmortyapi.com/graphql'),
      cache: GraphQLCache(
        store: HiveStore(),
      ),
    ),
  );

  @override
  Widget build(context) {
    return BaseWidget<FlutterGraphQLLandingPageApplicationViewModel>(
        viewModel: FlutterGraphQLLandingPageApplicationViewModel(),
        onModelReady: (m) {},
        builder: (context, model, _) {
         return GraphQLProvider(
            client: graphQLClient,
            child: FlutterGraphQLLandingPageApplication(),
          );

        });
  }
}

