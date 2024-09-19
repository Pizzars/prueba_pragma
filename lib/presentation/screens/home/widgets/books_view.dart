import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prueba_data_center/config/config.dart';
import 'package:prueba_data_center/presentation/screens/widgets/space_app.dart';
import 'package:prueba_data_center/presentation/screens/widgets/texts/title_small_app.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../blocs/books/books_cubit.dart';
import '../../widgets/buttons/button_app.dart';
import '../../widgets/texts/TextApp.dart';

class BooksView extends StatefulWidget {
  const BooksView({Key? key}) : super(key: key);

  @override
  State<BooksView> createState() => _BooksViewState();
}

class _BooksViewState extends State<BooksView>
    with SingleTickerProviderStateMixin {
  late final PageController _movieCardPageController;
  late final PageController _movieDetailPageController;

  double _movieCardPage = 0.0;
  double _movieDetailsPage = 0.0;
  int _movieCardIndex = 0;
  final _showMovieDetails = ValueNotifier(true);

  @override
  void initState() {
    _movieCardPageController = PageController(viewportFraction: 0.77)
      ..addListener(_movieCardPagePercentListener);
    _movieDetailPageController = PageController()
      ..addListener(_movieDetailsPagePercentListener);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (_, constraints) {
        final h = constraints.maxHeight;
        // final w = constraints.maxWidth;

        return BlocBuilder<BooksCubit, BooksState>(
            builder: (context, state){
              final books = state.books ?? state.news ?? [];
              return  Column(
                children: [
                  const Spacer(),
                  //* Movie Cards
                  SizedBox(
                    height: h * 0.5,
                    child: PageView.builder(
                      controller: _movieCardPageController,
                      clipBehavior: Clip.none,
                      itemCount: books.length,
                      onPageChanged: (page) {
                        _movieDetailPageController.animateToPage(
                          page,
                          duration: const Duration(milliseconds: 500),
                          curve: const Interval(0.25, 1, curve: Curves.decelerate),
                        );
                      },
                      itemBuilder: (_, index) {
                        final book = books[index];
                        final progress = (_movieCardPage - index);
                        final scale = ui.lerpDouble(1, .8, progress.abs())!;
                        final isCurrentPage = index == _movieCardIndex;
                        final isScrolling = _movieCardPageController
                            .position.isScrollingNotifier.value;
                        final isFirstPage = index == 0;

                        return Transform.scale(
                          alignment: Alignment.lerp(
                            Alignment.topLeft,
                            Alignment.center,
                            -progress,
                          ),
                          scale: isScrolling && isFirstPage ? 1 - progress : scale,
                          child: GestureDetector(
                            child: Hero(
                              tag: book.image,
                              child: AnimatedContainer(
                                duration: const Duration(milliseconds: 300),
                                curve: Curves.easeInOut,
                                transform: Matrix4.identity()
                                  ..translate(
                                    isCurrentPage ? 0.0 : -20.0,
                                    isCurrentPage ? 0.0 : 60.0,
                                  ),
                                decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(70),
                                  ),
                                  color: ColorsApp.textColor.withOpacity(0.3),
                                  boxShadow: [
                                    BoxShadow(
                                      blurRadius: 25,
                                      offset: const Offset(0, 25),
                                      color: Colors.black.withOpacity(.2),
                                    ),
                                  ],
                                  image: DecorationImage(
                                    image: NetworkImage(book.image),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  const Spacer(),
                  //* Movie Details
                  SizedBox(
                    height: h * 0.3,
                    child: PageView.builder(
                      controller: _movieDetailPageController,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: books.length,
                      itemBuilder: (_, index) {
                        final book = books[index];
                        final opacity = (index - _movieDetailsPage).clamp(0.0, 1.0);

                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 0),
                          child: Opacity(
                            opacity: 1 - opacity,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Hero(
                                  tag: book.title,
                                  child: Material(
                                    type: MaterialType.transparency,
                                    child: TitleSmall(text: book.title.toUpperCase(), color: ColorsApp.primary, overflow: true,),
                                  ),
                                ),
                                ValueListenableBuilder<bool>(
                                  valueListenable: _showMovieDetails,
                                  builder: (_, value, __) {
                                    return Visibility(
                                      visible: value,
                                      child: Column(
                                        children: [
                                          TextApp(text: book.subtitle, overflow: true,),
                                          const SpaceApp(),
                                          Center(
                                            child: Row(
                                              children: [
                                                TitleSmall(text: 'Precio: ${book.price}', color: ColorsApp.primary,),
                                                const SpaceApp(space: 2, horizontal: true,),
                                                Flexible(
                                                  child: ButtonApp(
                                                    text: 'Comprar',
                                                    onPressed: (){
                                                      launchUrl(Uri.parse(book.url), mode: LaunchMode.externalApplication);
                                                    },
                                                  ),
                                                )
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                    );
                                  },
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              );
            }
        );
      },
    );
  }

  _movieCardPagePercentListener() {
    setState(() {
      _movieCardPage = _movieCardPageController.page!;
      _movieCardIndex = _movieCardPageController.page!.round();
    });
  }

  _movieDetailsPagePercentListener() {
    setState(() {
      _movieDetailsPage = _movieDetailPageController.page!;
    });
  }

  @override
  void dispose() {
    _movieCardPageController
      ..removeListener(_movieCardPagePercentListener)
      ..dispose();
    _movieDetailPageController
      ..removeListener(_movieDetailsPagePercentListener)
      ..dispose();
    super.dispose();
  }
}