/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion
 * @description Tests that an image at a column boundary is recorded properly for balancing
 */
import "dart:html";
import "../../testharness.dart";
import "../../../Utils/expect.dart";

const String htmlEL2 = r'''
<p>There should be a <em>square</em> with some stuff inside below.</p>
<div id="console"></div>
<div id="mc" style="-webkit-columns:3; columns:3; width:7em; float:left; orphans:1; widows:1; background:olive;">
    <div style="line-height:4em;">line</div>
    <div style="line-height:8em;">line</div>
    <img alt="x" style="display:block; height:2em;">
    <div style="line-height:4em;">line</div>
    <div style="line-height:10em;">line</div>
    <div style="line-height:2em;">line</div>
    <div style="line-height:6em;">line</div>
</div>
<div style="float:left; width:7em; height:14em; background:olive;"></div>
''';

void main() {
    document.body.appendHtml(htmlEL2, treeSanitizer: new NullTreeSanitizer());
    Element mc=document.getElementById("mc");
    Expect.equals(224, mc.offsetHeight);
}
