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
<div id="test" style="width: 200px; font-family: Ahem; font-size: 40px; text-rendering: optimizelegibility; text-align: justify;">a&shy;b c de</div>
<div id="reference" style="width: 200px; font-family: Ahem; font-size: 40px; text-align: justify;">a&shy;b c de</div>
''';

num widthOfFirstThreeCharacters(id) {
    var text = document.getElementById(id).firstChild;
    var range = document.createRange();
    range.setStart(text, 0);
    range.setEnd(text, 3);
    return range.getBoundingClientRect().width;
}

void main() {
    document.body.appendHtml(htmlEL2);
    Expect.equals(widthOfFirstThreeCharacters("test"), widthOfFirstThreeCharacters("reference"));
}

