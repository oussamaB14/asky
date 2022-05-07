import 'package:asky/models/Question.dart';
import 'package:asky/services/QuestionsService.dart';
import 'package:flutter/material.dart';

class ExploreViewController with ChangeNotifier {
  ExploreViewController() {
    getQuestions();
  }
  // instances
  final QuestionsServices _questionsServices = QuestionsServices();

  // variables
  List<String> filters = [
    'Java',
    'Php',
    'C++',
    'Technology',
    'HTML',
    'Algorithm',
    'React',
    'Dart'
  ];
  void getQuestions() async {
    questionsData = await _questionsServices.getAllQuestions();
  }

  List<Question> questionsData = [];
  List<Question> searchedQuestions = [];

  List<String> selectedFilters = [];
// getters
  List<String> get geFilters => selectedFilters;

// functions

  void addFilter(String value) {
    if (!selectedFilters.contains(value)) {
      selectedFilters.add(value);
    } else {
      selectedFilters.remove(value);
    }
    notifyListeners();
  }

  void searchQuestion(String querry) {
    searchedQuestions = questionsData
        .where((element) => element.title.contains(querry))
        .toList();
    notifyListeners();
  }

  void disposeSearch() {
    searchedQuestions.clear();
    notifyListeners();
  }

// getting the right list of questions that should be shown to user
  List<Question> getRightList() {
    if (searchedQuestions.length > 0) {
      return searchedQuestions;
    } else {
      return questionsData;
    }
  }
}
