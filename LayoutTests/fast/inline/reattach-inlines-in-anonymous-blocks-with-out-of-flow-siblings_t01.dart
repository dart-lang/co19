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
.absolute {
    position: absolute;
}

.inlineBlock {
    display: inline-block;
}
</style>
''';

const String htmlEL2 = r'''
<p id="console"></p>
<p>
    <span></span><div>1</div>
    <span></span><div>2</div>
    <span></span><div>3</div>
</p>
''';

void applyClass(items, className) {
    for (int i = items.length - 1; i >= 0; i--) {
        items[i].classes.add(className);
    }
}

void main() {
    description("The numbers below should be on the same line.");
    document.head.appendHtml(htmlEL1);
    document.body.appendHtml(htmlEL2);
    document.body.offsetTop;
    var divs = document.getElementsByTagName("div");
    var spans = document.getElementsByTagName("span");
    applyClass(spans, "absolute");
    applyClass(divs, "inlineBlock");
    Expect.equals(divs[0].offsetTop, divs[2].offsetTop);
}
