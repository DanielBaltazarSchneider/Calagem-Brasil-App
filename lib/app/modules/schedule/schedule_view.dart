import 'package:calagem_brasil_pro/app/modules/schedule/schedule_controller.dart';
import 'package:calagem_brasil_pro/app/theme/app_color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:range_calendar/range_calendar.dart';

class ScheduleView extends StatefulWidget {
  const ScheduleView({Key? key}) : super(key: key);

  @override
  _ScheduleViewState createState() => _ScheduleViewState();
}

class _ScheduleViewState extends State<ScheduleView> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ScheduleController>(
      init: ScheduleController(),
      builder: (_) {
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            title: Text("Agenda"),
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                RangeCalendar(
                  onDateSelected: (DateTime _date) {
                    _.setDaySelected(_date);
                    print("Date $_date");
                  },
                  onTapRange: (CalendarRangeSelected _range) {
                    _.setRangeSelected(_range);
                  },
                  colorTextSelected: Colors.black,
                  backgroundColorCircleDaySelected: AppColors.primary,
                  backgroundColorDayNotRanged: Colors.white,
                  backgroundColorDayIsRanged: AppColors.quaternary,
                  backgroundColorPointerEvent: Colors.green.shade700,
                  colorIconRangeSelected: AppColors.primary,
                  colorIconsRangeNotSelected: AppColors.quaternary,
                  events: _.mapCalendar,
                  listLabelWeekday: ["DOM", "SEG", "TER", "QUA", "QUI", "SEX", "SAB"],
                  listOfMonthsOfTheYear: [
                    "Janeiro",
                    "Fevereiro",
                    "Março",
                    "Abril",
                    "Maio",
                    "Junho",
                    "Julho",
                    "Agosto",
                    "Setembro",
                    "Outubro",
                    "Novembro",
                    "Dezembro"
                  ],
                  titleListEvents: Padding(
                    padding: const EdgeInsets.only(left: 25),
                    child: Text("Análises"),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
