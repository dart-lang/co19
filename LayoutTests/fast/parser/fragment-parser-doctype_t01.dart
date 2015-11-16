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

const String htmlEL2 = r'''
<p id="test"><table></table>
''';

void main() {
    document.body.appendHtml(htmlEL2, treeSanitizer: new NullTreeSanitizer());
    debug("Verify that a fragment's DOCTYPE does not affect parsing. We expect DOCTYPEs to be ignored for fragments with context elements.");
    var container = document.createElement("div");
    document.body.append(container);
    container.innerHtml = "<!DOCTYPE html><p><table>";
    shouldBe(container.firstChild.nextNode, null, "${container.firstChild.nextNode.toString()} 1");    
    debug ("Verify that a fragment's DOCTYPE does not change the compatibility mode of the owner document.");
    var test = document.getElementById("test");
    shouldBe(container.firstChild.nextNode, null, "${container.firstChild.nextNode} 2");
    checkTestFailures();
}
