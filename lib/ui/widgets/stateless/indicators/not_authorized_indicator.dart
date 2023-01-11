import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../generated/l10n.dart';

class notAuthorizedIndicator extends StatelessWidget {
  const notAuthorizedIndicator({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 16),
          child: Column(
            children: [
              const SizedBox(
                height: 80,
              ),
              Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                    shape: BoxShape.circle, color: Colors.grey[300]),
                child: Icon(
                  Icons.person,
                  size: 60,
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              Text(
                '', //
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headline6,
              ),
              const SizedBox(
                height: 25,
              ),
              Text(
                AppLocalizations.of(context)
                    .not_authorized_indicator_you_need_to_login_to_see_this_page,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyText2,
              ),
              const Spacer(),
              Container(
                margin: EdgeInsets.fromLTRB(0, 10, 0, 10),
                width: double.infinity,
                /*  child: RaisedButton(
                  elevation: 0.5,
                  color: Theme.of(context).colorScheme.primary,
                  onPressed: () async {},
                  textColor: Colors.grey[800],
                  padding: const EdgeInsets.all(0.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Container(
                      height: 45,
                      child: Center(
                          child: Text(
                        AppLocalizations.of(context)
                            .not_authorized_indicator_login_register,
                        style: TextStyle(
                            fontSize: 13,
                            color: Theme.of(context).colorScheme.onPrimary),
                      ))),
                ),*/
              )
            ],
          ),
        ),
      );
}
