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
<style type="text/css">
    ul, li {display: inline;}
    ul {margin: 0;}
    li { float: left; }
    li:last-child:after {content: "4";}
</style>
''';

const String htmlEL2 = r'''
    You should see 1234 below (4 won't be visible in the DRT text dump, but it should still say PASS below)<br>
    <ul>
        <li>1</li>
        <li>2</li>
        <li>3</li>
    </ul>
    <br>
    <div>FAIL</div>
''';

void main() {
    document.head.appendHtml(htmlEL1);
    document.body.appendHtml(htmlEL2);
    Expect.isTrue(document.getElementsByTagName('li')[2].offsetWidth > document.getElementsByTagName('li')[0].offsetWidth);
    document.getElementsByTagName('div')[0].text = "PASS";
}
