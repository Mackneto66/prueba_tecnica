import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../bloc/beer_cubit/item_beer_cubit.dart';

class DescriptionView extends StatelessWidget {
  final String id;
  const DescriptionView({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ItemBeerCubit(),
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              GoRouter.of(context).push('/');
            },
          ),
          title: Text('Description Item $id'),
        ),
        body: BlocBuilder<ItemBeerCubit, ItemBeerState>(
          builder: (context, state) {
            context.read<ItemBeerCubit>().getBeer(id);
            if (state.isLoading) {
              return const Center(child: CircularProgressIndicator());
            } else {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                      width: 50, child: Image.network(state.beers!.imageUrl)),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(state.beers!.name),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(state.beers!.tagline),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(state.beers!.description),
                ],
              );
            }
          },
        ),
      ),
    );
  }
}
