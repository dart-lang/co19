/**
 * after web-platform-tests/html/semantics/forms/textfieldselection/selection-not-application-textarea.html
 * @assertion http://www.w3.org/html/wg/drafts/html/master/#textFieldSelection
 * @description text field selection (textarea)
 */
import 'dart:html';
import "../../../../Utils/expectWeb.dart";

void main() {
    var el = document.createElement("textarea");
    assert_equals(el.selectionStart, 0);
    assert_equals(el.selectionEnd, 0);
    el.selectionStart = 1;
    el.selectionEnd = 1;
    el.selectionDirection = "forward";
    el.setRangeText("foobar");
    el.setSelectionRange(0, 1);
}
