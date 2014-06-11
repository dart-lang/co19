/**
 * after web-platform-tests/html/semantics/forms/the-input-element/datetime.html
 * @assertion
 * http://www.w3.org/TR/html5/the-input-element.html#the-input-element
 * @description Time Inputs
 */
import 'dart:html';
import "../../../../Utils/expectWeb.dart";

const String htmlEL='''
      <div style="display: none">
        <input type="date" value="2011-12-01" min="2011-12-01" max="2011-12-31" step="5" />
        <input type="time" value= "12:00" min="11:30" max="14:00" step="600" />
        <input type="datetime" value="2011-12-01T12:00Z" min="2011-12-01T12:00Z" max="2011-12-31T22:00Z" step="7200" />
        <input type="month" value="2011-01" min="2011-01" max="2011-12" step="2" />
        <input type="week" value="2011-W40" min="2011-W20" max="2011-W50" step="2" />
    </div>
''';

void main() {
  document.body.appendHtml(htmlEL);

  test(() {assert_equals(document.getElementsByTagName("input")[0].type, "date");}
    , "date type support on input element"
    , {"help" : "http://www.w3.org/TR/html5/the-input-element.html#dom-input-type" });
      
  test(() {assert_equals(document.getElementsByTagName("input")[0].value, "2011-12-01");}
    , "[date] The value must be a valid global date and time string"
    , {"help" : "http://www.w3.org/TR/html5/common-input-element-apis.html#dom-input-value" });
      
  test(() {assert_equals(document.getElementsByTagName("input")[0].min, "2011-12-01");}
    , "[date] The min attribute must have a value that is a valid global date and time string"
    , {"help" : "http://www.w3.org/TR/html5/the-input-element.html#dom-input-min" });
      
  test(() {assert_equals(document.getElementsByTagName("input")[0].max, "2011-12-31");}
    , "[date] The max attribute must have a value that is a valid global date and time string"
    , {"help" : "http://www.w3.org/TR/html5/the-input-element.html#dom-input-max" });
      
  test(() {assert_equals(document.getElementsByTagName("input")[0].step, "5");}
    , "[date] The step attribute must be expressed in seconds"
    , {"help" : "http://www.w3.org/TR/html5/the-input-element.html#dom-input-step" });
      
  test(() {assert_equals(document.getElementsByTagName("input")[1].type, "time");}
    , "[time] time type support on input element"
    , {"help" : "http://www.w3.org/TR/html5/the-input-element.html#dom-input-type" });
      
  test(() {assert_equals(document.getElementsByTagName("input")[1].value, "12:00");}
    , "[time] The value must be a valid global date and time string"
    , {"help" : "http://www.w3.org/TR/html5/common-input-element-apis.html#dom-input-value" });
      
  test(() {assert_equals(document.getElementsByTagName("input")[1].min, "11:30");}
    , "[time] The min attribute must have a value that is a valid global date and time string"
    , {"help" : "http://www.w3.org/TR/html5/the-input-element.html#dom-input-min" });
      
  test(() {assert_equals(document.getElementsByTagName("input")[1].max, "14:00");}
    , "[time] The max attribute must have a value that is a valid global date and time string"
    , {"help" : "http://www.w3.org/TR/html5/the-input-element.html#dom-input-max" });
      
  test(() {assert_equals(document.getElementsByTagName("input")[1].step, "600");}
    , "[time] The step attribute must be expressed in seconds"
    , {"help" : "http://www.w3.org/TR/html5/the-input-element.html#dom-input-step" });
      
  test(() {assert_equals(document.getElementsByTagName("input")[2].type, "datetime");}
    , "datetime type support on input element"
    , {"help" : "http://www.w3.org/TR/html5/the-input-element.html#dom-input-type" });
      
  test(() {assert_equals(document.getElementsByTagName("input")[2].value, "2011-12-01T12:00Z");}
    , "[datetime] The must be a valid global date and time string"
    , {"help" : "http://www.w3.org/TR/html5/common-input-element-apis.html#dom-input-value" });
      
  test(() {assert_equals(document.getElementsByTagName("input")[2].min, "2011-12-01T12:00Z");}
    , "[datetime] The min attribute must have a value that is a valid global date and time string"
    , {"help" : "http://www.w3.org/TR/html5/the-input-element.html#dom-input-min" });
      
  test(() {assert_equals(document.getElementsByTagName("input")[2].max, "2011-12-31T22:00Z");}
    , "[datetime] The max attribute must have a value that is a valid global date and time string"
    , {"help" : "http://www.w3.org/TR/html5/the-input-element.html#dom-input-max" });
      
  test(() {assert_equals(document.getElementsByTagName("input")[2].step, "7200");}
    , "[datetime] The step attribute must be expressed in seconds"
    , {"help" : "http://www.w3.org/TR/html5/the-input-element.html#dom-input-step" });
      
  test(() {assert_equals(document.getElementsByTagName("input")[3].type, "month");}
    , "month type support on input element"
    , {"help" : "http://www.w3.org/TR/html5/the-input-element.html#dom-input-type" });
      
  test(() {assert_equals(document.getElementsByTagName("input")[3].value, "2011-01");}
    , "[month] The value must be a value that is a valid global date and time string"
    , {"help" : "http://www.w3.org/TR/html5/common-input-element-apis.html#dom-input-value" });
      
  test(() {assert_equals(document.getElementsByTagName("input")[3].min, "2011-01");}
    , "[month] The min attribute must have a value that is a valid global date and time string"
    , {"help" : "http://www.w3.org/TR/html5/the-input-element.html#dom-input-min" });
      
  test(() {assert_equals(document.getElementsByTagName("input")[3].max, "2011-12");}
    , "[month] The max attribute must have a value that is a valid global date and time string"
    , {"help" : "http://www.w3.org/TR/html5/the-input-element.html#dom-input-max" });
      
  test(() {assert_equals(document.getElementsByTagName("input")[3].step, "2");}
    , "[month] The step attribute must be expressed in seconds"
    , {"help" : "http://www.w3.org/TR/html5/the-input-element.html#dom-input-step" });
      
  test(() {assert_equals(document.getElementsByTagName("input")[4].type, "week");}
    , "week type support on input element"
    , {"help" : "http://www.w3.org/TR/html5/the-input-element.html#dom-input-type" });
      
  test(() {assert_equals(document.getElementsByTagName("input")[4].value, "2011-W40");}
    , "[week] The value must be a value that is a valid global date and time string"
    , {"help" : "http://www.w3.org/TR/html5/common-input-element-apis.html#dom-input-value" });
      
  test(() {assert_equals(document.getElementsByTagName("input")[4].min, "2011-W20");}
    , "[week] The min attribute must have a value that is a valid global date and time string"
    , {"help" : "http://www.w3.org/TR/html5/the-input-element.html#dom-input-min" });
      
  test(() {assert_equals(document.getElementsByTagName("input")[4].max, "2011-W50");}
    , "[week] The max attribute must have a value that is a valid global date and time string"
    , {"help" : "http://www.w3.org/TR/html5/the-input-element.html#dom-input-max" });
      
  test(() {assert_equals(document.getElementsByTagName("input")[4].step, "2");}
    , "[week] The step attribute must be expressed in seconds"
    , {"help" : "http://www.w3.org/TR/html5/the-input-element.html#dom-input-step" });
      
  checkTestFailures();
}
