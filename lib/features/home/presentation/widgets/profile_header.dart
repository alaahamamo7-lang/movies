import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movies/core/constants/app_assets.dart';
import 'package:movies/core/constants/app_color.dart';
import 'package:movies/core/constants/routes/app_routes.dart';
import 'package:movies/features/auth/ui/weiget/button/main_button.dart';

class ProfileHeader extends StatelessWidget {
  ProfileHeader({super.key});
  String selectedAvatar = AppAssets.avatar1;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    ThemeData theme = Theme.of(context);
    return Container(
      decoration: BoxDecoration(color: AppColor.darkGrey),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            SizedBox(height: size.height * 0.06),
            Row(
              children: [
                Column(
                  children: [
                    CircleAvatar(
                      backgroundImage: AssetImage(selectedAvatar),
                      radius: size.width * 0.16,
                    ),
                    SizedBox(height: size.height * 0.01),
                    Text(
                      "UserName",
                      style: theme.textTheme.displayMedium!.copyWith(
                        color: AppColor.white,
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
                Spacer(),
                Column(
                  children: [
                    Text(
                      "num",
                      style: theme.textTheme.displayMedium!.copyWith(
                        fontSize: 24,
                      ),
                    ),
                    SizedBox(height: size.height * 0.03),
                    Text(
                      "Wish List",
                      style: theme.textTheme.displayMedium!.copyWith(
                        color: AppColor.white,
                        fontSize: 24,
                      ),
                    ),
                  ],
                ),
                Spacer(),
                Column(
                  children: [
                    Text(
                      "num",
                      style: theme.textTheme.displayMedium!.copyWith(
                        fontSize: 24,
                      ),
                    ),
                    SizedBox(height: size.height * 0.03),
                    Text(
                      "History",
                      style: theme.textTheme.displayMedium!.copyWith(
                        color: AppColor.white,
                        fontSize: 24,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: size.height * 0.02),
            Row(
              children: [
                Expanded(
                  flex: 2,
                  child: MainButton(
                    label: Text("Edit Profile"),
                    buttonBg: AppColor.yellow,
                    buttonFg: AppColor.black,
                    onPressed: () {
                      Navigator.of(
                        context,
                      ).push(AppRoutes.updateProfileScreen());
                    },
                  ),
                ),
                SizedBox(width: size.width * 0.04),
                Expanded(
                  flex: 1,
                  child: MainButton(
                    label: Text("Exit"),
                    icon: Icon(Icons.exit_to_app_outlined),
                    buttonBg: AppColor.red,
                    buttonFg: AppColor.white,
                    onPressed: () {},
                  ),
                ),
              ],
            ),
            SizedBox(height: size.height * 0.02),

            DefaultTabController(
              length: 2,
              child: TabBar(
                dividerColor: Colors.transparent,
                indicatorColor: AppColor.yellow,
                indicatorWeight: 4.0,
                indicatorPadding: EdgeInsets.symmetric(horizontal: 0),

                tabs: [
                  Container(
                    decoration: BoxDecoration(color: AppColor.darkGrey),
                    child: Column(
                      children: [
                        SvgPicture.asset(
                          AppAssets.svgList,
                          colorFilter: ColorFilter.mode(
                            AppColor.yellow,
                            .srcIn,
                          ),
                          fit: .scaleDown,
                        ),
                        Text(
                          "Watch List",
                          style: theme.textTheme.displayMedium!.copyWith(
                            fontSize: 20,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(color: AppColor.darkGrey),
                    child: Column(
                      children: [
                        SvgPicture.asset(
                          AppAssets.svgFolder,
                          colorFilter: ColorFilter.mode(
                            AppColor.yellow,
                            .srcIn,
                          ),
                          fit: .scaleDown,
                        ),
                        Text(
                          "History",
                          style: theme.textTheme.displayMedium!.copyWith(
                            fontSize: 20,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
