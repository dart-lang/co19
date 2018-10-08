/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion abstract V operator [](Object key)
 * Returns the value for the given [key] or [null] if [key] is not in the map.
 * @description Checks that operator [] returns correct value for the given
 * [key].
 * @author iarkh@unipro.ru
 */
import "dart:collection";
import "../../../Utils/expect.dart";
import "unmodifiablemapbase.lib.dart";

main() {
  UnmodifiableMapBase base = new UnmodifiableMapBaseImpl(
      {1 : 1, 2 : 23, 37 : 49});
  Expect.equals(1, base[1]);
  Expect.equals(23, base[2]);
  Expect.equals(49, base[37]);
  Expect.isNull(base[0]);
  Expect.isNull(base[55]);
  Expect.isNull(base["test"]);
  Expect.isNull(base[null]);
}
