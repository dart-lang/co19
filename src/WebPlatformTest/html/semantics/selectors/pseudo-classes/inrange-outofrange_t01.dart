/**
 * after web-platform-tests/html/semantics/selectors/pseudo-classes/inrange-outofrange.html
 * @assertion
 * http://www.w3.org/html/wg/drafts/html/master/#pseudo-classes
 * @description Selector: pseudo-classes (:in-range, :out-of-range)
 */
import 'dart:html';
import "../../../../Utils/expectWeb.dart";
import "utils.dart";

const String htmlEL = r'''
<input type=number value=0 min=0 max=10 id=number1>
<input type=number value=0 min=0 max=10 id=number2 disabled>
<input type=number value=0 min=1 max=10 id=number3>
<input type=number value=11 min=0 max=10 id=number4>
''';

void main() {
  document.body.appendHtml(htmlEL);
  testSelector(":in-range"
    , ["number1"]
    , "':in-range' matches all elements that are candidates for constraint validation, have range limitations, and that are neither suffering from an underflow nor suffering from an overflow");

  testSelector(":out-of-range"
    , ["number3", "number4"]
    , "':out-of-range' matches all elements that are candidates for constraint validation, have range limitations, and that are either suffering from an underflow or suffering from an overflow");
    
  InputElement number1=document.getElementById("number1");
  number1.value = "-10";
  testSelector(":in-range"
    , []
    , "':in-range' update number1's value < min");
    
  testSelector(":out-of-range"
    , ["number1", "number3", "number4"]
    , "':out-of-range' update number1's value < min");

  InputElement number3=document.getElementById("number3");
  number3.min =  "0";
  testSelector(":in-range"
    , ["number3"]
    , "':in-range' update number3's min < value");
    
  testSelector(":out-of-range"
    , ["number1", "number4"]
    , "':out-of-range' update number3's min < value");
  
  checkTestFailures();
}
