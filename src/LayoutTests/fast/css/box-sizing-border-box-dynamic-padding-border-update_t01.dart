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
import "../../../Utils/async_utils.dart";
import "../../resources/check-layout.dart";

main() {
  document.body.setInnerHtml('''
      <p>Test if child blocks are correctly laid out when padding/border of the box-sizing:border-box parent is updated.</p>

      <div id="target1" style="width:100px; box-sizing:border-box; border:0 solid;">
      <div data-expected-width="50">The quick brown fox jumps over the lazy dog.</div>
      </div>
      <div id="target2" style="width:100px; box-sizing:border-box;">
      <div data-expected-width="50">The quick brown fox jumps over the lazy dog.</div>
      </div>
      <div id="target3" style="width:100px; box-sizing:border-box;">
      <div data-expected-width="50">The quick brown fox jumps over the lazy dog.</div>
      </div>
      ''', treeSanitizer: new NullTreeSanitizer());

  document.body.offsetLeft;
  document.getElementById('target1').style.borderLeftWidth = '50px';
  document.getElementById('target2').style.paddingLeft = '50px';
  document.getElementById('target3').setAttribute('style', 'width:50px; box-sizing:content-box; border-left:50px solid;');
  checkLayout('#target1');
  checkLayout('#target2');
  checkLayout('#target3');
}
