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
''';

const String htmlEL2 = r'''
    <div style="-webkit-writing-mode: horizontal-bt; overflow: -webkit-paged-x; -webkit-column-gap: 20px; height: 600px; width: 100px;">
        <div style="height: 50%;"></div>
        <div style="height: 50%;"></div>
        <div style="height: 50%;"></div>
        <div id="target" style="height: 50%;"></div>
        <div id="result"></div>
    </div>
''';

void main() {
    document.body.attributes["style"]="margin: 0;";
    document.head.appendHtml(htmlEL1);
//    document.body.appendHtml(htmlEL2);
    document.body.setInnerHtml(htmlEL2, treeSanitizer:new NullTreeSanitizer());
    Expect.identical(document.caretRangeFromPoint(115, 550).startContainer, document.getElementById("target"));
}
