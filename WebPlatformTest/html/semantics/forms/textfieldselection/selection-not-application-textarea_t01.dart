/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/*
 * Portions of this test are derived from code under the following license:
 *
 * Web-platform-tests are covered by the dual-licensing approach described in:
 * http://www.w3.org/Consortium/Legal/2008/04-testsuite-copyright.html
 */
/**
 * after web-platform-tests/html/semantics/forms/textfieldselection/selection-not-application-textarea.html
 * @assertion http://www.w3.org/html/wg/drafts/html/master/#textFieldSelection
 * @description text field selection (textarea)
 */
import 'dart:html';
import "../../../../Utils/expectWeb.dart";

void main() {
    var el = document.createElement("textarea") as TextAreaElement;
    assert_equals(el.selectionStart, 0);
    assert_equals(el.selectionEnd, 0);
    el.selectionStart = 1;
    el.selectionEnd = 1;
    el.selectionDirection = "forward";
    el.setRangeText("foobar");
    el.setSelectionRange(0, 1);
}
