import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/widget/loader.dart';
import '../bloc/product_bloc.dart';
import '../widget/animation_list.dart';
import 'page2.dart';

class Home extends StatefulWidget {
  final bool isFitched;
  const Home({super.key, required this.isFitched});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    if (!widget.isFitched) {
      // تشغيل الفانكشن في البلوك
      context.read<ProductBloc>().add(const ProductEventFitch());
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(
          parent: AlwaysScrollableScrollPhysics(),
        ),
        slivers: [
          // app bar with iOS theme
          CupertinoSliverNavigationBar(
            largeTitle: const Text('Bloc Example'),
            trailing: IconButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      CupertinoPageRoute(
                        builder: (context) => const Page2(),
                      ));
                },
                icon: const Icon(Icons.add_a_photo_outlined)),
          ),

          // the pull-to-refresh Cupertino indicator
          CupertinoSliverRefreshControl(
            onRefresh: () async {
              context.read<ProductBloc>().add(const ProductEventFitch());
            },
          ),

          // fitch all Products list
          // listener, not render box 
          BlocConsumer<ProductBloc, RemoteProductState>(
            // not refresh to ui
            listener: (context, state) {
              if (state is RemoteProductFailure) {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text(state.error!),
                ));
              }
            },
            builder: (context, state) {
              if (state is RemoteProductLoading) {
                return const SliverFillRemaining(child: Loader());
              }
              if (state is RemoteProductSuccess) {
                return AnimationList(
                  isFitched: widget.isFitched,
                  products: state.products!,
                );
              }
              return const SliverFillRemaining(
                child: Center(
                  child: Text('there is no data'),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
