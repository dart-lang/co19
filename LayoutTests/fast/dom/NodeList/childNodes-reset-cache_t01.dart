/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description Test for bug 13514
 */
import "dart:html";
import "../../../../Utils/expect.dart";
import "../../../testcommon.dart";

main() {
  document.body.setInnerHtml('''
    <div id="elem"><p></p></div>
    ''', treeSanitizer: new NullTreeSanitizer());

  gc()
  {
    for (var i = 0; i < 10000; i++) { // > force garbage collection (FF requires about 9K allocations before a collect)
      var s = new Object();
    }
  }

  var elem = document.getElementById('elem');

  elem.childNodes.length;
  //elem.childNodes[0].length;
  gc();
  elem.innerHtml = "";
  gc();
  //elem.childNodes[0];
  shouldBe(elem.childNodes.length, 0);
}



