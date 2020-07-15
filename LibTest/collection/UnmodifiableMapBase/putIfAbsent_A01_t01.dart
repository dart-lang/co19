/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion V putIfAbsent(K key, V ifAbsent())
 * This operation is not supported.
 * @description Checks that [putIfAbsent] method is not supported.
 * @author iarkh@unipro.ru
 */
import "dart:collection";
import "../../../Utils/expect.dart";
import "unmodifiablemapbase.lib.dart";

main() {
  UnmodifiableMapBase base = new UnmodifiableMapBaseImpl({1 : 1, 2 : 2});
  Expect.throws(() {
    base.putIfAbsent("1", () {
      Expect.fail("");
      return 0;
    });
  }, (e) => e is UnsupportedError);
}
