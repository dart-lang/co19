/**
 * after web-platform-tests/html/semantics/forms/the-input-element/text.html
 * @assertion
 * http://www.w3.org/html/wg/drafts/html/master/forms.html#text-(type=text)-state-and-search-state-(type=search)
 * @description Text input element
 */
import 'dart:html';
import "../../../../Utils/expectWeb.dart";

const String htmlEL='''
    <h1>Text input element</h1>
    <div style="display: none">

    <input id="text" type="text" />
    <input id="text_with_value" type="text" value="foo" />

    <input id="search" type="search" />
    <input id="search_with_value" type="search" value="foo" />

    </div>
''';

void main() {
    document.body.appendHtml(htmlEL);
    
    var types = [ 'text', 'search' ];

    for (var i = 0; i < types.length; ++i) {
      test(() {
          assert_equals(document.getElementById(types[i]).value, "");
          assert_equals(document.getElementById(types[i] + "_with_value").value, "foo");
        }, "Value returns the current value for " + types[i]);

    test(() {
        document.getElementById(types[i]).value = "A";
        assert_equals(document.getElementById(types[i]).value, "A");
        document.getElementById(types[i]).value = "B";
      }, "Setting value changes the current value for " + types[i]);

    test(() {
        // Any LF (\n) must be stripped.
        document.getElementById(types[i]).value = "\nAB";
        assert_equals(document.getElementById(types[i]).value, "AB");
        document.getElementById(types[i]).value = "A\nB";
        assert_equals(document.getElementById(types[i]).value, "AB");
        document.getElementById(types[i]).value = "AB\n";
        assert_equals(document.getElementById(types[i]).value, "AB");

        // Any CR (\r) must be stripped.
        document.getElementById(types[i]).value = "\rAB";
        assert_equals(document.getElementById(types[i]).value, "AB");
        document.getElementById(types[i]).value = "A\rB";
        assert_equals(document.getElementById(types[i]).value, "AB");
        document.getElementById(types[i]).value = "AB\r";
        assert_equals(document.getElementById(types[i]).value, "AB");

        // Any combinations of LF CR must be stripped.
        document.getElementById(types[i]).value = "\r\nAB";
        assert_equals(document.getElementById(types[i]).value, "AB");
        document.getElementById(types[i]).value = "A\r\nB";
        assert_equals(document.getElementById(types[i]).value, "AB");
        document.getElementById(types[i]).value = "AB\r\n";
        assert_equals(document.getElementById(types[i]).value, "AB");
        document.getElementById(types[i]).value = "\r\nA\n\rB\r\n";
        assert_equals(document.getElementById(types[i]).value, "AB");
      }, "Value sanitization algorithm should strip line breaks for " + types[i]);

      test(() {
          assert_equals(document.getElementById(types[i]).files, null);
        }, "files attribute must return null for " + types[i]);

      test(() {
          assert_equals(document.getElementById(types[i]).valueAsDate, null);
        }, "valueAsDate attribute must return null for " + types[i]);

      test( () {
          assert_equals(document.getElementById(types[i]).valueAsNumber.toString(), "NaN");
        }, "valueAsNumber attribute must return NaN for " + types[i]);

      test(() {
          assert_equals(document.getElementById("text").list, null);
        }, "list attribute must return null for " + types[i]);

      test(() {
          var el = document.getElementById(types[i]);
          assert_throws("InvalidStateError", () { el.stepDown(); }, "");
        }, "stepDown does not apply for " + types[i]);

      test(() {
          var el = document.getElementById(types[i]);
          assert_throws("InvalidStateError", () { el.stepUp(); }, "");
        }, "stepUp does not apply for " + types[i]);
    }

  checkTestFailures();
}
