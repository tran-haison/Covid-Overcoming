import 'package:covid_overcoming/data/model/examination/examination_answer_model.dart';
import 'package:covid_overcoming/data/model/examination/examination_question_model.dart';

class MockData {
  static const email = 'test@gmail.com';
  static const password = 'Abcd123456789!';
  static const stage = '3/5';
  static const day = '26';
  static const testsPassed = '7/11';

  static const lowRiskQuestions = [
    ExaminationQuestionModel(
      id: '1',
      question: 'How old are you?',
      rightAnswerIds: ['1', '2'],
      answers: [
        ExaminationAnswerModel(
          id: '1',
          literal: 'A',
          answer: '0 - 17 years old',
        ),
        ExaminationAnswerModel(
          id: '2',
          literal: 'B',
          answer: '18 - 50 years old',
        ),
        ExaminationAnswerModel(
          id: '3',
          literal: 'C',
          answer: '51 - 74 years old',
        ),
        ExaminationAnswerModel(
          id: '4',
          literal: 'D',
          answer: '75+ years old',
        ),
      ],
    ),
    ExaminationQuestionModel(
      id: '2',
      question: 'Do you have any COVID-19 symptoms?',
      rightAnswerIds: ['5', '6'],
      answers: [
        ExaminationAnswerModel(
          id: '5',
          literal: 'A',
          answer: 'No symptom',
        ),
        ExaminationAnswerModel(
          id: '6',
          literal: 'B',
          answer:
              'Mild symptoms (< 7 days): upper respiratory, chest pain, shortness of breath, etc',
        ),
        ExaminationAnswerModel(
          id: '7',
          literal: 'C',
          answer: 'Prolonged symptoms or fatigue (> 7 days)',
        ),
      ],
    ),
  ];

  static const highRiskQuestions = [
    ExaminationQuestionModel(
      id: '3',
      question:
          'Did you require hospitalization and/or ICU (intensive care unit) after getting COVID-19 infection?',
      rightAnswerIds: ['8'],
      answers: [
        ExaminationAnswerModel(
          id: '8',
          literal: 'A',
          answer: 'No I did not',
        ),
        ExaminationAnswerModel(
          id: '9',
          literal: 'B',
          answer: 'Yes I did require hospitalization/ICU',
        ),
      ],
    ),
    ExaminationQuestionModel(
      id: '4',
      question:
          'What is your result after taking electrocardiogram (ECG) scan, blood test, troponin, brain natriuretic peptide (BNP) and chest x-ray (CXR) tests?\n(Please request an expert to take the tests)',
      rightAnswerIds: ['10'],
      answers: [
        ExaminationAnswerModel(
          id: '10',
          literal: 'A',
          answer: 'No suspect found. Everything is normal',
        ),
        ExaminationAnswerModel(
          id: '11',
          literal: 'B',
          answer: 'Abnormal result. Need to monitor further',
        ),
      ],
    ),
    ExaminationQuestionModel(
      id: '5',
      question:
          'What is your result after taking echocardiography and stress tests?\n(Please request a doctor to take the tests)',
      rightAnswerIds: ['12'],
      answers: [
        ExaminationAnswerModel(
          id: '12',
          literal: 'A',
          answer: 'No suspect found. Everything is normal',
        ),
        ExaminationAnswerModel(
          id: '13',
          literal: 'B',
          answer: 'Abnormal result. Need to monitor further',
        ),
      ],
    ),
    ExaminationQuestionModel(
      id: '6',
      question:
          'What is your result after taking computed tomography (CT) scan and D-dimer test?\n(Please request a doctor to take the tests)',
      rightAnswerIds: ['14'],
      answers: [
        ExaminationAnswerModel(
          id: '14',
          literal: 'A',
          answer: 'No suspect found. Everything is normal',
        ),
        ExaminationAnswerModel(
          id: '15',
          literal: 'B',
          answer: 'Abnormal result. Need to monitor further',
        ),
      ],
    ),
    ExaminationQuestionModel(
      id: '7',
      question:
          'Have you passed the specialized exercise program? (The program is designed for individual)',
      rightAnswerIds: ['16'],
      answers: [
        ExaminationAnswerModel(
          id: '16',
          literal: 'A',
          answer: 'Yes I have passed the program already',
        ),
        ExaminationAnswerModel(
          id: '17',
          literal: 'B',
          answer: 'No I failed it',
        ),
        ExaminationAnswerModel(
          id: '18',
          literal: 'C',
          answer:
              'I do not have any exercise program. I will contact an expert for support later',
        ),
      ],
    ),
  ];

  static const commonQuestions = [
    ExaminationQuestionModel(
      id: '8',
      question: 'Are you taking any medications?',
      rightAnswerIds: ['19'],
      answers: [
        ExaminationAnswerModel(
          id: '19',
          literal: 'A',
          answer: 'No I am not',
        ),
        ExaminationAnswerModel(
          id: '20',
          literal: 'B',
          answer: 'Yes I have to take medication(s)',
        ),
      ],
    ),
    ExaminationQuestionModel(
      id: '9',
      question: 'How long have you been symptom-free?',
      rightAnswerIds: ['22', '23', '24'],
      answers: [
        ExaminationAnswerModel(
          id: '21',
          literal: 'A',
          answer: '1 - 7 days',
        ),
        ExaminationAnswerModel(
          id: '22',
          literal: 'B',
          answer: '8 - 14 days',
        ),
        ExaminationAnswerModel(
          id: '23',
          literal: 'C',
          answer: '15 - 28 days',
        ),
        ExaminationAnswerModel(
          id: '24',
          literal: 'D',
          answer: '29+ days',
        ),
      ],
    ),
    ExaminationQuestionModel(
      id: '10',
      question: 'How long have you been resting from onset of symptoms?',
      rightAnswerIds: ['26', '27'],
      answers: [
        ExaminationAnswerModel(
          id: '25',
          literal: 'A',
          answer: '1 - 10 days',
        ),
        ExaminationAnswerModel(
          id: '26',
          literal: 'B',
          answer: '11 - 30 days',
        ),
        ExaminationAnswerModel(
          id: '27',
          literal: 'C',
          answer: '31+ days',
        ),
      ],
    ),
  ];
}
