import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

import '../models/nw.dart';
import '../widgets/my_btn.dart';
import '../widgets/svgg.dart';
import '../widgets/text_title.dart';

class NewsReadScreen extends StatelessWidget {
  const NewsReadScreen({
    super.key,
    required this.nw,
  });

  final NW nw;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: MediaQuery.of(context).viewPadding.top),
          const SizedBox(
            height: 60,
            child: TextTitle('News', back: true),
          ),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              children: [
                const SizedBox(height: 16),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      width: 1,
                      color: const Color(0xff4FB84F),
                    ),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: CachedNetworkImage(
                      imageUrl: nw.imageURL,
                      width: MediaQuery.of(context).size.width - 40,
                      fit: BoxFit.cover,
                      errorWidget: (context, url, error) {
                        return Container();
                      },
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    const SizedBox(width: 10),
                    const Spacer(),
                    Text(
                      nw.publishedDate,
                      style: const TextStyle(
                        color: Color(0xff939393),
                        fontSize: 16,
                        fontFamily: 'w500',
                      ),
                    ),
                    const Spacer(),
                  ],
                ),
                const SizedBox(height: 16),
                Text(
                  nw.content,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontFamily: 'w500',
                  ),
                ),
                const SizedBox(height: 16),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
