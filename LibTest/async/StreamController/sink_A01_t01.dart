/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion StreamSink<T> sink
 * Returns a view of this object that only exposes the StreamSink interface.
 *
 * @description Checks that only the StreamSink interface is exposed.
 * @author kaigorodov
 */

import "dart:async";
import "../../../Utils/expect.dart";

main() {
  StreamController controller = new StreamController();
  dynamic sink = controller.sink;
  Expect.isTrue(sink is StreamSink);

  sink.done;
  sink.hashCode;
  sink.runtimeType;

  sink.add(1);
  sink.addError(1);
  sink.toString();
  sink.close();

  Expect.throws(() {var v = sink.hasListener;});
  Expect.throws(() {var v = sink.isClosed;});
  Expect.throws(() {var v = sink.isPaused;});
  Expect.throws(() {var v = sink.stream;});
}
