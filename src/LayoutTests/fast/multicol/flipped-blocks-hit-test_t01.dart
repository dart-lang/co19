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

const String htmlEL2 = r'''
<div style="
    width: 200px;
    height: 100px;
    -webkit-columns: 2;
    -webkit-column-gap: 0;
    columns: 2;
    column-gap: 0;
    column-fill: auto;
    -webkit-writing-mode: horizontal-bt;
    font: 20px Ahem;
">
    1111 2222 3333 4444 5
    <div></div>
</div>
''';

void main() {
    document.body.setInnerHtml(htmlEL2, treeSanitizer:new NullTreeSanitizer());
    var offset = document.caretRangeFromPoint(38, 18).startOffset;
    Expect.equals(26, offset);
}
