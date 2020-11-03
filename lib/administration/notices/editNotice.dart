import 'package:flutter/material.dart';
import 'package:myden/constants/ConstantTextField.dart';
import 'package:myden/constants/Constant_colors.dart';
import 'package:myden/constants/bezierContainer.dart';

class EditNotice extends StatefulWidget {
  @override
  _EditNoticeState createState() => _EditNoticeState();
}

class _EditNoticeState extends State<EditNotice> {
  var activationValue = "";
  TextEditingController _noticeController = TextEditingController();
  TextEditingController _startDateController = TextEditingController();
  TextEditingController _endDateController = TextEditingController();
  TextEditingController _descriptionController = TextEditingController();

  Future<Null> _selectDate(BuildContext context, DateTime firstDate,
      DateTime lastDate, DateTime selectedDate) async {
    //DateTime selectedDate = firstDate;
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: firstDate,
        lastDate: lastDate);
    if (picked != null) // && picked != selectedDate)
      setState(() {
        selectedDate = picked;
//        String _formattedate =
//            new DateFormat(global.dateFormat).format(selectedDate);
//        _startDateController.value = TextEditingValue(text: _formattedate);
      });
  }

  Future<Null> _selectEndDate(BuildContext context, DateTime firstDate,
      DateTime lastDate, DateTime selectedDate) async {
    //DateTime selectedDate = firstDate;
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: firstDate,
        lastDate: lastDate);
    if (picked != null) // && picked != selectedDate)
      setState(() {
        selectedDate = picked;
//        String _formattedate =
//            new DateFormat(global.dateFormat).format(selectedDate);
//        _endDateController.value = TextEditingValue(text: _formattedate);
      });
  }

  final formKey = GlobalKey<FormState>();
  bool isLoading = false;

  updateInformation() async {
    if (formKey.currentState.validate()) {
      setState(() {
        isLoading = true;
      });
//
//      Notice notice = Notice(
//        noticeId: widget.notice.noticeId,
//        noticeHeading: _noticeController.text,
//        startDate:
//            DateFormat(global.dateFormat).parse(_startDateController.text),
//        endDate: DateFormat(global.dateFormat).parse(_endDateController.text),
//        description: _descriptionController.text,
//        enable: true,
//      );
//
//      await Firestore.instance
//          .collection('Society')
//          .document(activationValue)
//          .collection("Notice")
//          .document(widget.notice.noticeId)
//          .updateData(jsonDecode(jsonEncode(notice.toJson())))
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
                          _noticeController,
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
                      InkWell(
//                        onTap: () => _selectDate(
//                            context,
//                            DateTime.now().subtract(Duration(days: 0)),
//                            DateTime.now().add(Duration(days: 365)),
//                            widget.notice.endDate),
                        child: IgnorePointer(
                          child: constantTextField().InputField(
                              "Start Date",
                              "20 - 12 - 2020",
                              validationKey.name,
                              _startDateController,
                              true,
                              IconButton(
                                onPressed: () {
//                                  _selectDate(
//                                      context,
//                                      DateTime.now()
//                                          .subtract(Duration(days: 0)),
//                                      DateTime.now().add(Duration(days: 365)),
//                                      widget.notice.startDate);
                                },
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
//                        onTap: () => _selectEndDate(
//                            context,
//                            DateTime.now().subtract(Duration(days: 0)),
//                            DateTime.now().add(Duration(days: 365)),
//                            widget.notice.endDate),
                        child: IgnorePointer(
                          child: constantTextField().InputField(
                              "End Dater",
                              "31 - 12 - 2020",
                              validationKey.name,
                              _endDateController,
                              true,
                              IconButton(
                                onPressed: () {
//                                  _selectEndDate(
//                                      context,
//                                      DateTime.now()
//                                          .subtract(Duration(days: 0)),
//                                      DateTime.now().add(Duration(days: 365)),
//                                      widget.notice.endDate
//                                  );
                                },
                                icon: Icon(Icons.calendar_today),
                              ),
                              1,
                              TextInputType.name),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
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
                        updateInformation();
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
