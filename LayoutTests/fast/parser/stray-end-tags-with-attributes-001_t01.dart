/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion 
 * @description Attributes on </p> 
 */
import "dart:html";
import "../../testharness.dart";
import "../../../Utils/expect.dart";

const String htmlEL1 = r'''
<style>
p { background:lime; width:10em; height:10em; }
.fail { background:red; }
</style>
''';

const String htmlEL2 = r'''
There should be a green square and no red below: </p class=fail>
''';

void main() {
    document.head.appendHtml(htmlEL1, treeSanitizer: new NullTreeSanitizer());
    document.body.appendHtml(htmlEL2, treeSanitizer: new NullTreeSanitizer());
    Node elm = document.getElementsByTagName("p")[0];
    Expect.isNotNull(elm);
    Expect.notEquals("fail", (elm as Element).className);
    document.body.appendHtml("PASS", treeSanitizer: new NullTreeSanitizer());
}
