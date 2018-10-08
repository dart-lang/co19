/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion ElementStream<MouseEvent> get onDrag
 * A stream of drag events fired when this element currently being dragged.
 * A drag event is added to this stream as soon as the drag begins.
 * A drag event is also added to this stream at intervals while the drag
 * operation is still ongoing.
 * @description Checks that correct events are delivered via the stream
 */
import "dart:html";
import "../../../Utils/expect.dart";

main() {
  var type = 'drag';
  var x = document.body;

  asyncStart();
  x.onDrag.listen((e) {
    Expect.equals(type, e.type);
    asyncEnd();
  });

  var event = new Event(type);
  x.dispatchEvent(event);
}
