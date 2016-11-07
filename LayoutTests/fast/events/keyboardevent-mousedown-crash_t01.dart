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
      <div id="test"></div>
      <div id="result"></div> 
      ''', treeSanitizer: new NullTreeSanitizer());

  var event = new KeyboardEvent('mousedown', canBubble:true, cancelable:true);
  document.getElementById('test').dispatchEvent(event);

  document.getElementById('result').innerHtml = "PASS";
}
