import 'package:bidly/core/theme/app_color.dart';
import 'package:bidly/core/theme/text_styles.dart';
import 'package:bidly/core/widgets/custom_appbar/custom_mobile_appbar.dart';
import 'package:bidly/core/widgets/custom_footer/custom_tablet_footer.dart';
import 'package:bidly/core/widgets/custom_rounded_button.dart';
import 'package:bidly/core/widgets/product_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:octo_image/octo_image.dart';

class TabletProfileScreen extends StatelessWidget {
  const TabletProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomMobileAppBar(
        onMenuTap: () {
          // Handle menu tap
        },
      ),
      body: SingleChildScrollView(
          child: Column(
        children: [
          SizedBox(
            height: 330,
            width: double.infinity,
            child: Stack(
              children: [
                SizedBox(
                    height: 280,
                    width: double.infinity,
                    child: OctoImage(
                      image: const NetworkImage(
                        'https://images.pexels.com/photos/1887609/pexels-photo-1887609.jpeg',
                      ),
                      fit: BoxFit.cover,
                      placeholderBuilder: (context) =>
                          const CupertinoActivityIndicator(),
                      errorBuilder: (context, error, stackTrace) =>
                          const Center(
                        child: Icon(
                          Icons.error_outline_outlined,
                          color: Colors.red,
                          size: 24,
                        ),
                      ),
                    )),
                Positioned(
                  left: 115,
                  bottom: 0,
                  child: SizedBox(
                    height: 120,
                    width: 120,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: OctoImage(
                        image: const NetworkImage(
                          'https://images.pexels.com/photos/771742/pexels-photo-771742.jpeg',
                        ),
                        fit: BoxFit.cover,
                        placeholderBuilder: (context) =>
                            const CupertinoActivityIndicator(),
                        errorBuilder: (context, error, stackTrace) =>
                            const Center(
                          child: Icon(
                            Icons.error_outline_outlined,
                            color: Colors.red,
                            size: 24,
                          ),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 100),
            child: SizedBox(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 30),
                  Text('Username', style: const AppTextStyles().h3WorkSans),
                  const SizedBox(
                    height: 30,
                  ),
                  Row(
                    children: [
                      CustomRoundedButton(
                          radius: 20,
                          width: 187,
                          height: 60,
                          color: AppColors.primaryButton,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(
                                Icons.copy,
                                color: Colors.white,
                                size: 20,
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Text('user_id',
                                  style:
                                      const AppTextStyles().baseBodySpaceMono)
                            ],
                          )),
                      const SizedBox(
                        width: 30,
                      ),
                      CustomRoundedButton(
                          radius: 20,
                          width: 187,
                          height: 60,
                          shouldFill: false,
                          color: AppColors.primaryButton,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(
                                Icons.add,
                                color: Colors.white,
                                size: 20,
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Text('Follow',
                                  style:
                                      const AppTextStyles().baseBodySpaceMono)
                            ],
                          )),
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 156,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('200k',
                                style: const AppTextStyles().h5SpaceMono),
                            const SizedBox(
                              height: 10,
                            ),
                            Text('Volume',
                                style: const AppTextStyles().baseBodyWorkSans),
                          ],
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      SizedBox(
                        width: 156,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('200k',
                                style: const AppTextStyles().h5SpaceMono),
                            const SizedBox(
                              height: 10,
                            ),
                            Text('Sales',
                                style: const AppTextStyles().baseBodyWorkSans),
                          ],
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      SizedBox(
                        width: 156,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('200k',
                                style: const AppTextStyles().h5SpaceMono),
                            const SizedBox(
                              height: 10,
                            ),
                            Text('Followers',
                                style: const AppTextStyles().baseBodyWorkSans),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Text('Bio',
                      style: const AppTextStyles(
                        color: AppColors.backGroundTertiary,
                      ).baseBodySpaceMono),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    'hello myself ',
                    style: const AppTextStyles().baseBodyWorkSans,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Text('Links',
                      style: const AppTextStyles(
                              color: AppColors.backGroundTertiary)
                          .baseBodySpaceMono),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    'https://google.com',
                    style: const AppTextStyles().baseBodyWorkSans,
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          const Divider(thickness: 0.2, color: AppColors.backGroundTertiary),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(
                width: 250,
                child: Column(children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Sold Products',
                          style: const AppTextStyles().baseBodyWorkSans),
                      const SizedBox(
                        width: 5,
                      ),
                      Container(
                        width: 40,
                        height: 28,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: AppColors.backGroundTertiary),
                        child: Center(
                          child: Text(
                            '0',
                            style: const AppTextStyles().baseBodySpaceMono,
                          ),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Divider(
                    thickness: 1,
                    color: AppColors.backGroundTertiary,
                  )
                ]),
              ),
              SizedBox(
                width: 250,
                child: Column(children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Owned Products',
                          style: const AppTextStyles().baseBodyWorkSans),
                      const SizedBox(
                        width: 5,
                      ),
                      Container(
                        width: 40,
                        height: 28,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: AppColors.backGroundTertiary),
                        child: Center(
                          child: Text(
                            '0',
                            style: const AppTextStyles().baseBodySpaceMono,
                          ),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 22,
                  ),
                ]),
              ),
              SizedBox(
                width: 250,
                child: Column(children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('On Sale',
                          style: const AppTextStyles().baseBodyWorkSans),
                      const SizedBox(
                        width: 5,
                      ),
                      Container(
                        width: 40,
                        height: 28,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: AppColors.backGroundTertiary),
                        child: Center(
                          child: Text(
                            '0',
                            style: const AppTextStyles().baseBodySpaceMono,
                          ),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 22,
                  ),
                ]),
              ),
            ],
          ),
          Container(
            height: 1627,
            color: AppColors.backGroundSecondary,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 40),
              child: SizedBox(
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 20,
                    crossAxisSpacing: 20,
                    mainAxisExtent: 470,
                  ),
                  itemCount: 8,
                  itemBuilder: (context, index) {
                    return const ProductWidget();
                  },
                ),
              ),
            ),
          ),
          const SizedBox(height: 2),
          const CustomTabletFooter()
        ],
      )),
    );
  }
}
