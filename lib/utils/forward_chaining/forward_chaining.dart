import 'package:covid_overcoming/data/model/rule/rule_model.dart';
import 'package:covid_overcoming/data/model/rule/sub_rule_model.dart';

class ForwardChaining {
  bool entails(RuleModel ruleModel, List<String> agenda) {
    List<String> consequences = [];
    List<SubRuleModel> rules = ruleModel.subRules!;
    String query = ruleModel.query;

    // Init list counter to count number of premise in each rule
    List<int> counter = [];
    for (var rule in rules) {
      counter.add(rule.conditions.length);
    }

    while (agenda.isNotEmpty) {
      final fact = agenda.removeAt(0);

      if (query == fact) {
        return true;
      }

      if (!consequences.contains(fact)) {
        consequences.add(fact);

        // Modify counter
        for (var i = 0; i < rules.length; i++) {
          final rule = rules[i];

          if (rule.conditions.contains(fact)) {
            counter[i]--;
            switch (rule.relationType) {
              case RuleRelationType.and:
                if (counter[i] == 0) {
                  agenda.add(rule.conclusion);
                }
                break;
              case RuleRelationType.or:
                agenda.add(rule.conclusion);
                break;
            }
          }
        }
      }
    }

    return false;
  }
}
