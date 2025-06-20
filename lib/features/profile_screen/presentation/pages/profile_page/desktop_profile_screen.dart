import 'package:bidly/core/theme/app_color.dart';
import 'package:bidly/core/theme/text_styles.dart';
import 'package:bidly/core/widgets/custom_appbar/custom_web_appbar.dart';
import 'package:bidly/core/widgets/custom_footer/custom_web_footer.dart';
import 'package:bidly/core/widgets/custom_rounded_button.dart';
import 'package:bidly/core/widgets/product_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:octo_image/octo_image.dart';

class DesktopProfileScreen extends StatelessWidget {
  const DesktopProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomWebAppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 370,
              width: double.infinity,
              child: Stack(
                children: [
                  SizedBox(
                      height: 320,
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
            SizedBox(
              width: double.infinity,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 599,
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Username',
                              style: const AppTextStyles().h2WorkSans),
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
                                        style:
                                            const AppTextStyles().h4SpaceMono),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Text('Volume',
                                        style: const AppTextStyles().bodyText),
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
                                        style:
                                            const AppTextStyles().h4SpaceMono),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Text('Sales',
                                        style: const AppTextStyles().bodyText),
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
                                        style:
                                            const AppTextStyles().h4SpaceMono),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Text('Followers',
                                        style: const AppTextStyles().bodyText),
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
                              ).h5SpaceMono),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            'hello myself ',
                            style: const AppTextStyles().bodyText,
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          Text('Links',
                              style: const AppTextStyles(
                                      color: AppColors.backGroundTertiary)
                                  .h5SpaceMono),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            'https://google.com',
                            style: const AppTextStyles().baseBodyWorkSans,
                          ),
                        ]),
                  ),
                  const SizedBox(
                    width: 30,
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
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            const Divider(
              thickness: 0.2,
              color: AppColors.backGroundTertiary,
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SizedBox(
                  width: 300,
                  child: Column(children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Sold Products',
                            style: const AppTextStyles().h5WorkSans),
                        const SizedBox(
                          width: 5,
                        ),
                        Container(
                          width: 50,
                          height: 32,
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
                  width: 300,
                  child: Column(children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Owned Products',
                            style: const AppTextStyles().h5WorkSans),
                        const SizedBox(
                          width: 5,
                        ),
                        Container(
                          width: 50,
                          height: 32,
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
                  width: 300,
                  child: Column(children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('On Sale',
                            style: const AppTextStyles().h5WorkSans),
                        const SizedBox(
                          width: 5,
                        ),
                        Container(
                          width: 50,
                          height: 32,
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
              color: AppColors.backGroundSecondary,
              height: 1500,
              width: double.infinity,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 80, vertical: 60),
                child: SizedBox(
                  child: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
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
            const SizedBox(
              height: 2,
            ),
            const CustomWebFooter(),
          ],
        ),
      ),
    );
  }
}
