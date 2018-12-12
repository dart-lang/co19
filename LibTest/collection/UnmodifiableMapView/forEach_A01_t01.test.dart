/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion  void forEach(void action(K key, V value))
 * Applies [f] to each key-value pair of the map.
 * @description Checks that all mappings are iterated exactly once.
 * @author iarkh@unipro.ru
 */
import "dart:collection";
import "../../../Utils/expect.dart";

main() {
  List keys = new List(2);
  keys[0] = 0;
  keys[1] = 0;
  List values = new List(2);
  void f(var i, Object value) {
    keys[i] += 1;
    values[i] = value;
  }

  UnmodifiableMapView view = new UnmodifiableMapView({0 : "3", 1 : "5"});
  view.forEach(f);
  
  Expect.isTrue(keys[0] == 1 && keys[1] == 1);
  Expect.isTrue(values[0] == "3" && values[1] == "5");
}
