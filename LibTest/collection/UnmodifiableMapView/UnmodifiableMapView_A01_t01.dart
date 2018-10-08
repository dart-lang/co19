/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion UnmodifiableMapView(Map<K, V> map)
 * @description Checks that default constructor  creates a [UnmodifiableMapView].
 * @author iarkh@unipro.ru
 */
import "dart:collection";
import "../../../Utils/expect.dart";

check(Map map) {
  UnmodifiableMapView view = new UnmodifiableMapView(map);

  Expect.equals(map.isEmpty, view.isEmpty);
  Expect.equals(map.length, view.length);

  map.forEach ((var key, var value) {
    Expect.identical(view[key], value);
  });

  Expect.listEquals(map.keys.toList(), view.keys.toList());
  Expect.listEquals(map.values.toList(), view.values.toList());
}

main() {
  HashMap map = new HashMap();
  check(map);

  map.addAll(
      {1 : 0, 2 : 2, 3.0 : null, "testme" : "test", new Object(): "12345"});
  check(map);
}
