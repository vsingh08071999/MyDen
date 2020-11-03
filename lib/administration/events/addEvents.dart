import 'package:flutter/material.dart';
import 'package:myden/constants/ConstantTextField.dart';
import 'package:myden/constants/Constant_colors.dart';
import 'package:myden/constants/bezierContainer.dart';

class AddEvents extends StatefulWidget {
  @override
  _AddEventsState createState() => _AddEventsState();
}

class _AddEventsState extends State<AddEvents> {
  DateTime getSelectedStartDate = DateTime.now();
  var items = ['Club House', 'Society', 'RWA Members'];
  var activationValue = "";

  TextEditingController _eventController = TextEditingController();
  TextEditingController _venueController = TextEditingController();
  TextEditingController _startDateController = TextEditingController();
  TextEditingController _endDateController = TextEditingController();
  TextEditingController _eventTimingsController = TextEditingController();
  TextEditingController _eventFeesController = TextEditingController();
  TextEditingController _descriptionController = TextEditingController();

  Future<Null> _selectDate(
      BuildContext context, DateTime firstDate, DateTime lastDate) async {
    DateTime selectedDate = firstDate;
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: firstDate,
        lastDate: lastDate);
    if (picked != null) // && picked != selectedDate)
      selectedDate = picked;
//    String _formattedate =
//        new DateFormat(global.dateFormat).format(selectedDate);
//    setState(() {
//      _startDateController.value = TextEditingValue(text: _formattedate);
//    });
  }

  Future<Null> _selectEndDate(
      BuildContext context, DateTime firstDate, DateTime lastDate) async {
    DateTime selectedDate = firstDate;
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: firstDate,
        lastDate: lastDate);
    if (picked != null) // && picked != selectedDate)
      selectedDate = picked;
//    String _formattedate =
//        new DateFormat(global.dateFormat).format(selectedDate);
//    setState(() {
//      _endDateController.value = TextEditingValue(text: _formattedate);
//    });
  }

  final formKey = GlobalKey<FormState>();
  bool isLoading = false;

  SaveInformation() async {
    if (formKey.currentState.validate()) {
      setState(() {
        isLoading = true;
      });

//      Event event = Event(
//        eventId: Uuid().v1(),
//        eventName: _eventController.text,
//        venue: _venueController.text,
//        startDate:
//            DateFormat(global.dateFormat).parse(_startDateController.text),
//        endDate: DateFormat(global.dateFormat).parse(_endDateController.text),
//        eventTiming: _eventTimingsController.text,
//        eventFee: _eventFeesController.text,
//        description: _descriptionController.text,
//        enable: true,
//      );
//      print(event.toJson());
//
//      await Firestore.instance
//          .collection('Society')
//          .document(activationValue)
//          .collection("Events")
//          .document(event.eventId)
//          .setData(jsonDecode(jsonEncode(event.toJson())))
//          .then((data) async {
//        setState(() {
//          isLoading = false;
//        });
//        _showDialog();
//        //  Navigator.pop(context);
//      }).catchError((err) {
//        setState(() {
//          isLoading = false;
//        });
//        Fluttertoast.showToast(msg: err.toString());
//      });
    }
  }

  List<String> options = <String>[
    'Club ouse',
    'Society',
    'RWA Members',
  ];
  String dropdownValue = 'Club House';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Positioned(
          top: -MediaQuery.of(context).size.height * .15,
          right: -MediaQuery.of(context).size.width * .4,
          child: BezierContainer(),
        ),
        Padding(
          padding: EdgeInsets.only(
              right: MediaQuery.of(context).size.width * 0.30,
              left: MediaQuery.of(context).size.width * 0.30,
              top: MediaQuery.of(context).size.height * 0.10,
              bottom: MediaQuery.of(context).size.height * 0.10),
          child: ListView(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 8, right: 8),
                child: Form(
                  key: formKey,
                  child: Column(
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      constantTextField().InputField(
                          "Enter Event Name",
                          "Durga Pooja",
                          validationKey.name,
                          _eventController,
                          false,
                          IconButton(
                            icon: Icon(Icons.access_time),
                          ),
                          1,
                          TextInputType.name),
                      SizedBox(
                        height: 10,
                      ),
                      Stack(children: [
                        constantTextField().InputField(
                            "Venue",
                            "Club House",
                            validationKey.venue,
                            _venueController,
                            false,
                            IconButton(
                              icon: Icon(Icons.arrow_drop_down),
                              onPressed: () {},
                            ),
                            1,
                            TextInputType.name),
                        Positioned(
                          right: 0,
                          child: Container(
                            alignment: Alignment.centerRight,
                            child: PopupMenuButton<String>(
                              icon: const Icon(Icons.arrow_downward),
                              onSelected: (String val) {
                                _venueController.text = val;
                              },
                              itemBuilder: (BuildContext context) {
                                return items
                                    .map<PopupMenuItem<String>>((String val) {
                                  return new PopupMenuItem(
                                      child: new Text(val), value: val);
                                }).toList();
                              },
                            ),
                          ),
                        ),
                      ]),
                      SizedBox(
                        height: 10,
                      ),
                      InkWell(
                        onTap: () => _selectDate(
                            context,
                            DateTime.now().subtract(Duration(days: 0)),
                            DateTime.now().add(Duration(days: 365))),
                        child: IgnorePointer(
                          child: constantTextField().InputField(
                              "Start Date",
                              "20 - 12 - 2020",
                              validationKey.date,
                              _startDateController,
                              true,
                              IconButton(
                                onPressed: () {},
                                icon: Icon(Icons.calendar_today),
                              ),
                              1,
                              TextInputType.emailAddress
                              //Icon(Icons.calendar_today)

                              ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      InkWell(
                        onTap: () => {
                          _selectEndDate(
                              context,
                              DateTime.now().subtract(Duration(days: 0)),
                              DateTime.now().add(Duration(days: 365))),
                        },
                        child: IgnorePointer(
                          child: constantTextField().InputField(
                              "End Date",
                              "20 - 12 - 2020",
                              validationKey.date,
                              _endDateController,
                              true,
                              IconButton(
                                onPressed: () {
                                  // //  _selectEndDate(
                                  //       context,
                                  //       DateTime.now()
                                  //           .subtract(Duration(days: 0)),
                                  //       DateTime.now().add(Duration(days: 365)));
                                },
                                icon: Icon(Icons.calendar_today),
                              ),
                              1,
                              TextInputType.emailAddress
                              //Icon(Icons.calendar_today)

                              ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      InkWell(
                        onTap: () {},
                        child: constantTextField().InputField(
                            "Event Timing",
                            "6:00 am to 9:00 am ",
                            validationKey.time,
                            _eventTimingsController,
                            true,
                            IconButton(
                              icon: Icon(Icons.access_time),
                            ),
                            1,
                            TextInputType.emailAddress),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      constantTextField().InputField(
                          "End Fees",
                          "Free/ 50",
                          validationKey.payment,
                          _eventFeesController,
                          false,
                          IconButton(
                            icon: Icon(Icons.access_time),
                          ),
                          1,
                          TextInputType.number),
                      SizedBox(
                        height: 10,
                      ),
                      constantTextField().InputField(
                          "Description",
                          "Enter description here",
                          validationKey.Description,
                          _descriptionController,
                          false,
                          IconButton(
                            icon: Icon(Icons.arrow_drop_down),
                            onPressed: () {},
                          ),
                          5,
                          TextInputType.name),
                      SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
                    child: MaterialButton(
                      onPressed: () {
                        SaveInformation();
                      },
                      height: 50,
                      elevation: 10,
                      // padding: EdgeInsets.symmetric(vertical: 10),
                      color: UniversalVariables.background,
                      child: Text(
                        "Add Notice",
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.w800),
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ]),
    );
  }
}
