class Event {
  String eventId;
  String eventName;
  String venue;
  String description;
  DateTime startDate;
  DateTime endDate;
  String eventFee;
  String eventTiming;
  bool enable;
  bool notificationEnable;

  Event(
      {this.eventId,
      this.notificationEnable,
      this.eventName,
      this.venue,
      this.description,
      this.startDate,
      this.endDate,
      this.eventFee,
      this.eventTiming,
      this.enable});

  Event.fromJson(Map<String, dynamic> json)
      : eventId = json['eventId'],
        notificationEnable = json["notificationEnable"],
        eventName = json['eventName'],
        venue = json['venue'],
        description = json['description'],
        startDate = DateTime.tryParse(json['startDate']),
        endDate = DateTime.tryParse(json['endDate']),
        eventFee = json['eventFee'],
        eventTiming = json['eventTiming'],
        enable = json['enable'];

  Map<String, dynamic> toJson() => {
        'eventId': eventId,
        'eventName': eventName,
        'venue': venue,
        'description': description,
        'startDate': startDate.toIso8601String(),
        'endDate': endDate.toIso8601String(),
        'eventFee': eventFee,
        'eventTiming': eventTiming,
        'enable': enable,
        "notificationEnable": notificationEnable
      };
}
