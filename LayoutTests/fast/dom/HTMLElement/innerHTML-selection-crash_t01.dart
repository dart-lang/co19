/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description This tests that calling innerHTML doesn't crash when the 
 * selection endpoint is inside a text field's shadow DOM tree.
 */
import "dart:html";
import "../../../../Utils/expect.dart";
import "../../../testcommon.dart";

main() {
  document.body.setInnerHtml('''
    <p></p>

    <p>If the test doesn't crash, then it passes.</p>

    <input id="field" type="text" value="some text">
    ''', treeSanitizer: new NullTreeSanitizer());

  document.getElementById('field').setAttribute('style', 'display: inline');
  document.getElementById('field').focus();
  document.body.offsetLeft;
  document.getElementById('field').setAttribute('style', 'display: block');
  document.body.innerHtml;
  document.getElementById('field').setAttribute('style', 'display: none');
}

