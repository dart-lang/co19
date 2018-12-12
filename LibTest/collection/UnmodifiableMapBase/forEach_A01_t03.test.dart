/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion  void forEach(void action(K key, V value))
 * Applies [f] to each key-value pair of the map.
 * @description Checks that an exception thrown by the argument
 * function breaks iteration and is passed through to the caller.
 * @author iarkh@unipro.ru
 */
import "dart:collection";
import "../../../Utils/expect.dart";
import "unmodifiablemapbase.lib.dart";

main() {

  UnmodifiableMapBase base =
      new UnmodifiableMapBaseImpl({"1" : 3, "2" : 5, "3" : 8});
  
  int count = 0;
  try {
    base.forEach((var key, Object value) {
      if (count++ > 0) throw "stop";
    });
    Expect.fail("Exception expected");
  } on String catch(e) {}

  Expect.isTrue(count == 2);
}
