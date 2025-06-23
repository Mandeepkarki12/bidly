import 'package:bidly/core/theme/app_color.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class MobileHomeShimmer extends StatelessWidget {
  const MobileHomeShimmer({super.key});

  static const Color backGroundTertiary = Color(0xFFCCCCCC);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AppColors.backGroundPrimary,
      body: Shimmer.fromColors(
        baseColor: backGroundTertiary,
        highlightColor: Colors.white,
        child: SingleChildScrollView(
          child: Padding(
            padding:
                EdgeInsets.symmetric(horizontal: width * 0.1, vertical: 60),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Title shimmer
                Container(
                  width: width,
                  height: 60,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
                const SizedBox(height: 30),

                
                Container(
                  width: width * 0.8,
                  height: 60,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),

                const SizedBox(height: 40),

                // Top seller card
                Container(
                  height: 315,
                  width: width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                  ),
                ),

                const SizedBox(height: 40),

                // Get started button
                Container(
                  height: 60,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                  ),
                ),

                const SizedBox(height: 40),

                // Stats row
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: List.generate(
                      3,
                      (index) => Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: 60,
                                height: 20,
                                color: Colors.white,
                              ),
                              const SizedBox(height: 5),
                              Container(
                                width: 40,
                                height: 15,
                                color: Colors.white,
                              ),
                            ],
                          )),
                ),

                const SizedBox(height: 80),

                // Section title with subtitle
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 200,
                      height: 30,
                      color: Colors.white,
                    ),
                    const SizedBox(height: 10),
                    Container(
                      width: 150,
                      height: 15,
                      color: Colors.white,
                    ),
                  ],
                ),

                const SizedBox(height: 40),

                // Horizontal scrolling items
                SizedBox(
                  height: 425,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 3,
                    itemBuilder: (context, index) => Container(
                      width: 250,
                      margin: const EdgeInsets.only(right: 20),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 80),

                // Categories title
                Container(
                  width: 200,
                  height: 30,
                  color: Colors.white,
                ),

                const SizedBox(height: 30),

                // Categories grid
                SizedBox(
                  height: 870,
                  child: GridView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 20,
                      crossAxisSpacing: 30,
                      mainAxisExtent: 200,
                    ),
                    itemCount: 6,
                    itemBuilder: (context, index) => Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 80),

                // Discover section title
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 200,
                      height: 30,
                      color: Colors.white,
                    ),
                    const SizedBox(height: 10),
                    Container(
                      width: 150,
                      height: 15,
                      color: Colors.white,
                    ),
                  ],
                ),

                const SizedBox(height: 20),

                // Vertical list
                SizedBox(
                  height: 444 * 3,
                  child: ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: 3,
                    itemBuilder: (context, index) => Padding(
                      padding: const EdgeInsets.only(bottom: 20),
                      child: Container(
                        height: 424,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 40),

                // See all button
                Container(
                  height: 60,
                  width: width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.white),
                    color: Colors.white,
                  ),
                ),

                const SizedBox(height: 80),

                // Featured auction
                Container(
                  height: 424,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                  ),
                ),

                const SizedBox(height: 80),

                // Footer
                Container(
                  height: 200,
                  color: Colors.white,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
