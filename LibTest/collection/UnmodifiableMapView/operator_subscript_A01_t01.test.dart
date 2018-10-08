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

main() {
  UnmodifiableMapView view = new UnmodifiableMapView({1 : 1, 2 : 23, 37 : 49});
  Expect.equals(1, view[1]);
  Expect.equals(23, view[2]);
  Expect.equals(49, view[37]);
  Expect.isNull(view[0]);
  Expect.isNull(view[55]);
  Expect.isNull(view["test"]);
  Expect.isNull(view[null]);
}
