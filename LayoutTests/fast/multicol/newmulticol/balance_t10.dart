/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion
 * @description auto-height multicol
 */
import "dart:html";
import "../../../testharness.dart";
import "../../../../Utils/expect.dart";

const String htmlEL2 = r'''
    <p>There should be two identical boxes below.</p>
    <div id="mc" style="-webkit-columns:3; columns:3; orphans:1; widows:1; line-height:50px; margin:1em; float:left; width:18em; color:olive; background:olive;">
      <span>line</span><br>
      <span>line</span><br>
      <span>line</span><br>
      <span>line</span><br>
      <span>line</span><br>
      <span>line</span><br>
      <span>line</span><br>
      <span style="line-height:150px;">line</span><br>
      <span>line</span><br>
      <span>line</span><br>
    </div>
    <div id="ref" style="-webkit-columns:3; columns:3; orphans:1; widows:1; line-height:50px; margin:1em; float:left; width:18em; height:250px; color:olive; background:olive;">
      <span>line</span><br>
      <span>line</span><br>
      <span>line</span><br>
      <span>line</span><br>
      <span>line</span><br>
      <span>line</span><br>
      <span>line</span><br>
      <span style="line-height:150px;">line</span><br>
      <span>line</span><br>
      <span>line</span><br>
    </div>
''';

void main() {
    document.body.appendHtml(htmlEL2, treeSanitizer: new NullTreeSanitizer());
    Element mc=document.getElementById("mc");
    Element ref=document.getElementById("ref");
    Expect.equals(ref.offsetHeight, mc.offsetHeight);
}
