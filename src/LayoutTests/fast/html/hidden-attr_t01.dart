/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description Various tests for the hidden attribute.
 */
import "dart:html";
import "../../../Utils/expect.dart";
import "../../testcommon.dart";

main() {
  var body = document.body;

  body.setInnerHtml('''
    <p id="description"></p>
    <div id="console">
    Tests that hidden in markup works:
    <div hidden><span class=fail>FAIL</span> - this line should not appear</div><div hidden=hidden><span class=fail>FAIL</span> - this line should not appear</div><div hidden=false><span class=fail>FAIL</span> - this line should not appear</div><p hidden><span class=fail>FAIL</span> - this line should not appear</p><span hidden><span class=fail>FAIL</span> - this line should not appear</span><img width=400px alt="FAIL - this should not appear" src="IntentionallyMissingFile.jpeg" hidden>

    Tests that dynamically adding/removing hidden works:
    <div hidden id=test1><span class=pass>PASS</span> - this line should appear<div id=test2><span class=fail>FAIL</span> - this line should not appear</div>
    </div>
    ''', treeSanitizer: new NullTreeSanitizer());

  document.getElementById("test1").attributes.remove("hidden");
  document.getElementById("test2").setAttribute("hidden", "");

  var testParent = document.createElement('div');
  document.body.append(testParent);

  //debug('Dynamic changing of hidden and effects on style:');
  testParent.innerHtml="<div id=test3 hidden>a</div><div id=test4>b</div>";
  var test3 = document.getElementById("test3");
  var test4 = document.getElementById("test4");

  Expect.equals("none", test3.getComputedStyle().display);
  test3.attributes.remove("hidden");
  //debug('test3.removeAttribute("hidden")');
  Expect.equals("block", test3.getComputedStyle().display);

  Expect.equals("block", test4.getComputedStyle().display);
  test4.setAttribute("hidden", "");
  //debug('test4.setAttribute("hidden", "")');
  Expect.equals("none", test4.getComputedStyle().display);
}
