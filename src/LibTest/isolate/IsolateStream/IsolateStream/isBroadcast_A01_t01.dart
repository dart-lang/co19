/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion final bool isBroadcast
 * Reports whether this stream is a broadcast stream.
 * @description Checks that implementation of MessageBox.stream returns false.
 * @author kaigorodov
 */
import "dart:isolate";
import "../../../Utils/expect.dart";

main() {
  MessageBox mbox=new MessageBox();
  IsolateStream stream=mbox.stream;

  Expect.isFalse(stream.isBroadcast);
  mbox.sink.close();
}

