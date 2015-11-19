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
    <span id="inlineElement" style="position:relative; left:10px;"></span>
''';

void main() {
    description('<a href="https://bugs.webkit.org/show_bug.cgi?id=91168">Bug 91168</a>: REGRESSION: RenderInline boundingBox ignores relative position offset');
    document.body.appendHtml(htmlEL2, treeSanitizer: new NullTreeSanitizer());
    Element inline = document.getElementById("inlineElement");
    var inlineRect = inline.getBoundingClientRect();
    var inlineLeftOffset = inline.style.left;
    inlineLeftOffset=inlineLeftOffset.substring(0,inlineLeftOffset.length-2);// cut suffix "px"
    inlineLeftOffset=double.parse(inlineLeftOffset);
    var parent = inline.parentNode;
    var parentRect = parent.getBoundingClientRect();
    Expect.equals(parentRect.left + inlineLeftOffset, inlineRect.left);
}
