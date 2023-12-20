import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../bloc/beer_cubit/beer_cubit.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BeerCubit(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Listado'),
        ),
        body: BlocBuilder<BeerCubit, BeerState>(builder: (context, state) {
          if (state.isLoading) {
            return const Center(child: CircularProgressIndicator());
          } else {
            return ListView.builder(
              itemCount: state.beers.length,
              itemBuilder: ((context, index) {
                return ListTile(
                  leading: Image.network(state.beers[index].imageUrl),
                  title: Text(state.beers[index].name),
                  subtitle: Text(state.beers[index].tagline),
                  trailing: const Icon(Icons.arrow_forward_ios_rounded),
                  onTap: () {
                    GoRouter.of(context).push(
                        '/description/${state.beers[index].id.toString()}',
                      );
                  }
                );
              }),
            );
          }
        }),
      ),
    );
  }
}