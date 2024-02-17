import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:katib_kashi/models/card.dart';
import 'package:katib_kashi/utils/constants.dart';
import 'package:katib_kashi/view_models/cards_view_model.dart';
import 'package:provider/provider.dart';

// List<CardModel> cardsList = [];

int? selectedCardNumber;

// List<Widget> cardsSlider = cardsList
//     .map(
//       (card) => Container(
//         margin: const EdgeInsets.all(5.0),
//         width: 800,
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(20),
//           gradient: const LinearGradient(
//             colors: [
//               kSecondary,
//               kPrimary,
//             ],
//             begin: Alignment.topLeft,
//             end: Alignment.bottomRight,
//           ),
//         ),
//         child: Padding(
//           padding: const EdgeInsets.all(15.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Expanded(
//                 child: Text(
//                   card.cardOwnerName,
//                   style: const TextStyle(
//                     fontSize: 18,
//                     fontWeight: FontWeight.bold,
//                     color: kWhite,
//                   ),
//                 ),
//               ),
//               const SizedBox(height: 30),
//               Text(
//                 '****    ****    ****    ${card.cardNumber}',
//                 style: const TextStyle(
//                   fontSize: 16,
//                   fontWeight: FontWeight.w500,
//                   color: kWhite,
//                 ),
//               ),
//               const SizedBox(height: 18),
//               const Text(
//                 'Current Balance',
//                 style: TextStyle(
//                   fontSize: 16,
//                   fontWeight: FontWeight.w500,
//                   color: kWhite,
//                 ),
//               ),
//               const SizedBox(height: 8.0),
//               Text(
//                 '${card.cardCurrentBalance}',
//                 style: const TextStyle(
//                   fontSize: 16,
//                   fontWeight: FontWeight.w500,
//                   color: kWhite,
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     )
//     .toList();

class CustomSlider extends StatefulWidget {
  const CustomSlider({super.key});

  @override
  State<CustomSlider> createState() => _CustomSliderState();
}

class _CustomSliderState extends State<CustomSlider> {
  int _current = 0;
  final CarouselController _controller = CarouselController();

  @override
  Widget build(BuildContext context) {
    selectedCardNumber =
        Provider.of<CardsViewModel>(context).getCardNumber(_current);
    return Column(
      children: [
        const SizedBox(height: 50),
        Consumer<CardsViewModel>(
          builder: (context, model, child) {
            return CarouselSlider(
              items: model.allCards
                  .map(
                    (card) => Container(
                      margin: const EdgeInsets.all(5.0),
                      width: 800,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        gradient: const LinearGradient(
                          colors: [
                            kSecondary,
                            kPrimary,
                          ],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Text(
                                card.cardOwnerName,
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: kWhite,
                                ),
                              ),
                            ),
                            const SizedBox(height: 30),
                            Text(
                              '****    ****    ****    ${card.cardNumber}',
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: kWhite,
                              ),
                            ),
                            const SizedBox(height: 18),
                            const Text(
                              'Current Balance',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: kWhite,
                              ),
                            ),
                            const SizedBox(height: 8.0),
                            Text(
                              '${card.cardCurrentBalance}',
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: kWhite,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                  .toList(),
              carouselController: _controller,
              options: CarouselOptions(
                  autoPlay: false,
                  enlargeCenterPage: true,
                  aspectRatio: 2.0,
                  onPageChanged: (index, reason) {
                    selectedCardNumber = model.getCardNumber(index);
                    setState(() {
                      _current = index;

                      debugPrint(
                          'when it selected from the slider $selectedCardNumber');
                    });
                  }),
            );
          },
        ),
        Consumer<CardsViewModel>(
          builder: (context, model, child) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: model.allCards.asMap().entries.map((entry) {
                return GestureDetector(
                  onTap: () => _controller.animateToPage(entry.key),
                  child: Container(
                    width: 12.0,
                    height: 12.0,
                    margin: const EdgeInsets.symmetric(
                        vertical: 8.0, horizontal: 4.0),
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: (Theme.of(context).brightness == Brightness.dark
                                ? Colors.white
                                : Colors.blue)
                            .withOpacity(_current == entry.key ? 0.9 : 0.4)),
                  ),
                );
              }).toList(),
            );
          },
        ),
      ],
    );
  }
}
