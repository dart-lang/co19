/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion
 * @description
 */
import "dart:html";
import "../../testharness.dart";
import "../../../Utils/expect.dart";

const String htmlEL2 = r'''
This test verifies that the dropdown background colors of &lt;select&gt; and &lt;select size="0"|"1"&gt; are consistent. You should see PASS below if test passes. Otherwise, FAIL shows up.
<div id='result'>FAIL</div>

Default:
<select id='default-select'>
    <option>Item 1</option>
    <option>Item 2</option>
</select>

Size=0:
<select size="0" id='size0-select'>
    <option>Item 1</option>
    <option>Item 2</option>
</select>

Size=1:
<select size="1" id='size1-select'>
    <option>Item 1</option>
    <option>Item 2</option>
</select>

<br>
Note: Two items are used so that you could manually see the difference. The test logic only needs the first item to run.

''';

Element $(id) {
    return document.getElementById(id);
}

String getBackgroundColor(el) {
    return el.getComputedStyle().backgroundColor;
}

void main() {
    document.body.appendHtml(htmlEL2, treeSanitizer: new NullTreeSanitizer());
    OptionElement default_op = ($('default-select') as SelectElement).options[0];
    OptionElement size0_op = ($('size0-select') as SelectElement).options[0];
    OptionElement size1_op = ($('size1-select') as SelectElement).options[0];

    String default_color = getBackgroundColor(default_op);
    String size0_color = getBackgroundColor(size0_op);
    String size1_color = getBackgroundColor(size1_op);

    Expect.equals(default_color, size0_color, "size0");
    Expect.equals(default_color, size1_color, "size1");
    $('result').text = "PASS";
}
