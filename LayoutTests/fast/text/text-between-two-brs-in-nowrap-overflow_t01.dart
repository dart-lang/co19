/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion
 * @description This test ensures WebKit renders text node between two BR elements
 * in a pre when inserted by a script immediately after triggering a layout.
 */
import "dart:html";
import "../../../Utils/expect.dart";

const String htmlEL2 = r'''
You should see PASS below:</p>
<pre id="test" style="width: 10ex;">---------- -----<br><br id="br"></pre> 
''';

void main() {
    document.body.appendHtml(htmlEL2, treeSanitizer: new NullTreeSanitizer());

    var text = new Text('text');
    var span = document.createElement('span');
    span.append(text);
    var testElem = document.getElementById("test");
//    testElem.insertBefore(span, document.getElementsByTagName('br')[1]);
    testElem.insertBefore(span, document.getElementById('br'));

    Expect.isTrue(span.offsetHeight > 0);
//test.parentNode.removeChild(test);
    document.body.appendHtml('PASS');
}