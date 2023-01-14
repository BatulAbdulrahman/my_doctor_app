import 'package:flutter/material.dart';
import 'package:movieapp/ui/widgets/stateless/Doctor_tile/doctor_tile_view_model.dart';
import 'package:provider/provider.dart';
import 'package:stacked/stacked.dart';

import '../../../../core/models/doctor/doctor.dart';
import '../../../shared/themes.dart';
import '../../../shared/ui_helper.dart';

/// A list tile for an article.
class DoctorTile extends StatelessWidget {
  final Doctor doctor;
  final ValueChanged<Doctor> onChanged;

  const DoctorTile({required this.doctor, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<DoctorTileViewModel>.nonReactive(
      viewModelBuilder: () => DoctorTileViewModel(),
      onModelReady: (model) => model.init(doctor),
      builder: (context, model, child) => InkWell(
        /* onTap: () async {
          model.moveToMovieViewRoute(context);
        },*/
        child: SingleChildScrollView(
          child: Expanded(
            child: Card(
              elevation: 2,
              margin: EdgeInsets.all(8),
              child: Container(
                height: MediaQuery.of(context).size.height / 5,
                child: Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: Container(
                        //color: Colors.r,
                        child: Image.network(
                          doctor.thumb ??
                              'https://freepikpsd.com/file/2019/10/placeholder-image-png-5-Transparent-Images.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Expanded(
                        flex: 3,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 25, right: 25),
                          child: Column(
                            children: [
                              UIHelper.verticalSpaceLarge(),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Expanded(
                                    child: Text(
                                      doctor.name!,
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  UIHelper.horizontalSpaceSmall(),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  //Text("Genre here"),
                                  // Text(movie.genres!.first.name!),
                                  UIHelper.horizontalSpaceSmall(),
                                ],
                              ),
                              UIHelper.horizontalSpaceLarge(),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  /*Expanded(
                                      child: Text(
                                    model.movie?.description ??
                                        "no specified description",
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(),
                                  )),*/
                                ],
                              ),
                            ],
                          ),
                        ))
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
