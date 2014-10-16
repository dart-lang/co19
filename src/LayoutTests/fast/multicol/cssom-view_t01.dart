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

const String htmlEL1 = r'''
''';

const String htmlEL2 = r'''
    <div style="-webkit-columns:3; columns:3;" id="mc">
        <div id="elm1" class="rodent">elm1</div>
        <br>
        <div>
            <div id="elm2" class="rodent">elm2</div>
            <div id="elm3" class="rodent">elm3</div>
        </div>
        <div id="elm4" class="rodent">elm4</div>
        <div id="elm5" class="rodent">elm5</div>
    </div>
    <p id="console"></p>
''';

void main() {
    document.body.attributes["style"]="margin-left:10px; margin-top:15px;";
    document.head.appendHtml(htmlEL1);
    document.body.appendHtml(htmlEL2);
    var mc = document.getElementById('mc');
    var elm1 = document.getElementById('elm1');
    var elm2 = document.getElementById('elm2');
    var elm3 = document.getElementById('elm3');
    var elm4 = document.getElementById('elm4');
    var elm5 = document.getElementById('elm5');
    shouldBe(mc.offsetLeft, 10, "mc.offsetLeft");
    shouldBe(mc.offsetTop, 15, "mc.offsetTop");

    shouldBe(elm1.offsetLeft, mc.offsetLeft, "elm1.offsetLeft");
    shouldBe(elm1.offsetTop, mc.offsetTop, "");
    shouldBeTrue(elm2.offsetLeft > elm1.offsetLeft, "elm2.offsetLeft");
    shouldBe(elm2.offsetTop, elm1.offsetTop, "elm2.offsetTop");
    shouldBe(elm3.offsetLeft, elm2.offsetLeft, "elm3.offsetLeft");
    shouldBeTrue(elm3.offsetTop > elm2.offsetTop, "elm3.offsetTop");
    shouldBeTrue(elm4.offsetLeft > elm3.offsetLeft, "elm4.offsetLeft");
    shouldBe(elm4.offsetTop, elm1.offsetTop, "elm4.offsetTop");
    shouldBe(elm5.offsetLeft, elm4.offsetLeft, "elm5.offsetLeft");
    shouldBe(elm5.offsetTop, elm3.offsetTop, "elm5.offsetTop");

    var elements = document.getElementsByClassName('rodent');
    for (var i = 0; i < elements.length; i++) {
        var rects = elements[i].getClientRects();
        shouldBe(rects.length, 1, "i=$i,rects.length");
        shouldBe(rects[0].left, elements[i].offsetLeft, "$i,rects[0].left");
        shouldBe(rects[0].top, elements[i].offsetTop, "$i,rects[0].top");
    }
    checkTestFailures();
}
