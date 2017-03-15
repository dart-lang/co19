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


main() {
  UnmodifiableMapView view = new UnmodifiableMapView({});
  Expect.isFalse(view.containsValue(""));
  Expect.isFalse(view.containsValue(0));
  Expect.isFalse(view.containsValue(1));
  Expect.isFalse(view.containsValue(2));

  view = new UnmodifiableMapView({0 : 0, 1 : 4});
  Expect.isFalse(view.containsValue(""));
  Expect.isTrue(view.containsValue(0));
  Expect.isTrue(view.containsValue(4));
  Expect.isFalse(view.containsKey(2));
}
