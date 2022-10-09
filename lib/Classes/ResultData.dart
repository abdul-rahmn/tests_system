// ignore_for_file: unnecessary_new, prefer_collection_literals, unnecessary_this, file_names

class ResultData {
  int? id;
  String? question;
  String? trueAnswer;
  String? userAnswer;
  String? stateAnswer;

  ResultData(
      {this.id,
      this.question,
      this.trueAnswer,
      this.userAnswer,
      this.stateAnswer});

  ResultData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    question = json['question'];
    trueAnswer = json['trueAnswer'];
    userAnswer = json['userAnswer'];
    stateAnswer = json['stateAnswer'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['question'] = this.question;
    data['trueAnswer'] = this.trueAnswer;
    data['userAnswer'] = this.userAnswer;
    data['stateAnswer'] = this.stateAnswer;
    return data;
  }
}