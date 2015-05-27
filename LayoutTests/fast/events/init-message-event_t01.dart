/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description Checks that MessageEvent() is working
 * @static-warning
 */
import "dart:html";
import "../../testcommon.dart";
import "../../../Utils/async_utils.dart";

main() {
  shouldThrow(() => new MessageEvent("message", canBubble:true, cancelable:true,
    data:"ff", origin:"*", lastEventId:'43', source:window, messagePorts:{'x':1}));
      
  var newEvent = new MessageEvent("message", canBubble:true, cancelable:true,
    data:"ff", origin:"*", lastEventId:'43', source:window, messagePorts:null);
  shouldBeTrue(newEvent is MessageEvent);
}
