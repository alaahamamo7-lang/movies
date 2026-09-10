import 'package:flutter/material.dart';
import 'package:movies/core/constants/app_assets.dart';
import 'package:movies/core/constants/app_text.dart';
import 'package:movies/features/auth/ui/weiget/button/custom_text_button.dart';
import 'package:movies/features/auth/ui/weiget/button/custom_text_form_felid_button.dart';
import 'package:movies/features/auth/ui/weiget/button/main_button.dart';
import 'package:movies/features/update_profile/widget/custom_bottom_sheet.dart';

class UpdateProfileScreen extends StatefulWidget {
  static const String routeName = "/updateProfile";

  @override
  State<UpdateProfileScreen> createState() => _UpdateProfileScreenState();
}

class _UpdateProfileScreenState extends State<UpdateProfileScreen> {
  final GlobalKey<FormState> _formState = GlobalKey<FormState>();

  String selectedAvatar = AppAssets.avatar1;

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    double sizeW = MediaQuery.sizeOf(context).width;
    double sizeH = MediaQuery.sizeOf(context).height;

    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.arrow_back, color: theme.colorScheme.primary),
        title: Text(
          AppText.pickAvatar,
          style: theme.textTheme.displayMedium!.copyWith(
            color: theme.colorScheme.primary,
          ),
        ),
        centerTitle: true,
      ),

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: Column(
            children: [
              Center(
                child: GestureDetector(
                  onTap: () {
                    showModalBottomSheet(
                      context: context,
                      builder: (context) => CustomBottomSheet(
                        onAvatarSelect: (newAvatarPath) {
                          selectedAvatar = newAvatarPath;
                          setState(() {});
                        },
                      ),
                    );
                  },
                  child: CircleAvatar(
                    backgroundImage: AssetImage(selectedAvatar),
                    radius: sizeW * 0.16,
                  ),
                ),
              ),
              SizedBox(height: sizeH * 0.02),
              Expanded(
                child: Form(
                  key: _formState,
                  child: Column(
                    children: [
                      CustomTextFormField(
                        hint: "Name",
                        icon: AppAssets.svgPerson,
                      ),
                      SizedBox(height: sizeH * 0.02),
                      CustomTextFormField(
                        hint: "Phone",
                        icon: AppAssets.svgPhone,
                      ),
                      SizedBox(height: sizeH * 0.001),
                      Row(
                        mainAxisAlignment: .start,
                        children: [
                          CustomTextButton(
                            label: Text(
                              "Reset Password",
                              style: theme.textTheme.displaySmall!.copyWith(
                                color: theme.colorScheme.onSurfaceVariant,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              MainButton(
                label: Text("Delete Account"),
                buttonBg: Colors.red,
                buttonFg: theme.colorScheme.onSurfaceVariant,
                onPressed: () {},
              ),
              SizedBox(height: sizeH * 0.02),
              MainButton(
                label: Text("Update Data"),
                buttonBg: theme.colorScheme.primary,
                buttonFg: theme.colorScheme.secondary,
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
