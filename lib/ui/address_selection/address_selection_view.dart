import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:shopperscart/main.dart';
import 'package:shopperscart/ui/Maps/back_map.dart';
import 'package:shopperscart/ui/address_selection/address_selection_viewmodel.dart';
import 'package:shopperscart/ui/shared/constants.dart';
import 'package:shopperscart/ui/shared/ui_helpers.dart';
import 'package:snapping_sheet/snapping_sheet.dart';
import 'package:stacked/stacked.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:intl/intl.dart';

class AddressSelectionView extends StatelessWidget {
  AddressSelectionView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<AddressSelectionViewModel>.reactive(
      onModelReady: (model) {
        MyStore store = VxState.store as MyStore;
        model.scheduledTime = formatDate(
            DateTime(
                DateTime.now().year,
                DateTime.now().day,
                DateTime.now().month,
                DateTime.now().hour,
                DateTime.now().minute),
            [hh, ':', nn, " ", am]).toString();
        model.scheduledDate =
            DateFormat.yMd().format(DateTime.now()).toString();

        model.setCurrentLoc();
        // model.setLocOnChange();
      },
      builder: (context, model, child) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            toolbarHeight: model.appBarHeight,
            title: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    width: screenWidth(context) / 1.6,
                    child: TextFormField(
                      decoration: textInputDecoration.copyWith(
                        hintText: 'Enter your location',
                        labelText: 'Enter your location',
                        labelStyle: TextStyle(color: Colors.black),
                      ),
                      validator: (value) =>
                          value!.isEmpty ? 'Enter your location' : null,
                      controller: model.currentText,
                      focusNode: model.currentFocusNode,
                    ),
                  ),
                ],
              ),
            ),
          ),
          body: SnappingSheet(
            snappingPositions: [
              SnappingPosition.factor(
                positionFactor: 0.8,
                snappingCurve: Curves.bounceOut,
                snappingDuration: Duration(seconds: 1),
                grabbingContentOffset: GrabbingContentOffset.bottom,
              ),
              SnappingPosition.factor(
                positionFactor: 0.4,
                snappingCurve: Curves.bounceOut,
                snappingDuration: Duration(seconds: 1),
                grabbingContentOffset: GrabbingContentOffset.bottom,
              ),
              SnappingPosition.factor(
                positionFactor: 0.1,
                snappingCurve: Curves.elasticOut,
                snappingDuration: Duration(seconds: 1),
              ),
            ],
            initialSnappingPosition: SnappingPosition.factor(
              positionFactor: 0.4,
              snappingCurve: Curves.elasticOut,
              snappingDuration: Duration(milliseconds: 1750),
            ),
            grabbingHeight: 20,
            grabbing: Container(
              color: Colors.white,
              child: Center(
                child: Container(
                  height: 5,
                  width: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                    color: Colors.grey.shade400,
                  ),
                ),
              ),
            ),
            sheetBelow: SnappingSheetContent(
              draggable: true,
              child: Container(
                color: Colors.white,
                child: model.hasAutoCompleteResults
                    ? ListView.builder(
                        itemCount: model.autoCompleteResults.length,
                        itemBuilder: (context, index) {
                          return Card(
                            color: Colors.grey.shade100,
                            child: ListTile(
                              onTap: () {
                                final s =
                                    model.autoCompleteResults[index].mainText;
                                model.setSearchAdddress(
                                  s!,
                                  model.autoCompleteResults[index].placeId
                                      .toString(),
                                );
                              },
                              title: Text(
                                  model.autoCompleteResults[index].mainText ??
                                      ''),
                              subtitle: Text(model.autoCompleteResults[index]
                                      .secondaryText ??
                                  ''),
                            ),
                          );
                        },
                      )
                    : ListView(
                        children: [
                          Card(
                            color: Colors.grey.shade100,
                            elevation: 0.0,
                            child: ListTile(
                              onTap: () {
                                model.useCurrentLoc();
                              },
                              leading: Icon(Icons.location_on),
                              title: Text('use your current location'),
                            ),
                          ),
                          Card(
                            color: Colors.grey.shade100,
                            elevation: 0.0,
                            child: ListTile(
                              title: Text('save this location'),
                            ),
                          ),
                          Card(
                            color: Colors.grey.shade100,
                            elevation: 0.0,
                            child: ListTile(
                              title: Text('select from map'),
                              onTap: model.selectFromMap,
                            ),
                          ),
                        ],
                      ),
              ),
            ),
            child: SafeArea(
              child: DecoratedBox(
                decoration: new BoxDecoration(
                  color: Colors.amber[50],
                ),
                child: model.isBusy
                    ? Center(
                        child: CircularProgressIndicator(
                          valueColor: AlwaysStoppedAnimation(Colors.black),
                        ),
                      )
                    : Stack(
                        alignment: Alignment.bottomCenter,
                        children: [
                          BackMap(
                            onLocationChange: () {
                              model.setLocOnChange();
                              final snackBar =
                                  SnackBar(content: Text('Location changed!'));
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(snackBar);
                            },
                          ),
                        ],
                      ),
              ),
            ),
          ),
        );
      },
      onDispose: (model) {
        model.runDispose();
      },
      viewModelBuilder: () => AddressSelectionViewModel(),
    );
  }
}
