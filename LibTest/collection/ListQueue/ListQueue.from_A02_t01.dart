/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion factory ListQueue.from(Iterable elements)
 * Throws [Error] if [source] is [null]
 * @description Checks that an [Error] is thrown.
 * @author kaigorodov
 * @needsreview undocumented
 */
import "../../../Utils/expect.dart";
import "dart:collection";

main() {
  Expect.throws(() {
      ListQueue<int> list = new ListQueue.from(null);
    }, (e) => e is Error
  );
}
