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
import "../../../../Utils/expect.dart";

const String htmlEL2 = r'''
    <p>There should be two identical boxes below.</p>
    <div id="mc" style="-webkit-columns:3; columns:3; orphans:1; widows:1; color:olive; background:olive;">
      <div style="font-size:1.3em;">line</div>
      <div>line</div>
      <div>line</div>
      <div>line</div>
      <div>line</div>
      <div>line</div>
      <div>line</div>
      <div>line</div>
      <div>line</div>
    </div>
    <div id="ref" style="margin-top:1em; color:olive; background:olive;">
      <div style="font-size:1.3em;">line</div>
      <div>line</div>
      <div>line</div>
    </div>
''';

void main() {
    document.body.appendHtml(htmlEL2);
    Element mc=document.getElementById("mc");
    Element ref=document.getElementById("ref");
    Expect.equals(ref.offsetHeight, mc.offsetHeight);
}
