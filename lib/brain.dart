import 'questions.dart';

class Brain {
  int _questionnumber = 0;

  List<Question> _questiongroup = [
    Question('عدد الكواكب في المجموعه الشمسيه هو ثمانية كواكب',
        'images/image-1.jpg', true),
    Question('هل القطط حيوانات تاكل اللحوم', 'images/image-2.jpg', true),
    Question('الصين موجوده في قارة افريقيا', 'images/image-3.jpg', false),
    Question('الارض مسطحه ليست كرويه', 'images/image-4.jpg', false),
    Question('بأستطاعه الانسان البقاء علي قيد الحياه بدون اكل اللحوم؟',
        'images/image-5.jpg', true),
    Question('الشمس تدور حول الارض و الارض تدور حول القمر ؟',
        'images/image-6.jpg', false),
    Question('الحيوانات لا تشعر بالألم؟', 'images/image-7.jpg', false),
  ];
  void nextQuestion() {
    if (_questionnumber < _questiongroup.length - 1) {
      _questionnumber++;
    }
  }

  String getQuestionText() {
    return _questiongroup[_questionnumber].questionText;
  }

  String getQuestionImage() {
    return _questiongroup[_questionnumber].questionImage;
  }

  bool getQuestionAnswer() {
    return _questiongroup[_questionnumber].questionAnswers;
  }

  bool isfinished() {
    if (_questionnumber >= _questiongroup.length - 1) {
      return true;
    } else {
      return false;
    }
  }

  void reset() {
     _questionnumber = 0;
  }
}
