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

const String htmlEL2 = r'''
        <div style="margin: 1.1em;">
            <div id="test"></div>
        </div>
        
        <p>
            Tests that a block without overflow, borders, margin or padding reports the same clientWidth as offsetWidth.
        </p>
''';

void main() {
    document.body.appendHtml(htmlEL2);
    var el = document.getElementById("test");
    Expect.equals(el.offsetWidth, el.clientWidth);
}
