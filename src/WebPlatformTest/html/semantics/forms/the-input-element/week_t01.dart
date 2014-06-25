/**
 * after web-platform-tests/html/semantics/forms/the-input-element/week.html
 * @assertion
 * <link rel=help href="http://www.w3.org/html/wg/drafts/html/CR/infrastructure.html#weeks">
 * <link rel=help href="http://www.w3.org/html/wg/drafts/html/CR/forms.html#week-state-(type=week)">
 * @description Form input type=week
 */
import 'dart:html';
import "../../../../Utils/expectWeb.dart";

const String value='value';
const String expected='expected';
const String testname='testname';
const String attributes='attributes';
const String min='min';
const String max='max';

const String htmlEL='''
''';

void main() {
  document.body.appendHtml(htmlEL);

  var weeks = [
    {value: "", expected: "", testname: "empty value"},
    {value: "2014-W52", expected: "2014-W52", testname: "Valid value: Value should be 2014-W52"},
    {value: "2014-W53", expected: "", testname: "2014 has 52 weeks: Value should be empty"},
    {value: "2015-W53", expected: "2015-W53", testname: "2015 has 53 weeks: Value should be 2015-W53"},
    {value: "2014", expected: "", testname: "Invalid value: year only"},
    {value: "2014W", expected: "", testname: "Invalid value: no week number"},
    {value: "2014W52", expected: "", testname: "Invalid value: no '-' (U+002D)"},
    {value: "-W52", expected: "", testname: "Invalid value: yearless week"},
    {value: "W52", expected: "", testname: "Invalid value: yearless week and no '-' (U+002D)"},
    {value: "2014-W03", attributes: { min: "2014-W02" }, expected: "2014-W03", testname: "Value >= min attribute"},
    {value: "2014-W01", attributes: { min: "2014-W02" }, expected: "2014-W02", testname: "Value < min attribute"},
    {value: "2014-W10", attributes: { max: "2014-W11" }, expected: "2014-W10", testname: "Value <= max attribute"},
    {value: "2014-W12", attributes: { max: "2014-W11" }, expected: "2014-W11", testname: "Value > max attribute"}
  ];

  for (var i = 0; i < weeks.length; i++) {
    var w = weeks[i];
    test(() {
      var input = document.createElement("input");
      input.type = "week";
      input.value = w[value];
      var attrs = w[attributes];
      if (attrs != null) {
        for (var attrName in attrs.keys) {
          input.setAttribute(attrName, w[attributes][attrName]);
        }
      }
      assert_equals(input.value, w[expected]);
    }, w[testname]);
  }

  checkTestFailures();
}


