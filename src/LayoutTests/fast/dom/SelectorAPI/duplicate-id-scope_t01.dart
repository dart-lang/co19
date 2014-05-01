/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description Test that CSS selector queries on duplicate Ids respect scope.
 */
import "dart:html";
import "../../../../Utils/expect.dart";
import "../../../testcommon.dart";

main() {
  document.body.setInnerHtml('''
    <span id="duplicateId1"></span>
    <span id="duplicateId1"></span>
    <span id="duplicateId2"></span>
    <span id="duplicateId2"></span>
    <div id="scopeDiv">
        <span id="duplicateId1"></span>
        <span id="duplicateId1"></span>
        <span id="duplicateId1"></span>
        <span id="duplicateId1"></span>
    </div>
    <div>PASS</div>
    ''', treeSanitizer: new NullTreeSanitizer());

  shouldBe(document.querySelectorAll('#duplicateId1').length, 6);
  shouldBe(document.querySelectorAll('#duplicateId2').length, 2);

  var scopeDiv = document.getElementById("scopeDiv");
  shouldBe(scopeDiv.querySelectorAll('#duplicateId1').length, 4);
  shouldBeNull(scopeDiv.querySelector('#duplicateId2'));
  shouldBe(scopeDiv.querySelectorAll('#duplicateId2').length, 0);
}
