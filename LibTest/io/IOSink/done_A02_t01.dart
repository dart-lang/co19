/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Future done
 * This future is identical to the future returned by [close].
 * @description Checks that returned [Future] is identical to one returned by
 * the [close] method.
 * @author iarkh@unipro.ru
 */
import "../../../Utils/expect.dart";
import "dart:io";
import "dart:async";

main() {
  StreamController<List<int>> controller = new StreamController<List<int>>();
  IOSink sink = new IOSink(controller);

  Future done = sink.done;
  Future close = sink.close();

  Expect.equals(close, done);
}
