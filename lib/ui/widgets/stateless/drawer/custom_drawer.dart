// import 'package:movieapp_faisal/components/drawer/bottom_user_info.dart';
// import 'package:movieapp_faisal/components/drawer/custom_list_tile.dart';
// import 'package:movieapp_faisal/components/drawer/header.dart';
import 'package:flutter/material.dart';
import 'package:movieapp/generated/l10n.dart';
import 'package:movieapp/ui/views/home_page/home_page_view_model.dart';
import 'package:movieapp/ui/views/settings/settings_view.dart';
import 'package:stacked/stacked.dart';

import '../../../../core/constant/app_colors.dart';

class CustomDrawer extends StatefulWidget {
  const CustomDrawer({Key? key}) : super(key: key);

  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomePageModel>.reactive(
        viewModelBuilder: () => HomePageModel(),
        onModelReady: (model) async {
          await model.init(context);
        },
        builder: (context, model, child) => SafeArea(
              child: AnimatedContainer(
                curve: Curves.easeInOutCubic,
                duration: const Duration(milliseconds: 250),
                width: 150,
                color: Colors.white,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  //crossAxisAlignment: CrossAxisAlignment.center,

                  children: [
                    // UpperUserInfo(),
                    ListTile(
                      leading: const Icon(
                        Icons.edit,
                        color: Color(0xFFF4D35E),
                      ),
                      title: const Text(
                        ' الرئيسية ',
                        style: TextStyle(
                          color: Color(0xFF2E2F5B),
                        ),
                      ),
                      onTap: (() {}),
                    ),
                    ListTile(
                      leading: const Icon(
                        Icons.favorite_outline,
                        color: Color(0xFFF4D35E),
                      ),
                      title: const Text(
                        ' عن التطبيق ',
                        style: TextStyle(
                          color: Color(0xFF2E2F5B),
                        ),
                      ),
                      onTap: (() {
                        /* Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => FavoritesMoviesView()),
                        );*/
                      }),
                    ),
                    ListTile(
                      leading: const Icon(
                        Icons.settings,
                        color: Color(0xFFF4D35E),
                      ),
                      title: Text(
                        "تسجيل الطبيب",
                        style: TextStyle(
                          color: Color(0xFF2E2F5B),
                        ),
                      ),
                      onTap: (() {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SettingsView()),
                        );
                      }),
                    ),

                    ListTile(
                      leading: Icon(
                        Icons.logout,
                        color: Color(0xFFF4D35E),
                      ),
                      title: Text(
                        "تواصل معنا",
                        style: TextStyle(
                          color: Color(0xFF2E2F5B),
                        ),
                      ),
                      onTap: (() {
                        //model.clear();
                        /* Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LoginPage()),
                          );*/
                      }),
                    ),
                    // if (model.email == null)
                    ListTile(
                      leading: Icon(
                        Icons.login,
                        color: Color(0xFFF4D35E),
                      ),
                      title: Text(
                        ' تسجيل الخروج ',
                        style: TextStyle(
                          color: Color(0xFF2E2F5B),
                        ),
                      ),
                      onTap: (() {
                        /*  model.clear();
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LoginPage()),
                          );*/
                      }),
                    ),
                    SizedBox(height: 10),
                  ],
                ),
              ),
            ));
  }
}
