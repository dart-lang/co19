/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description 
 */
import "dart:html";
import "../../testcommon.dart";

main() {
  document.body.setInnerHtml('''
      <div id="test">
          <select id="s1" size="1"><option>test</select>
          <select id="s2" size="1"><option>test</select>
          <select id="s3" size="1"><option>test</select>
      </div>
      ''', treeSanitizer: new NullTreeSanitizer());

  var s1,s2,s3;

  reportResults() {
    var selected1 = s1.selectedIndex;
    var selected2 = s2.selectedIndex;
    var selected3 = s3.selectedIndex;

    debug("Changing the size of a select element from 1 to 5 and back 1 should acquire selection of the first item:");
    shouldBe(selected1, 0);

    debug("Forcing layout should not affect the outcome:");
    shouldBe(selected2, selected1);

    debug("And neither should dropping out of the message loop:");
    shouldBe(selected3, selected1);

    asyncEnd();
  }

  s1 = document.getElementById("s1");
  s1.size = 5;
  s1.size = 1;

  s2 = document.getElementById("s2");
  s2.size = 5;
  // force layout.
  document.body.offsetTop;
  s2.size = 1;

  s3 = document.getElementById("s3");
  s3.size = 5;

  asyncStart();

  setTimeout(() {
    s3.size = 1;
    reportResults();
  }, 0);
}
