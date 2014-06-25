/**
 * after web-platform-tests/html/semantics/forms/the-option-element/option-text-spaces.html
 * @assertion
 * http://www.whatwg.org/html/#dom-option-text
 * @description HTMLOptionElement.text
 */
import 'dart:html';
import "../../../../Utils/expectWeb.dart";

const String value='value';
const String expected='expected';
const String testname='testname';

void main() {

  var spaces = ["\u0020", "\u0009", "\u000A", "\u000C", "\u000D"];
  spaces.forEach((space) {
    test(() {
      var option = document.createElement("option");
      option.text = space + "text";
      assert_equals(option.text, "text");
    }, "option.text should strip leading space characters (" +
        format_value(space) + ")");
  });
  
  spaces.forEach((space) {
    test(() {
      var option = document.createElement("option");
      option.text = "text" + space;
      assert_equals(option.text, "text");
    }, "option.text should strip trailing space characters (" +
        format_value(space) + ")");
  });
  
  spaces.forEach((space) {
    test(() {
      var option = document.createElement("option");
      option.text = space + "text" + space;
      assert_equals(option.text, "text");
    }, "option.text should strip leading and trailing space characters (" +
        format_value(space) + ")");
  });
  
  spaces.forEach((space) {
    test(() {
      var option = document.createElement("option");
      option.text = "before" + space + "after";
      assert_equals(option.text, "before after");
    }, "option.text should replace single internal space characters (" +
        format_value(space) + ")");
  });
  
  spaces.forEach((space1) {
    spaces.forEach((space2) {
      test(() {
        var option = document.createElement("option");
        option.text = "before" + space1 + space2 + "after";
        assert_equals(option.text, "before after");
      }, "option.text should replace multiple internal space characters (" +
          format_value(space1) + ", " + format_value(space2) + ")");
    });
  });
  
  test(() {
    var option = document.createElement("option");
    option.text = "\u00a0text";
    assert_equals(option.text, "\u00a0text");
  }, "option.text should leave leading NBSP alone.");
  
  test(() {
    var option = document.createElement("option");
    option.text = "text\u00a0";
    assert_equals(option.text, "text\u00a0");
  }, "option.text should leave trailing NBSP alone.");
  
  test(() {
    var option = document.createElement("option");
    option.text = "before\u00a0after";
    assert_equals(option.text, "before\u00a0after");
  }, "option.text should leave a single internal NBSP alone.");
  
  test(() {
    var option = document.createElement("option");
    option.text = "before\u00a0\u00a0after";
    assert_equals(option.text, "before\u00a0\u00a0after");
  }, "option.text should leave two internal NBSPs alone.");

  checkTestFailures();
}
