/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion 
 * @description 
 */
import "../../testharness.dart";

const String htmlEL2 = r'''
<div id="div">&#x915;&#x093c;&#x0909;&#x9;a&#x308;</div>
''';

void main() {
    document.body.appendHtml(htmlEL2);
    window.onLoad.listen((e) {
        DivElement div = document.getElementById("div");
        String string = div.innerHtml;
        //should be rendered as "\u0958\u0909 \u00e4" in html.
        Expect.equals("\u0915\u093c\u0909\u0009a\u0308", string, "devanagari + a with diaeresis");
    });
}
