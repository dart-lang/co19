/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description This test verifies that links to anchors without content work
 * as expected.
 */
import "dart:html";
import "../../testcommon.dart";

main() {
  var style = new Element.html(''' 
    <style>
    .spacer {
        line-height: 100em;
    }
    </style>
    ''', treeSanitizer: new NullTreeSanitizer());
  document.head.append(style);

  document.body.setInnerHtml('''
    <span>
        <a id="goto-1" href="#block1">Block 1</a><br>
        <a id="goto-2" href="#block2">Block 2</a><br>
    </span>

    <a name="block1"></a><span class="h">Block 1</span><br>
    <span class="spacer"></span>

    <a name="block2"></a><span class="h">Block 2</span><br>
    <span class="spacer"></span>
    <div>PASS</div>
    ''', treeSanitizer: new NullTreeSanitizer());

  var scrollTopBeforeClick = document.documentElement.scrollTop;
  document.getElementById('goto-1').click();
  if (document.documentElement.scrollTop > scrollTopBeforeClick)
    testPassed('Clicking link 1 scrolled to block 1.');
  else
    testFailed('Clicking link 1 didn\'t scroll as expected.');

  scrollTopBeforeClick = document.documentElement.scrollTop;
  document.getElementById('goto-2').click();
  if (document.documentElement.scrollTop > scrollTopBeforeClick)
    testPassed('Clicking link 2 scrolled to block 2.');
  else
    testFailed('Clicking link 2 didn\'t scroll as expected.');
}
