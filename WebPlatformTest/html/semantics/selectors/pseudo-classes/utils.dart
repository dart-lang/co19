library utils;
 
import 'dart:html';
import "../../../../Utils/expectWeb.dart";
 
List getElementsByIds(ids) {
  List result = [];
  ids.forEach((id) {
    result.add(document.getElementById(id));
  });
  return result;
}

void testSelector(var selector, var expectedIds, var testName) {
  test((){
    List expected=getElementsByIds(expectedIds);
    var elements = document.querySelectorAll(selector);
    List actualIds = [];
    elements.forEach((element) {
      actualIds.add(element.id);
//      print('${element}: "${element.id}"');
    });
    assert_array_equals(elements, expected, "$actualIds");
//    print("expected=$expectedIds");
//    print("actual=$actualIds");
  }, testName);
}
