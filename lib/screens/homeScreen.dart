import 'package:flutter/material.dart';
import 'package:myden/activity/bill/billScreen.dart';
import 'package:myden/activity/complaintLog/complaintsLogScreen.dart';
import 'package:myden/activity/payments/paymentsScreen.dart';
import 'package:myden/activity/suggestion/suggestionScreen.dart';
import 'package:myden/activity/vehicles/vehicle_InOut_Screen.dart';
import 'package:myden/activity/visitorsBook/visitorsBookScreen.dart';
import 'package:myden/administration/alert/alertsScreen.dart';
import 'package:myden/administration/amenity/amenityScreen.dart';
import 'package:myden/administration/events/eventsScreen.dart';
import 'package:myden/administration/gates/gatesScreen.dart';
import 'package:myden/administration/gaurds/gaurdScreen.dart';
import 'package:myden/administration/houses/housesScreen.dart';
import 'package:myden/administration/notices/noticesScreen.dart';
import 'package:myden/administration/polls/pollsScreen.dart';
import 'package:myden/administration/society/societyScreen.dart';
import 'package:myden/administration/vendors/vendorsScreen.dart';
import 'package:myden/loginScreen/AdminSignIn.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Widget _administrationFields(String name, Widget function) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => function));
      },
      child: ListTile(
        title: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            name,
            style: TextStyle(
              fontSize: 17,
            ),
            softWrap: true,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Screen"),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            Container(
              padding: EdgeInsets.all(20),
              child: Text(
                "MyDen",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 50,
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                ),
              ),
              height: MediaQuery.of(context).size.height * 0.20,
              width: MediaQuery.of(context).size.width,
              color: Colors.blue,
            ),
            ExpansionTile(
              title: Text(
                "Administration",
                style: TextStyle(
                  fontSize: 20,
                ),
                softWrap: true,
              ),
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    _administrationFields("Society", SocietyScreen()),
                    _administrationFields("Houses", HousesScreen()),
                    _administrationFields("Gates", GateScreen()),
                    _administrationFields("Gaurds", GaurdsScreen()),
                    _administrationFields("Vendors", VendorsScreen()),
                    _administrationFields("Amenity", AmenityScreen()),
                    _administrationFields("Events", EventsScreen()),
                    _administrationFields("Notices", NoticesScreen()),
                    _administrationFields("Polls", PollsScreen()),
                    _administrationFields("Alerts", AlertsScreen()),
                  ],
                )
              ],
            ),
            ExpansionTile(
              title: Text(
                "Activity",
                style: TextStyle(fontSize: 20),
                softWrap: true,
              ),
              children: [
                _administrationFields("Visitors Book", VisitorsBookScreen()),
                _administrationFields("Vehicle In/Out", VehicleInOutScreen()),
                _administrationFields("Complaints Log", ComplaintsLogScreen()),
                _administrationFields("Suggestion", SuggestionScreen()),
                _administrationFields("Payments", PaymentScreen()),
                _administrationFields("Bills", BillScreen()),
              ],
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Row(
          children: [
            Container(
              width: MediaQuery.of(context).size.width * 0.30,
              height: MediaQuery.of(context).size.height,
              color: Colors.blue[800],
              child: Column(
                children: [
                  ExpansionTile(
                    title: Text("Gaurds"),
                    children: [Text("gaurd1"), Text("gaurd1"), Text("gaurd1")],
                  ),
                  ExpansionTile(
                    title: Text("Gate"),
                    children: [Text("gaurd1"), Text("gaurd1"), Text("gaurd1")],
                  ),
                  ExpansionTile(
                    title: Text("House"),
                    children: [Text("gaurd1"), Text("gaurd1"), Text("gaurd1")],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
