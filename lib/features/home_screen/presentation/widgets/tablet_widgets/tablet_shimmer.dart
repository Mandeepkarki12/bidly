import 'package:bidly/core/theme/app_color.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class TabletShimmer extends StatelessWidget {
  final double width;
  const TabletShimmer({super.key, required this.width});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: width * 0.05),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 50,
            ),

            /// HERO SECTION (Top Part)
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Left side content (text area)
                shimmerBox(height: 420, width: width * 0.5, radius: 10),

                SizedBox(width: width * 0.06),

                // Right side - Top Seller card
                Container(
                  height: 420,
                  width: width * 0.31,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: AppColors.backGroundSecondary,
                  ),
                  child: Column(
                    children: [
                      shimmerBox(
                        height: 300,
                        width: double.infinity,
                        radius: 10,
                      ),
                      const SizedBox(height: 20),
                      Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            shimmerBox(height: 20, width: 100),
                            const SizedBox(height: 15),
                            Row(
                              children: [
                                shimmerCircle(24),
                                const SizedBox(width: 8),
                                shimmerBox(height: 20, width: 100),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),

            const SizedBox(height: 100),

            /// TRENDING AUCTIONS HEADER
            shimmerBox(height: 70, width: width * 0.3),

            const SizedBox(height: 50),

            /// TRENDING AUCTIONS HORIZONTAL LIST
            SizedBox(
              height: 250,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: 3,
                separatorBuilder: (_, __) => const SizedBox(width: 25),
                itemBuilder: (context, index) {
                  return shimmerBox(
                      height: 250, width: width * 0.34, radius: 12);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget shimmerBox({
    required double height,
    required double width,
    double radius = 6,
  }) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(radius),
        ),
      ),
    );
  }

  Widget shimmerCircle(double size) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: Container(
        height: size,
        width: size,
        decoration: const BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
        ),
      ),
    );
  }
}
