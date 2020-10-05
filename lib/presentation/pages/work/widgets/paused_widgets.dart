import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:works_manenger/core/components/components.dart';
import 'package:works_manenger/core/components/dialog_create_obs.dart';
import 'package:works_manenger/presentation/pages/work/widgets/time_card.dart';

class PausedWidgets extends StatelessWidget {
  final String h;
  final String m;
  final String s;
  final bool isNote;
  final String obs;
  const PausedWidgets({
    Key key,
    this.h,
    this.m,
    this.s,
    this.isNote = true,
    this.obs = '',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TimeCardWidget(
                text: h,
                color: Color(0xFFBCC53B),
                isPaused: true,
              ),
              TimeCardWidget(
                text: m,
                color: Color(0xFFBCC53B),
                isPaused: true,
              ),
              Visibility(
                replacement: TimeCardWidget(
                  text: s,
                  color: Color(0xFFBCC53B),
                  isPaused: true,
                ),
                visible: isNote,
                child: Badge(
                  badgeColor: Color(0xff1E3A4F),
                  padding: EdgeInsets.zero,
                  badgeContent: IconButton(
                    padding: EdgeInsets.all(0.0),
                    icon: Icon(
                      Icons.add,
                    ),
                    color: Colors.white,
                    onPressed: () {
                      Get.dialog(DialogObs());
                    },
                  ),
                  child: TimeCardWidget(
                    text: s,
                    color: Color(0xFFBCC53B),
                    isPaused: true,
                  ),
                ),
              ),
            ],
          ),
          Visibility(
            visible: !isNote && obs.isNotEmpty,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.grey[300],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextCardWidgets(
                      text: 'Observações',
                      size: 17,
                      color: Colors.grey[900],
                    ),
                    TextCardWidgets(
                      text: obs,
                      size: 17,
                      color: Colors.grey[900],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
