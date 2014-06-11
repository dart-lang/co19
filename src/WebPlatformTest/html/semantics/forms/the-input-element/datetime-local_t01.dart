/**
 * after web-platform-tests/html/semantics/forms/the-input-element/datetime-local.html
 * @assertion
 * <link rel=help href="http://www.whatwg.org/specs/web-apps/current-work/multipage/common-microsyntaxes.html#local-dates-and-times">
 * <link rel=help href="http://www.whatwg.org/specs/web-apps/current-work/multipage/states-of-the-type-attribute.html#local-date-and-time-state-(type=datetime-local)">
 * @description Form input type=datetime-local
 */
import 'dart:html';
import "../../../../Utils/expectWeb.dart";

const String value='value';
const String attributes='attributes';
const String expected='expected';
const String testname='testname';
const String min='min';
const String max='max';

void main() {

  var datetimeLocal = [
    {value: "", expected: "", testname: "empty value"},
    {value: "2014-01-01T11:11:11.111", expected: "2014-01-01T11:11:11.111", testname: "datetime-local input value set to 2014-01-01T11:11:11.111 without min/max"},
    {value: "2014-01-01 11:11:11.111", expected: "2014-01-01T11:11:11.111", testname: "datetime-local input value set to 2014-01-01 11:11:11.111 without min/max"},
    {value: "2014-01-01 11:11", expected: "2014-01-01T11:11", testname: "datetime-local input value set to 2014-01-01 11:11 without min/max"},
    {value: "2014-01-01 00:00:00.000", expected: "2014-01-01T00:00", testname: "datetime-local input value set to 2014-01-01 00:00:00.000 without min/max"},
    {value: "2014-01-0 11:11", expected: "", testname: "datetime-local input value set to 2014-01-0 11:11 without min/max"},
    {value: "2014-01-01 11:1", expected: "", testname: "datetime-local input value set to 2014-01-01 11:1 without min/max"},
    {value: "2014-01-01 11:12", attributes: { min: "2014-01-01 11:11" }, expected: "2014-01-01T11:12", testname: "Value >= min attribute"},
    {value: "2014-01-01 11:10", attributes: { min: "2014-01-01 11:11" }, expected: "2014-01-01T11:11", testname: "Value < min attribute"},
    {value: "2014-01-01 11:10", attributes: { max: "2014-01-01 11:11" }, expected: "2014-01-01T11:10", testname: "Value <= max attribute"},
    {value: "2014-01-01 11:12", attributes: { max: "2014-01-01 11:11" }, expected: "2014-01-01T11:11", testname: "Value > max attribute"}
  ];
  
  for (Map w in datetimeLocal) {
    test(() {
      var input = document.createElement("input");
      input.type = "datetime-local";
      input.value = w[value];
      Map attrs=w[attributes]; 
      if (attrs!=null) {
        for (var attrName in attrs.keys) {
          input.attributes[attrName] = attrs[attrName];
        }
      }
      assert_equals(input.value, w[expected]);
    }, w[testname]);
  }

  checkTestFailures();
}
