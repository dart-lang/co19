/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion dynamic forEach(Map map, void f(key, value))
 * Applies [f] to each {key, value} pair of the [map].
 * @description Checks that all mappings are iterated exactly once.
 * @author varlax
 */
import "../../../Utils/expect.dart";
import "dart:collection";


  
main() {
  
  List keys = new List(2);
  keys[0] = 0;
  keys[1] = 0;
  List values = new List(2);
  void f(int i, Object value) {
    keys[i] += 1;
    values[i] = value;
  }
  
  Map<int, Object> map = new Map<int, Object>();
  map[0] = "3";
  map[1] = "5";
  Maps.forEach(map, f);
  
  Expect.isTrue(keys[0] == 1 && keys[1] == 1);
  Expect.isTrue(values[0] == "3" && values[1] == "5");
}
