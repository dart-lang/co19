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
<div>   <a id="test"></a>    </div>
<div id="console">FAIL</div>
''';

void main() {
    document.body.appendHtml(htmlEL2, treeSanitizer: new NullTreeSanitizer());
    var rect = document.getElementById('test').getBoundingClientRect();
    Expect.isTrue(rect.top > 0 || rect.left > 0);
    document.getElementById('console').text = 'PASS';
}
