/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Queue.from(Iterable elements)
 * @description Checks that exception is thrown
 * @author msyabro
 * @needsreview undocumented
 */
import "../../../Utils/expect.dart";
import "dart:collection";

main() {
  try {
    Queue<int> list = new Queue.from(null);
    Expect.fail("Error is expected");
  } on Error catch(e) {}
}
