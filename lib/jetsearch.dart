import 'package:flutter/material.dart';
import 'package:ur_trip_o_aviation/jet_selection.dart';

import 'AirportInfo.dart';

class FlightSearchPage extends StatefulWidget {
  @override
  _FlightSearchPageState createState() => _FlightSearchPageState();
}

enum TripType { oneway, roundtrip }

Map<TripType, String> _tripTypes = {
  TripType.oneway: 'ONE WAY',
  TripType.roundtrip: 'ROUNDTRIP',
};

class _FlightSearchPageState extends State<FlightSearchPage> {
  TripType _selectedTrip = TripType.oneway;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: RichText(
          text: TextSpan(
            style: TextStyle(color: Colors.black, fontSize: 32),
            children: [
              TextSpan(
                text: 'Flight',
                style: TextStyle(fontWeight: FontWeight.w200),
              ),
              TextSpan(
                text: 'Search',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(48),
          child: Column(
            children: <Widget>[
              Container(
                padding: EdgeInsets.symmetric(horizontal: 8),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(24),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      offset: Offset(0, 6),
                      blurRadius: 6,
                    ),
                  ],
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(_tripTypes.length, (index) {
                    return buildTripTypeSelector(_tripTypes.keys.elementAt(index));
                  }),
                ),
              )
            ],
          ),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Container(
              color: Colors.white,
              height: 20,
            ),
            TextButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
                padding: MaterialStateProperty.all<EdgeInsetsGeometry>(EdgeInsets.all(24)),
              ),
              onPressed: () {},
              child: buildAirportSelector(
                AirportInfo('BOM', 'Chatrapati Shijavi Maharaj International Airport', 'Mumbai'),
                Icons.flight_takeoff,
              ),
            ),
            Container(height: 1, color: Colors.black26),
            TextButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
                padding: MaterialStateProperty.all<EdgeInsetsGeometry>(EdgeInsets.all(24)),
              ),
              onPressed: () {},
              child: buildAirportSelector(
                AirportInfo('DEL', 'Indira Gandhi International Airport', 'New Delhi'),
                Icons.flight_land,
              ),
            ),
            Container(height: 1, color: Colors.black26),
            Row(
              children: <Widget>[
                Expanded(
                  child: TextButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
                      padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                          EdgeInsets.symmetric(horizontal: 24, vertical: 12)),
                    ),
                    onPressed: () {},
                    child: buildDateSelector('DEPARTURE', DateTime.now()),
                  ),
                ),
                Expanded(
                  child: TextButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
                      padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                          EdgeInsets.symmetric(horizontal: 24, vertical: 12)),
                    ),
                    onPressed: () {},
                    child: buildDateSelector('RETURN', DateTime.now().add(Duration(days: 10))),
                  ),
                ),
              ],
            ),
            Container(height: 1, color: Colors.black26),
            Row(
              children: <Widget>[
                Expanded(
                  child: TextButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
                      padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                          EdgeInsets.symmetric(horizontal: 24, vertical: 12)),
                    ),
                    onPressed: () {},
                    child: buildTravellersView(),
                  ),
                ),
                Expanded(
                  child: TextButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
                      padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                          EdgeInsets.symmetric(horizontal: 24, vertical: 12)),
                    ),
                    onPressed: () {},
                    child: Row(
                      children: <Widget>[
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              'CABIN CLASS',
                              style: TextStyle(fontSize: 18, color: Colors.grey),
                            ),
                            Text(
                              'ECONOMY\nCLASS',
                              style: TextStyle(fontSize: 24, color: Colors.black),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Stack(
              children: <Widget>[
                Container(
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black26,
                        offset: Offset(0, 12),
                        blurRadius: 12,
                      ),
                    ],
                    borderRadius:
                    BorderRadius.vertical(bottom: Radius.elliptical(MediaQuery.of(context).size.width * 2, 100)),
                  ),
                ),
                Center(
                  child: Material(
                    color: Colors.orange,
                    shape: CircleBorder(),
                    clipBehavior: Clip.antiAlias,
                    elevation: 16,
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => JetSelection()), // Navigating to JetSelectionPage
                        );
                      },
                      splashColor: Colors.deepOrangeAccent,
                      child: Container(
                        width: 100,
                        height: 100,
                        alignment: Alignment.center,
                        child: Text(
                          'SEARCH',
                          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget buildTravellersView() {
    return Row(
      children: <Widget>[
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'TRAVELLERS',
              style: TextStyle(fontSize: 18, color: Colors.grey),
            ),
            Text(
              '01',
              style: TextStyle(fontSize: 48, color: Colors.black),
            )
          ],
        ),
      ],
    );
  }

  Widget buildDateSelector(String title, DateTime dateTime) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Text(
          title,
          style: TextStyle(fontSize: 18, color: Colors.grey),
        ),
        Row(
          children: <Widget>[
            Text(
              dateTime.day.toString().padLeft(2, '0'),
              style: TextStyle(fontSize: 48, color: Colors.black),
            ),
            SizedBox(width: 8),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Jan 2020',
                  style: TextStyle(fontSize: 16, color: Colors.black),
                ),
                Text(
                  'Friday',
                  style: TextStyle(fontSize: 16, color: Colors.grey),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }

  Widget buildAirportSelector(AirportInfo airportInfo, IconData icon) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Row(
          children: <Widget>[
            Container(
              width: 60,
              child: Text(
                airportInfo.airportCode,
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 24, color: Colors.black54),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  airportInfo.airportShortName,
                  style: TextStyle(fontSize: 24, color: Colors.black87),
                ),
                Text(
                  airportInfo.airportLongName,
                  style: TextStyle(fontSize: 12, color: Colors.black87),
                ),
              ],
            ),
          ],
        ),
        Icon(icon),
      ],
    );
  }

  Widget buildTripTypeSelector(TripType tripType) {
    var isSelected = _selectedTrip == tripType;
    return TextButton(
      onPressed: () {
        setState(() {
          _selectedTrip = tripType;
        });
      },
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(isSelected ? Colors.orange : Colors.transparent),
        shape: MaterialStateProperty.all<OutlinedBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24),
          ),
        ),
      ),
      child: Row(
        children: <Widget>[
          if (isSelected)
            Icon(
              Icons.check_circle,
              color: Colors.white,
            ),
          Text(
            _tripTypes[tripType]!,
            style: TextStyle(color: isSelected ? Colors.white : Colors.black, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
