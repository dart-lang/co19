/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/** 
 * @description Setting a new font-family should reset the fallback list to
 * empty before adding the new family.
 */
import "dart:html";
import "../../../testcommon.dart";

main() {
  var wrapperDiv = document.createElement('div');
  document.body.append(wrapperDiv);

  wrapperDiv.setInnerHtml(
    '<div id="outerDiv" style="font-family: courier new, cursive;">' +
    'should be Courier New' +
    '<div id="timesDiv" style="font-family: foo;">should be Times (default font)</div>' +
    '<div id="cursiveDiv" style="font-family: cursive;">should be cursive</div>' +
    '</div>',
    treeSanitizer: new NullTreeSanitizer());

  var outerDiv = document.getElementById('outerDiv');
  var timesDiv = document.getElementById('timesDiv');
  var cursiveDiv = document.getElementById('cursiveDiv');

  shouldBeEqualToString(getComputedStyle(outerDiv, null).fontFamily, "'courier new', cursive");
  shouldBeEqualToString(getComputedStyle(timesDiv, null).fontFamily, "foo");
  shouldBeEqualToString(getComputedStyle(cursiveDiv, null).fontFamily, "cursive");
}
