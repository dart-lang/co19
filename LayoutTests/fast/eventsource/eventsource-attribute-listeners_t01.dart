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
import "pwd.dart";

main() {
  document.body.setInnerHtml('''
      <p>Test EventSource attribute listener functionality.</p>
      <div id="result"></div>
      ''', treeSanitizer: new NullTreeSanitizer());

  var es = new EventSource("$root/pwd.dart"); // use existing file to supress a warning

  EventListener a = (_) {};
  es.onOpen.listen(a);

  var flag = false;
  es.onMessage.listen((e) { flag = (e.data == "hello"); });

  var evt = new MessageEvent("message", canBubble:false, cancelable:false,
    data:"hello", origin:'', lastEventId:'');
  es.dispatchEvent(evt);

  shouldBeTrue(flag);
}
