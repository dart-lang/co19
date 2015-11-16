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
<style>
    #target { width: 50px; height: 50px; background-color: red; margin: 10px; }
    #target:hover { background-color: green; }
</style>
''';

const String htmlEL11 = r'''
    #target { width: 50px; height: 50px; background-color: red; margin: 10px; }
    #target:hover { background-color: green; }
''';

const String htmlEL2 = r'''
<p>
    Test for <i><a href="https://bugs.webkit.org/show_bug.cgi?id=44730">https://bugs.webkit.org/show_bug.cgi?id=44730</a>
    Floats inside of multicol fail to hit test</i>.
</p>
<p>
    The red square should turn green when hovered.
</p>
<div style="-webkit-columns:2; columns:2; column-fill:auto; margin: 100; width: 300; height: 200; outline: solid black;">
    <div>
        <div style="height: 250px; background-color: purple;"></div>
        <div style="float: right; background-color: lightyellow; margin: 5px;">
            <div id="target"></div>
        </div>
    </div>
</div>
''';

void main() {
//    document.head.attributes["style"]=htmlEL11; -- even worse
    document.head.appendHtml(htmlEL1, treeSanitizer:new NullTreeSanitizer());
    document.body.setInnerHtml(htmlEL2, treeSanitizer:new NullTreeSanitizer());

    var result = document.getElementById("result");
    var hitElement = document.elementFromPoint(370, 250);
    Expect.identical(document.getElementById("target"), hitElement);
}