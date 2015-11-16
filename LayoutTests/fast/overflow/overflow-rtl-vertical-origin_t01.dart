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
    <p>This tests that the scroll origin for boxes with -webkit-writing-mode:vertical-rl; direction:rtl; overflow:scroll is correct.</p>
    <div id="test" style="-webkit-writing-mode:vertical-rl; direction:rtl; overflow:scroll; width: 200px; height: 200px">
        <div style="height: 300px; width: 100px;"></div>
    </div>
    <pre id="console"></pre>
''';

void main() {
    document.body.appendHtml(htmlEL2, treeSanitizer: new NullTreeSanitizer());
    var t = document.getElementById("test");
    var initialTop = t.scrollTop;
    
    // Scroll as far as you can.
    t.scrollTop = 1000;
    
    var newTop = t.scrollTop;
    Expect.equals(newTop, initialTop);
}
