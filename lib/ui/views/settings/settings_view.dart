import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:movieapp/core/services/key_storage/key_storage_service.dart';
import 'package:movieapp/generated/l10n.dart';
import 'package:movieapp/ui/views/settings/settings_view_model.dart';

import '../../../core/services/navigation/navigation_service.dart';
import '../../router.gr.dart';
import '/ui/shared/ui_helper.dart';
import '/ui/widgets/stateless/app_bar.dart';
import '../../../app.dart';
import '../../../core/constant/constants.dart';
import '../../../locator.dart';
import '../../widgets/stateless/app_logo.dart';

class SettingsView extends StatefulWidget {
  @override
  _SettingsViewState createState() => _SettingsViewState();
}

class _SettingsViewState extends State<SettingsView> {
  final formKey = GlobalKey<FormState>();
  int click_count = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SettingsViewModel>.reactive(
      viewModelBuilder: () => SettingsViewModel(),
      onModelReady: (model) async {
        await model.init(context);
      },
      builder: (context, model, child) => Scaffold(
          appBar: MyAppBar(),
          body: SingleChildScrollView(
            padding: const EdgeInsets.fromLTRB(15, 10, 15, 10),
            child: Column(
              children: <Widget>[
                Column(
                  children: [
                    UIHelper.verticalSpaceMedium(),
                    UIHelper.verticalSpaceMedium(),
                    Card(
                      margin: EdgeInsets.all(0),
                      elevation: 1,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: InkWell(
                        onTap: () async {},
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 6, right: 12, left: 12),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    AppLocalizations.of(context)
                                        .settings_view_notification,
                                    style: TextStyle(fontSize: 13),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 10, right: 15, top: 8),
                                    child: Switch(
                                      //activeColor: Theme.of(context).colorScheme.secondary,
                                      value: locator<KeyStorageService>()
                                          .isNotification!,
                                      onChanged: (_) {
                                        setState(() {
                                          locator<KeyStorageService>()
                                                  .isNotification =
                                              (!locator<KeyStorageService>()
                                                  .isNotification!);
                                        });
                                        //model.update();
                                      },
                                    ),
                                  )
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                          ],
                        ),
                      ),
                    ),
                    UIHelper.verticalSpaceMedium(),
                    UIHelper.verticalSpaceMedium(),
                    Card(
                      margin: EdgeInsets.all(0),
                      elevation: 1,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: InkWell(
                        onTap: () async {
                          await showModalBottomSheet(
                              isScrollControlled: true,
                              context: context,
                              builder: (ctx) {
                                return StatefulBuilder(
                                  builder: (BuildContext context_,
                                      void Function(void Function()) setState) {
                                    return Container(
                                      color: Theme.of(context)
                                          .scaffoldBackgroundColor,
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.6,
                                      child: Center(
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 32, horizontal: 16),
                                          child: Column(
                                            children: [
                                              const SizedBox(
                                                height: 20,
                                              ),
                                              Container(
                                                child: AppLogo(
                                                  height: 70.0,
                                                  width: 70.0,
                                                ),
                                              ),
                                              const SizedBox(
                                                height: 15,
                                              ),
                                              const SizedBox(
                                                height: 15,
                                              ),
                                              Text(
                                                AppLocalizations.of(context)
                                                    .about_app,
                                                textAlign: TextAlign.center,
                                                style: TextStyle(fontSize: 12),
                                              ),
                                              Spacer(),
                                              const SizedBox(
                                                height: 5,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                );
                              });
                        },
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 25, right: 12, left: 12),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    AppLocalizations.of(context).about_app,
                                    style: TextStyle(fontSize: 13),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 10, right: 15, top: 8),
                                    child: Container(),
                                  )
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 25,
                            ),
                          ],
                        ),
                      ),
                    ),
                    UIHelper.verticalSpaceMedium(),
                    UIHelper.verticalSpaceMedium(),
                  ],
                ),
              ],
            ),
          )),
    );
  }
}
