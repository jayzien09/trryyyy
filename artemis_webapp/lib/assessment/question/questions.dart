import 'package:artemis_webapp/assessment/question/environmental/envOptionItems.dart';
import 'package:artemis_webapp/assessment/question/governance/govFileUpload.dart';
import 'package:artemis_webapp/assessment/question/governance/govOptionItems.dart';
import 'package:artemis_webapp/assessment/question/questionModel.dart';
import 'package:artemis_webapp/assessment/question/social/socOptionItems.dart';

List<QuestionModelEnvironment> questionsEnv = [
  //1
  QuestionModelEnvironment(
    //first line is for sub category
    "ENVIRONMENTAL ISSUES",
    "Managing environmental issues and minimizing the risks presented by climate change is important for the company.",
    OptionsItem(
      score: 10, //do not mind
      option1: "Not a Priority",
      option2: "Low Priority",
      option3: "High Priority",
      option4: "Essential",
    ),
  ),
  QuestionModelEnvironment(
    //first line is for sub category
    "ENERGY",
    "The company’s energy costs are…",
    OptionsItem(
      score: 10, //do not mind
      option1: "Very High",
      option2: "High",
      option3: "Low",
      option4: "Very Low",
    ),
  ),
  QuestionModelEnvironment(
    //first line is for sub category
    "ENERGY",
    "The company ensures that they are reducing its impact on the environment by investing in renewable energy sources (wind, solar, hydro, geo).",
    OptionsItem(
      score: 10, //do not mind
      option1: "Not a Priority",
      option2: "Low Priority",
      option3: "High Priority",
      option4: "Essential",
    ),
  ),
  QuestionModelEnvironment(
    //first line is for sub category
    "POLLUTION",
    "The carbon footprint of the company is…",
    OptionsItem(
      score: 10, //do not mind
      option1: "Very High",
      option2: "High",
      option3: "Low",
      option4: "Very Low",
    ),
  ),
  QuestionModelEnvironment(
    //first line is for sub category
    "POLLUTION",
    "The company reduces greenhouse gas(co2) emissions to lessen negative impact on the environment.",
    OptionsItem(
      score: 10, //do not mind
      option1: "Not a Priority",
      option2: "Low Priority",
      option3: "High Priority",
      option4: "Essential",
    ),
  ),
  QuestionModelEnvironment(
    //first line is for sub category
    "POLLUTION",
    "The company uses as little amount as possible of raw materials.",
    OptionsItem(
      score: 10, //do not mind
      option1: "Not a Priority",
      option2: "Low Priority",
      option3: "High Priority",
      option4: "Essential",
    ),
  ),
  QuestionModelEnvironment(
    //first line is for sub category
    "POLLUTION",
    "The amount of waste the company produces is…",
    OptionsItem(
      score: 10, //do not mind
      option1: "Very High",
      option2: "High",
      option3: "Low",
      option4: "Very Low",
    ),
  ),
  QuestionModelEnvironment(
    //first line is for sub category
    "POLLUTION",
    "The percentage of produced waste that are being recycled is…",
    OptionsItem(
      score: 10, //do not mind
      option1: "Very High",
      option2: "High",
      option3: "Low",
      option4: "Very Low",
    ),
  ),
  QuestionModelEnvironment(
    //first line is for sub category
    "POLLUTION",
    "The company prioritizes recycling produced waste.",
    OptionsItem(
      score: 10, //do not mind
      option1: "Not a Priority",
      option2: "Low Priority",
      option3: "High Priority",
      option4: "Essential",
    ),
  ),
  QuestionModelEnvironment(
    //first line is for sub category
    "POLLUTION",
    "The company commits to reducing water pollution by having proper waste management and disposal.",
    OptionsItem(
      score: 10, //do not mind
      option1: "Not a Priority",
      option2: "Low Priority",
      option3: "High Priority",
      option4: "Essential",
    ),
  ),
  QuestionModelEnvironment(
    //first line is for sub category
    "WORK ENVIRONMENT",
    "The quality of water(ph level) in the company is…",
    OptionsItem(
      score: 10, //do not mind
      option1: "Very Bad",
      option2: "Bad",
      option3: "Good",
      option4: "Very Good",
    ),
  ),
  QuestionModelEnvironment(
    //first line is for sub category
    "WORK ENVIRONMENT",
    "Lighting in offices/sites/factories inside the company are…",
    OptionsItem(
      score: 10, //do not mind
      option1: "Very Bad",
      option2: "Bad",
      option3: "Good",
      option4: "Very Good",
    ),
  ),
  QuestionModelEnvironment(
    //first line is for sub category
    "WORK ENVIRONMENT",
    "Ambient sounds in offices/sites/factories inside the company are…",
    OptionsItem(
      score: 10, //do not mind
      option1: "Very Bad",
      option2: "Bad",
      option3: "Good",
      option4: "Very Good",
    ),
  ),
  //2
  QuestionModelEnvironment(
    //first line is for sub category
    "WORK ENVIRONMENT",
    "The company makes sure that lighting inside offices/sites/factories is always good for better work experience for employees.",
    OptionsItem(
      score: 10, //do not mind
      option1: "Not a Priority",
      option2: "Low Priority",
      option3: "High Priority",
      option4: "Essential",
    ),
  ),
];

List<QuestionModelSocial> questionsSoc = [
  //1
  QuestionModelSocial(
    //first line is for sub category
    "SOCIAL",
    "Considering how large the business is in terms of revenue, the number of employees is…",
    SocOptionsItem(
      score: 10, //do not mind
      option1: "Very High",
      option2: "High",
      option3: "Low",
      option4: "Very Low",
    ),
  ),
  //2
  QuestionModelSocial(
    "EMPLOYEE RELATION",
    "How good is the company-employee relation?",
    SocOptionsItem(
      score: 20,
      option1: "Very Bad",
      option2: "Bad",
      option3: "Good",
      option4: "Very Good",
    ),
  ),
  QuestionModelSocial(
    "EMPLOYEE RELATION",
    "The company offers compensation, benefits, or bonus to the employees.",
    SocOptionsItem(
      score: 20,
      option1: "Very Bad",
      option2: "Bad",
      option3: "Good",
      option4: "Very Good",
    ),
  ),
  QuestionModelSocial(
    "EMPLOYEE RELATION",
    "The amount of workload per employee is…",
    SocOptionsItem(
      score: 20,
      option1: "Very Bad",
      option2: "Bad",
      option3: "Good",
      option4: "Very Good",
    ),
  ),
  QuestionModelSocial(
    "EMPLOYEE RELATION",
    "The company receives resignation letters from employees.",
    SocOptionsItem(
      score: 20,
      option1: "Very Bad",
      option2: "Bad",
      option3: "Good",
      option4: "Very Good",
    ),
  ),
  QuestionModelSocial(
    "CUSTOMER RELATION",
    "Compared to other competitors, the price of products/services offered by the company is…",
    SocOptionsItem(
      score: 20,
      option1: "Very High",
      option2: "High",
      option3: "Low",
      option4: "Very Low",
    ),
  ),
  QuestionModelSocial(
    "CUSTOMER RELATION",
    "Feedbacks from customers/clients are mostly…",
    SocOptionsItem(
      score: 20,
      option1: "Very Bad",
      option2: "Bad",
      option3: "Good",
      option4: "Very Good",
    ),
  ),
  QuestionModelSocial(
    "CUSTOMER RELATION",
    "The company receives positive feedback from customers/clients.",
    SocOptionsItem(
      score: 20,
      option1: "Never",
      option2: "Sometimes",
      option3: "Often",
      option4: "Always",
    ),
  ),
  QuestionModelSocial(
    "CUSTOMER RELATION",
    "The company prioritizes resolving the concerns of customers/clients.",
    SocOptionsItem(
      score: 20,
      option1: "Not a Priority",
      option2: "Low Priority",
      option3: "High Priority",
      option4: "Essential",
    ),
  ),
  QuestionModelSocial(
    "COMMUNITY RELATION",
    "The company gives back to the community. (charities/community programs/donations)",
    SocOptionsItem(
      score: 20,
      option1: "Never",
      option2: "Sometimes",
      option3: "Often",
      option4: "Always",
    ),
  ),
];

List<QuestionModelGovernance> questionsGov = [
  //1
  QuestionModelGovernance(
    //first line is for sub category
    "MANAGEMENT",
    "How well run is the company?",
    GovOptionsItem(
      score: 10, //do not mind
      option1: "Very Bad",
      option2: "Bad",
      option3: "Good",
      option4: "Very Good",
    ),
  ),
  QuestionModelGovernance(
    //first line is for sub category
    "MANAGEMENT",
    "How fast does the company make a decision?",
    GovOptionsItem(
      score: 10, //do not mind
      option1: "Very Slow",
      option2: "Slow",
      option3: "Fast",
      option4: "Very Fast",
    ),
  ),
  QuestionModelGovernance(
    //first line is for sub category
    "MANAGEMENT",
    "How good is the company’s employment gender ratio?",
    GovOptionsItem(
      score: 10, //do not mind
      option1: "Very Bad",
      option2: "Bad",
      option3: "Good",
      option4: "Very Good",
    ),
  ),
  //2
  QuestionModelGovernance(
    "COMPLIANCE",
    "The company makes sure all taxes are paid.",
    GovOptionsItem(
      score: 20,
      option1: "Not a Priority",
      option2: "Low Priority",
      option3: "High Priority",
      option4: "Essential",
    ),
  ),
  QuestionModelGovernance(
    "COMPLIANCE",
    "The company has all the required permits/licenses to operate.",
    GovOptionsItem(
      score: 20,
      option1: "None",
      option2: "Few",
      option3: "Almost Complete",
      option4: "Complete",
    ),
  ),
  QuestionModelGovernance(
    "COMPLIANCE",
    "if not complete,\nThe company prioritizes getting permits/licenses that are needed?",
    GovOptionsItem(
      score: 20,
      option1: "Not a Priority",
      option2: "Low Priority",
      option3: "High Priority",
      option4: "Essential",
    ),
  ),
  QuestionModelGovernance(
    "COMPLIANCE",
    "The company checks the validity of permits and licenses to renew once expired.",
    GovOptionsItem(
      score: 20,
      option1: "Never",
      option2: "Sometimes",
      option3: "Often",
      option4: "Always",
    ),
  ),

  QuestionModelGovernance(
      "GOVERNANCE",
      "Upload your company’s latest Sustainability Report or equivalent document",
      const FileUpload()),
];
