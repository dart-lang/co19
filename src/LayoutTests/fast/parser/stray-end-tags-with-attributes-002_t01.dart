/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion 
 * @description Attributes on </br> 
 */
import "dart:html";
import "../../../Utils/expect.dart";

const String htmlEL1 = r'''
<style>
br { background:lime; width:10em; height:10em; display:block; content:""; }
.fail { background:red; }
</style>
''';

const String htmlEL2 = r'''
There should be a green square and no red below: </br class=fail>
''';

void main() {
    document.head.appendHtml(htmlEL1);
    document.body.appendHtml(htmlEL2);
    var result = false;
    var elm = document.getElementsByTagName("br")[0];
    Expect.isNotNull(elm);
    Expect.notEquals("fail", elm.className);
    document.body.appendHtml("PASS");
}
