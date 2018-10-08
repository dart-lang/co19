/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion ElementStream<Event> get onLoad
 * Stream of load events handled by this Element.
 * @description Checks that correct events are delivered via the stream
 */
import "dart:html";
import "../../../Utils/expect.dart";

main() {
  var type = 'load';
  var x = new IFrameElement();
  document.body.append(x);

  asyncStart();
  x.onLoad.listen((e) {
    Expect.equals(type, e.type);
    asyncEnd();
  });

  x.src = "/root_dart/tests/co19/src/LibTest/html/IFrameElement/iframe.html";
}
