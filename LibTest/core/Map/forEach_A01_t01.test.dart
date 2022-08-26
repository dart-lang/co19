// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// @dart = 2.9

/// @assertion  abstract void forEach(void f(K key, V value))
/// Applies f to each {key, value} pair of the map.
/// @description Checks that all mappings are iterated exactly once.
/// @author varlax

library forEach_A01_t01;

import "../../../Utils/expect.dart";

test(Map create([Map content])) {
  
  List keys = [0, 0];
  List values = [null, null];
  void f(var i, var value) {
    keys[i] += 1;
    values[i] = value;
  }
  
  Map map = create();
  map[0] = "3";
  map[1] = "5";
  map.forEach(f);
  
  Expect.isTrue(keys[0] == 1 && keys[1] == 1);
  Expect.isTrue(values[0] == "3" && values[1] == "5");
}
