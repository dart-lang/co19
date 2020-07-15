/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion  bool containsValue(Object value)
 * Returns [true] if this map contains the given [value].
 * Returns [true] if any of the values in the map are equal to [value] according
 * to the [==] operator.
 * @description Checks that [true] is returned if map contains hiven [value],
 * [false] otherwise.
 * @author iarkh@unipro.ru
 */
import "dart:collection";
import "../../../Utils/expect.dart";
import "unmodifiablemapbase.lib.dart";

main() {
  UnmodifiableMapBase base = new UnmodifiableMapBaseImpl({});
  Expect.isFalse(base.containsValue(""));
  Expect.isFalse(base.containsValue(0));
  Expect.isFalse(base.containsValue(1));
  Expect.isFalse(base.containsValue(2));

  base = new UnmodifiableMapBaseImpl({0 : 0, 1 : 4});
  Expect.isFalse(base.containsValue(""));
  Expect.isTrue(base.containsValue(0));
  Expect.isTrue(base.containsValue(4));
  Expect.isFalse(base.containsKey(2));
}
