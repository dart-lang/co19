/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion  LinkedHashMap.from(Map other)
 * Creates a [LinkedHashMap<K,V>] that contains all key value pairs of [other].
 * @description Checks that [Error] is thrown if the argument is [null].
 * @author msyabro
 */
import "../../../Utils/expect.dart";
import "dart:collection";

main() {
  Expect.throws(() {
      new LinkedHashMap.from(null);
    },
    (e) => e is Error
  );
}
