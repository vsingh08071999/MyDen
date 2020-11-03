import 'package:flutter/material.dart';
import 'package:myden/constants/ConstantTextField.dart';
import 'package:myden/constants/Constant_colors.dart';
import 'package:myden/constants/bezierContainer.dart';

class AddSociety extends StatelessWidget {
  TextEditingController _flatController = TextEditingController();
  TextEditingController _paymentController = TextEditingController();
  TextEditingController _startDateController = TextEditingController();
  final formKey = GlobalKey<FormState>();
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
                top: MediaQuery.of(context).size.height * 0.30),
            child: ListView(
              children: [
                Form(
                  key: formKey,
                  child: Column(
                    children: [
                      constantTextField().InputField(
                          "Number Of Flats",
                          "",
                          validationKey.flatNo,
                          _flatController,
                          false,
                          IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.edit),
                          ),
                          1,
                          TextInputType.name),
                      SizedBox(
                        height: 10,
                      ),
                      constantTextField().InputField(
                          "Payment Amount",
                          "",
                          validationKey.name,
                          _paymentController,
                          false,
                          IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.edit),
                          ),
                          1,
                          TextInputType.number),
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
                              "Select Date",
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
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: MaterialButton(
                              onPressed: () {
                                SaveSociety();
                              },
                              height: 50,
                              elevation: 10,
                              // padding: EdgeInsets.symmetric(vertical: 10),
                              color: UniversalVariables.background,
                              child: Text(
                                "Save",
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
              ],
            ),
          )
        ],
      ),
    );
  }

  SaveSociety() {
    if (formKey.currentState.validate()) {
//      setState(() {
//        // print  ( prefs.get("activationCode"));
//        isLoading = true;
//      });
//      Firestore.instance
//          .collection("Society")
//          .document(activationValue)
//          .setData({
//        'numberOfFlates': _flatController.text,
//        'paymentAmount': _paymentController.text,
//        'date': _startDateController.text
//      });
    }
  }

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
}
