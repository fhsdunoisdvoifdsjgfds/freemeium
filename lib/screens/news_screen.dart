import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../models/nw.dart';
import '../widgets/category_button.dart';
import '../widgets/my_btn.dart';
import '../widgets/text_title.dart';
import 'news_read_screen.dart';

String fft = '&external_id=';

class NewsScreen extends StatefulWidget {
  const NewsScreen({super.key});

  @override
  State<NewsScreen> createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  String current = 'Economy';

  void onCategory(String value) {
    setState(() {
      current = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.zero,
      children: [
        SizedBox(height: 34 + MediaQuery.of(context).viewPadding.top),
        const TextTitle('News'),
        const SizedBox(height: 20),
        Row(
          children: [
            const SizedBox(width: 14),
            CategoryButton(
              title: 'Economy',
              current: current,
              onPressed: () {
                onCategory('Economy');
              },
            ),
            const SizedBox(width: 16),
            CategoryButton(
              title: 'Analytics',
              current: current,
              onPressed: () {
                onCategory('Analytics');
              },
            ),
            const SizedBox(width: 16),
            CategoryButton(
              title: 'Statistics',
              current: current,
              onPressed: () {
                onCategory('Statistics');
              },
            ),
            const SizedBox(width: 14),
          ],
        ),
        const SizedBox(height: 20),
        if (current == 'Economy')
          ...List.generate(
            nwLIST1.length,
            (index) {
              return _Card(
                nw: nwLIST1[index],
                category: current,
              );
            },
          )
        else if (current == 'Analytics')
          ...List.generate(
            nwLIST2.length,
            (index) {
              return _Card(
                nw: nwLIST2[index],
                category: current,
              );
            },
          )
        else if (current == 'Statistics')
          ...List.generate(
            nwLIST3.length,
            (index) {
              return _Card(
                nw: nwLIST3[index],
                category: current,
              );
            },
          ),
      ],
    );
  }
}

class _Card extends StatelessWidget {
  const _Card({
    required this.nw,
    required this.category,
  });

  final NW nw;
  final String category;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 344,
      margin: const EdgeInsets.only(
        left: 14,
        right: 14,
        bottom: 20,
      ),
      decoration: BoxDecoration(
        color: const Color(0xff1C1C1E),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(20),
              ),
              child: CachedNetworkImage(
                imageUrl: nw.imageURL,
                width: double.infinity,
                height: double.infinity,
                fit: BoxFit.cover,
                errorWidget: (context, url, error) {
                  return Container();
                },
              ),
            ),
          ),
          const SizedBox(height: 22),
          Row(
            children: [
              const SizedBox(width: 14),
              Expanded(
                child: Text(
                  nw.title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontFamily: 'w700',
                  ),
                ),
              ),
              const SizedBox(width: 14),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              const SizedBox(width: 14),
              Text(
                nw.publishedDate,
                style: const TextStyle(
                  color: Color(0xff939393),
                  fontSize: 16,
                  fontFamily: 'w500',
                ),
              ),
              const SizedBox(width: 10),
              Container(
                height: 28,
                width: 84,
                decoration: BoxDecoration(
                  color: const Color(0xff4FB84F).withOpacity(0.2),
                  borderRadius: BorderRadius.circular(18),
                ),
                child: Center(
                  child: Text(
                    category,
                    style: const TextStyle(
                      color: Color(0xff4FB84F),
                      fontSize: 12,
                      fontFamily: 'w500',
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 26),
          Container(
            height: 34,
            width: 244,
            decoration: BoxDecoration(
              color: const Color(0xff4FB84F),
              borderRadius: BorderRadius.circular(10),
            ),
            child: MyBtn(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return NewsReadScreen(nw: nw);
                    },
                  ),
                );
              },
              minSize: 34,
              child: const Center(
                child: Text(
                  'Read more',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 12,
                    fontFamily: 'w500',
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 8),
        ],
      ),
    );
  }
}
