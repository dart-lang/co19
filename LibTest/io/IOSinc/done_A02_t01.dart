/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Future done
 * This future is identical to the future returned by [close].
 * @description Checks that returned [Future] is idential to one returned by
 * [close] method.
 * @author iarkh@unipro.ru
 */
import "../../../Utils/expect.dart";
import "dart:io";
import "dart:async";

main() {
  StreamController controller = new StreamController();
  IOSink sink = new IOSink(controller);

  Future done = sink.done;
  Future close = sink.close();

  Expect.equals(close, done);
}
