import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:numberpicker/numberpicker.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> with TickerProviderStateMixin {
  int amountPassengers = 1;
  String? departurePoint;
  String? arrivalPoint;
  late AnimationController controller;

  DateTime? dateTime;

  @override
  void initState() {
    super.initState();
    controller = BottomSheet.createAnimationController(this);
    controller.duration = const Duration(milliseconds: 500);
    controller.reverseDuration = const Duration(milliseconds: 500);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  Future<DateTime?> pickDate() => showDatePicker(
    context: context,
    initialDate: DateTime.now(),
    firstDate: DateTime.now(),
    lastDate: DateTime.now().add(const Duration(days: 7)),
  );

  Future<TimeOfDay?> pickTime() => showTimePicker(
    context: context,
    initialTime: TimeOfDay(hour: DateTime.now().add(const Duration(hours: 1)).hour, minute: DateTime.now().minute),
  );

  Future<DateTime?> pickDateTime() async {
    DateTime? date = await pickDate();
    if (date == null) return null;

    TimeOfDay? time = await pickTime();
    if (time == null) return null;

    final pickedDateTime = DateTime(
      date.year,
      date.month,
      date.day,
      time.hour,
      time.minute
    );

    return pickedDateTime;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 100,
        ),
        SvgPicture.asset(
          'assets/busser_logo.svg',
          height: 250,
        ),
        const SizedBox(
          height: 35,
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 30),
          child: Text(
            "Busser – это комфортный и безопасный сервис трансфер-такси.",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        const SizedBox(
          height: 35,
        ),
        Container(
          height: 50,
          width: 180,
          decoration: BoxDecoration(
            color: Colors.black87,
            border: Border.all(
              width: 2.5
            ),
            borderRadius: BorderRadius.circular(12),
          ),
          child: ElevatedButton(
            onPressed: () {
              // print(DateFormat('dd-MM-yyyy').format(dateTime));
              showModalBottomSheet(
                  context: context,
                  transitionAnimationController: controller,
                  isScrollControlled: true,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(30),
                    ),
                  ),
                  builder: (BuildContext context) {
                    return StatefulBuilder(
                      builder: (BuildContext context, StateSetter setState) {
                        return FractionallySizedBox(
                          heightFactor: 0.85,
                          child: Container(
                            color: Colors.white,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 30),
                              child: ListView(
                                children: [
                                  const Text(
                                    "BUSSER",
                                    style: TextStyle(
                                      fontSize: 25,
                                      fontWeight: FontWeight.w600
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 35,
                                  ),
                                  const Text(
                                    'Выберите пункт отправления',
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  DropdownSearch<String>(
                                    popupProps: const PopupProps.menu(
                                      showSelectedItems: true,
                                    ),
                                    items: const [
                                      "Владивосток",
                                      "Находка",
                                      "Владивосток (Аэропорт)",
                                      "Артём",
                                    ],
                                    dropdownDecoratorProps: const DropDownDecoratorProps(
                                      dropdownSearchDecoration: InputDecoration(),
                                    ),
                                    onChanged: (value) {
                                      setState(() => departurePoint = value);
                                    },
                                    selectedItem: departurePoint,
                                  ),
                                  const SizedBox(
                                    height: 35,
                                  ),
                                  const Text(
                                    'Выберите пункт прибытия',
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  DropdownSearch<String>(
                                    popupProps: const PopupProps.menu(
                                      showSelectedItems: true,
                                    ),
                                    items: const [
                                      "Владивосток",
                                      "Находка",
                                      "Владивосток (Аэропорт)",
                                      "Артём",
                                    ],
                                    dropdownDecoratorProps: const DropDownDecoratorProps(
                                      dropdownSearchDecoration: InputDecoration(),
                                    ),
                                    onChanged: (value) {
                                      setState(() => arrivalPoint = value);
                                    },
                                    selectedItem: arrivalPoint,
                                  ),
                                  const SizedBox(
                                    height: 35,
                                  ),
                                  const Text(
                                    'Выберите количество пассажиров',
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Center(
                                    child: NumberPicker(
                                      value: amountPassengers,
                                      minValue: 1,
                                      maxValue: 10,
                                      step: 1,
                                      itemHeight: 100,
                                      axis: Axis.horizontal,
                                      onChanged: (value) =>
                                          setState(() => amountPassengers = value),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(16),
                                        border: Border.all(width: 2),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 35,
                                  ),
                                  const Text(
                                    "Планируемая дата поездки",
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  FractionallySizedBox(
                                    widthFactor: 1,
                                    child: Container(
                                      height: 60,
                                      decoration: BoxDecoration(
                                        color: Colors.white54,
                                        border: Border.all(
                                            width: 2.5
                                        ),
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                      child: ElevatedButton(
                                        key: UniqueKey(),
                                        onPressed: () async {
                                          final pickedDate = await pickDateTime();
                                          setState(() => dateTime = pickedDate);
                                        },
                                        style: ElevatedButton.styleFrom(
                                          foregroundColor: Colors.white,
                                          elevation: 0,
                                          backgroundColor: Colors.transparent,
                                          shadowColor: Colors.transparent,
                                        ),
                                        child: Text(
                                          (dateTime != null) ?
                                            "${DateFormat("dd-MM-yyyy").format(dateTime!)} ${DateFormat("Hm").format(dateTime!)}" :
                                            "Нажмите, чтобы выбрать дату",
                                          style: const TextStyle(
                                            color: Colors.black,
                                            fontSize: 16,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 35,
                                  ),
                                  FractionallySizedBox(
                                    widthFactor: 0.75,
                                    child: Container(
                                      height: 75,
                                      decoration: BoxDecoration(
                                        color: Colors.black87,
                                        border: Border.all(
                                            width: 2.5
                                        ),
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                      child: ElevatedButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        style: ElevatedButton.styleFrom(
                                          foregroundColor: Colors.black54,
                                          elevation: 0,
                                          backgroundColor: Colors.transparent,
                                          shadowColor: Colors.transparent,
                                        ),
                                        child: const Text(
                                          "Найти",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 18,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 35,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  }
              );
            },
            style: ElevatedButton.styleFrom(
              foregroundColor: Colors.black54,
              elevation: 0,
              backgroundColor: Colors.transparent,
              shadowColor: Colors.transparent,
            ),
            child: const Text(
              "Заказать",
              style: TextStyle(
                color: Colors.white,
                fontSize: 16
              ),
            ),
          ),
        )
      ],
    );
  }
}
