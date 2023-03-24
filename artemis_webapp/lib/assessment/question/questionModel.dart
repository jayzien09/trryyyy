import 'package:artemis_webapp/assessment/question/governance/govFileUpload.dart';
import 'package:flutter/cupertino.dart';

class QuestionModelEnvironment {
  String category;
  String question;
  Widget options;
  QuestionModelEnvironment(this.category, this.question, this.options);
}

class QuestionModelSocial {
  String category;
  String question;
  Widget options;
  QuestionModelSocial(this.category, this.question, this.options);
}

class QuestionModelGovernance {
  String category;
  String question;
  Widget options;
  QuestionModelGovernance(this.category, this.question, this.options);
}

// class QuestionModelGovernance {
//   String questionGovernance;
//   Map<String, bool> answersGovernance;
//   QuestionModelGovernance(this.questionGovernance, this.answersGovernance);
// }
