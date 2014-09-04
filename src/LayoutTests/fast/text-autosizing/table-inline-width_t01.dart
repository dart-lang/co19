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
import "../../../Utils/expect.dart";
import "../../testharness.dart";

const String htmlEL1 = r'''
<meta name="viewport" content="width=800">
<style>
body, html {
    overflow: hidden;
}
html {
    font-size: small;
}
.inline {
    display: inline;
    font-weight: normal;
    font-style: normal;
    background-color: green;
}
i.inline {
    background-color: blue;
}
b {
    font-weight: normal;
    font-style: normal;
    background-color: purple;
}
</style>
''';

const String htmlEL2 = r'''
This test passes if all lines have the same width.<br/>
<table>
    <tr>
        <td>a</td>
        <td>
            <div class="inline">
                AutosizeAutosizeAutosizeAutosize<br/>
                AutosizeAutosizeAutosizeAutosize<br/>
                AutosizeAutosizeAutosizeAutosize<br/>
                AutosizeAutosizeAutosizeAutosize<br/>
            </div>
            <i class="inline">AutosizeAutosizeAutosizeAutosize</i><br/>
            AutosizeAutosizeAutosizeAutosize<br/>
            AutosizeAutosizeAutosizeAutosize<br/>
            AutosizeAutosizeAutosizeAutosize<br/>
            <b><b><b><i class="inline"><b><b><b>AutosizeAutosizeAutosizeAutosize</b></b></b></i></b></b></b><br/>
            AutosizeAutosizeAutosizeAutosize<br/>
            AutosizeAutosizeAutosizeAutosize<br/>
            AutosizeAutosizeAutosizeAutosize<br/>
            AutosizeAutosizeAutosizeAutosize<br/>
            AutosizeAutosizeAutosizeAutosize<br/>
            AutosizeAutosizeAutosizeAutosize<br/>
            AutosizeAutosizeAutosizeAutosize<br/>
            AutosizeAutosizeAutosizeAutosize<br/>
            AutosizeAutosizeAutosizeAutosize
        </td>
    </tr>
</table>
''';

void main() {
    document.head.appendHtml(htmlEL1);
    document.body.appendHtml(htmlEL2);

    var inlines = document.getElementsByClassName('inline');
    var referenceWidth = inlines[0].offsetWidth;
    for (var i = 1; i < inlines.length; i++) {
        shouldBe(inlines[i].offsetWidth, referenceWidth, "$i");
    }
    checkTestFailures();
}
