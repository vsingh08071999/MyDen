import 'package:flutter/material.dart';
import 'package:myden/constants/ConstantTextField.dart';
import 'package:myden/constants/Constant_colors.dart';
import 'package:myden/constants/bezierContainer.dart';

class EditEvents extends StatefulWidget {
  @override
  _EditEventsState createState() => _EditEventsState();
}

class _EditEventsState extends State<EditEvents> {
  DateTime getSelectedStartDate = DateTime.now();

  TextEditingController _eventController = TextEditingController();

  TextEditingController _venueController = TextEditingController();

  TextEditingController _startDateController = TextEditingController();

  TextEditingController _endDateController = TextEditingController();

  TextEditingController _eventTimingsController = TextEditingController();

  TextEditingController _eventFeesController = TextEditingController();

  TextEditingController _descriptionController = TextEditingController();

  var activationValue = "";

  final formKey = GlobalKey<FormState>();
  updateInformation() async {
    if (formKey.currentState.validate()) {
      setState(() {
        //isLoading = true;
      });

//      Event event = Event(
//        eventId: widget.event.eventId,
//        eventName: _eventController.text,
//        venue: _venueController.text,
//        startDate:
//        DateFormat(global.dateFormat).parse(_startDateController.text),
//        endDate: DateFormat(global.dateFormat).parse(_endDateController.text),
//        eventTiming: _eventTimingsController.text,
//        eventFee: _eventFeesController.text,
//        description: _descriptionController.text,
//        enable: true,
//      );
//      print(event.toJson());
//      print(jsonEncode(event.toJson()));
//      print(jsonDecode(jsonEncode(event.toJson())));
//      await Firestore.instance
//          .collection('Society')
//          .document(activationValue)
//          .collection("Events")
//          .document(widget.event.eventId)
//          .updateData(jsonDecode(jsonEncode(event.toJson())))
//          .then((data) async {
//        setState(() {
//          isLoading = false;
//        });
//        _showDialog();
//      }).catchError((err) {
//        setState(() {
//          isLoading = false;
//        });
//        print(err.toString());
//        Fluttertoast.showToast(msg: err.toString());
//      });
    }
  }

  Future<Null> _selectDate(BuildContext context, DateTime firstDate,
      DateTime lastDate, DateTime selectedDate) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: firstDate,
        lastDate: lastDate);
    if (picked != null)
      setState(() {
//        String formatDate =
//        new DateFormat(global.dateFormat).format(picked);
//        getSelectedStartDate = picked;
//        _startDateController.value = TextEditingValue(text: formatDate);
      });
  }

  Future<Null> _selectEndDate(BuildContext context, DateTime firstDate,
      DateTime lastDate, DateTime selectedDate) async {
    print(selectedDate);

    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: getSelectedStartDate,
        lastDate: lastDate);
    if (picked != null)
      setState(() {
        //isLoading = true;

//        String formatDate =
//        new DateFormat(global.dateFormat).format(picked);
//        _endDateController.value = TextEditingValue(text: formatDate);
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
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
            child: Form(
              key: formKey,
              child: ListView(
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
                  constantTextField().InputField(
                      "Venue",
                      "Club House",
                      validationKey.name,
                      _venueController,
                      false,
                      IconButton(
                        icon: Icon(Icons.access_time),
                      ),
                      1,
                      TextInputType.name),
                  SizedBox(
                    height: 10,
                  ),
                  InkWell(
                    onTap: () => _selectDate(
                        context,
                        DateTime.now().subtract(Duration(days: 365)),
                        DateTime.now().subtract(Duration(days: 1)),
                        DateTime.now().subtract(Duration(days: 31))),
                    child: IgnorePointer(
                      child: constantTextField().InputField(
                          "Start Date",
                          "20 - 12 - 2020",
                          validationKey.name,
                          _startDateController,
                          true,
                          IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.calendar_today),
                          ),
                          1,
                          TextInputType.name
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
                          DateTime.now().subtract(Duration(days: 365)),
                          DateTime.now(),
                          DateTime.now())
                    },
                    child: IgnorePointer(
                      child: constantTextField().InputField(
                          "End Dater",
                          "31 - 12 - 2020",
                          validationKey.name,
                          _endDateController,
                          true,
                          IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.calendar_today),
                          ),
                          1,
                          TextInputType.name),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  constantTextField().InputField(
                      "Event Timing",
                      "6:00 am to 9:00 am ",
                      validationKey.name,
                      _eventTimingsController,
                      true,
                      IconButton(
                        icon: Icon(Icons.access_time),
                      ),
                      1,
                      TextInputType.name),
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
                      validationKey.name,
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
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: MaterialButton(
                          onPressed: () {
                            updateInformation();
                          },
                          height: 50,
                          elevation: 10,
                          // padding: EdgeInsets.symmetric(vertical: 10),
                          color: UniversalVariables.background,
                          child: Text(
                            "Update Event",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w800),
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
