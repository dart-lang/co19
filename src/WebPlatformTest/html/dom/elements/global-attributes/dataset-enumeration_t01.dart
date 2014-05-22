/**
 * after web-platform-tests/html/dom/elements/global-attributes/classlist-enumeration.html
 * @assertion 
 * @description Dataset - Enumeration
 */
import 'dart:html';
import "../../../../Utils/expectWeb.dart";

void main() {
      void testEnumeration(array) {
        var d = document.createElement("div");
        for (var i = 0; i < array.length; ++i) {
          d.setAttribute(array[i], "value");
        }
        return d.dataset.length;
      }

      test(() { assert_equals(testEnumeration(['data-foo', 'data-bar', 'data-baz']), 3); },
        "A dataset should be enumeratable.");
      test(() { assert_equals(testEnumeration(['data-foo', 'data-bar', 'dataFoo']), 2); },
        "Only attributes who qualify as dataset properties should be enumeratable in the dataset.");

      checkTestFailures();
}