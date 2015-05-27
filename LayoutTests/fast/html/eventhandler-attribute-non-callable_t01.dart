/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description This test checks that EventHandler attributes only accept 
 * JS functions as input.
 */
import "dart:html";
import "../../../Utils/expect.dart";
import "../../testcommon.dart";

main() {
  var body = document.body;

  body.setInnerHtml('''
    <div id="div"></div>
    ''', treeSanitizer: new NullTreeSanitizer());

  var div = document.getElementById("div");
  var callbackCount = 0;

  dispatchKeyEvent()
  {
    var event = new KeyboardEvent('keydown', canBubble: true, cancelable: true,
        view: null /*, keyIdentifier: 'Enter'*/);
    div.dispatchEvent(event);
  }

  div.onKeyDown.listen((_) {
    ++callbackCount;
  });

  Expect.equals(0, callbackCount);

  dispatchKeyEvent();

  Expect.equals(1, callbackCount);
}
