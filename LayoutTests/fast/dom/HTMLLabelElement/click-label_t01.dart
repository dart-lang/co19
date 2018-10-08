/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description This tests that the correct form control element is clicked 
 * when clicking on a label.
 */
import "dart:html";
import "../../../testcommon.dart";

main() {
  var clickcount = 0;

  inc(_)
  {
    clickcount++;
  }

  document.body.setInnerHtml('''
    <Label id="label1">label1<button id="b1">inc</button></label><br>
    <Label id="label2">label2<fieldset><legend><button id="b2">inc</button></legend></fieldset></label><br>
    ''', treeSanitizer: new NullTreeSanitizer());

  document.getElementById('b1').onClick.listen(inc);
  document.getElementById('b2').onClick.listen(inc);

  dispatchClickEvent(target) {
    // Create a click event and dispatch it
    var event = new Event('click', canBubble: true, cancelable: true);
    target.dispatchEvent(event);                
  }

  debug('click1');
  var label1 = document.getElementById('label1');
  dispatchClickEvent(label1);
  shouldBe(clickcount, 1);

  var label2 = document.getElementById('label2');
  dispatchClickEvent(label2);
  shouldBe(clickcount, 2);
}
