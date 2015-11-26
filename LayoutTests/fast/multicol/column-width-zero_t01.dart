/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion
 * @description Test for column-width property with zero value
 */
import "dart:html";
import "../../testharness.dart";
import "../../../Utils/expect.dart";

const String htmlEL1 = r'''
<style>
#multicolumn
{
    display: block;
    -moz-column-width: 0;
    -o-column-width: 0;
    -webkit-column-width: 0;
    column-width: 0;
}
</style>
''';

const String htmlEL2 = r'''
<div id="multicolumn"></div>
''';

void main() {
    document.head.appendHtml(htmlEL1, treeSanitizer: new NullTreeSanitizer());
    document.body.appendHtml(htmlEL2, treeSanitizer: new NullTreeSanitizer());
    var divElement = document.getElementById("multicolumn");
    Expect.equals("auto", divElement.getComputedStyle().columnWidth);
}
