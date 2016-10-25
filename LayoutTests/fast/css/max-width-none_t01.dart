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
      <p>
      'max-width: none' should have no effect because it is the initial state. The test succeeds if the following two blocks are rendered in the same way.
      </p>

      <div style="width:400px; border: 3px solid red">
        <div id="box1" style="width:800px; max-width:none; height:30px; border: 3px solid green">
        </div>
      </div>

      <div style="width:400px; border: 3px solid red">
        <div id="box2" style="width:800px; height:30px; border: 3px solid green">
        </div>
      </div>
      ''', treeSanitizer: new NullTreeSanitizer());

  doTest() {
    var box1 = document.getElementById('box1');
    var box2 = document.getElementById('box2');
    shouldBe(box1.clientWidth, box2.clientWidth);
  }

  doTest();
}
