/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/** 
 * @description Test for bug 38050
 */
import "dart:html";
import "../../testcommon.dart";

main() {
  document.body.setInnerHtml('''
      <p>The two buttons below should say PASS:</p>
      <div id='collapseDiv' style='visibility: collapse;'>
          <input type='button' value='PASS' id='collapseButton' />
      </div>
      <div>
          <input type='button' value='PASS' id='visibilityButton' />
      </div>

      <div id='console'></div>
      ''', treeSanitizer: new NullTreeSanitizer());

  document.body.offsetTop; // Force layout.
  document.getElementById("collapseDiv").style.visibility='visible';

  // The two buttons should have the same width.
  shouldBe(document.getElementById('collapseButton').clientWidth,
      document.getElementById('visibilityButton').clientWidth);
}
