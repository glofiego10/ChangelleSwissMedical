import 'package:auto_route/auto_route.dart';
import 'package:challenge_swiss/feature/home/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';

@RoutePage()
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              SizedBox(height: 20),
              PopularView(),
              SizedBox(height: 20),
              TopRatedView(),
              SizedBox(height: 20),
              UpcomingView(),
            ],
          ),
        ),
      ),
    );
  }
}
