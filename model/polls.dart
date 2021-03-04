import 'dart:convert';

class Polls {
  String pollsId;
  String pollName;
  List options;
  DateTime startDate;
  DateTime endDate;
  bool enable;


  Polls({this.pollsId, this.pollName, this.options, this.startDate,
    this.endDate,  this.enable});

  Polls.fromJson(Map<String, dynamic> json)
      : pollsId = json['pollsId'],
        pollName = json['pollName'],
        options = json['options'],
        startDate = DateTime.tryParse(json['startDate']),
        endDate = DateTime.tryParse(json['endDate']),
        enable = json['enable'];

  Map<String, dynamic> toJson() =>
      {
        'pollsId': pollsId,
        'pollName': pollName,
        'options': options,
        'startDate': startDate.toIso8601String(),
        'endDate': endDate.toIso8601String(),
        'enable' : enable
      };

}
// To parse this JSON data, do
//
//     final pollsModel = pollsModelFromJson(jsonString);


PollsModel pollsModelFromJson(String str) => PollsModel.fromJson(json.decode(str));

String pollsModelToJson(PollsModel data) => json.encode(data.toJson());

class PollsModel {
  PollsModel({
    this.polls,
  });

  List<Poll> polls;

  factory PollsModel.fromJson(Map<String, dynamic> json) => PollsModel(
    polls: List<Poll>.from(json["polls"].map((x) => Poll.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "polls": List<dynamic>.from(polls.map((x) => x.toJson())),
  };
}

class Poll {
  Poll({
    this.ans,
    this.options,
  });

  String ans;
  String options;

  factory Poll.fromJson(Map<String, dynamic> json) => Poll(
    ans: json["ans"],
    options: json["options"],
  );

  Map<String, dynamic> toJson() => {
    "ans": ans,
    "options": options,
  };
}
