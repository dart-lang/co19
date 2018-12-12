/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion  void forEach(void action(K key, V value))
 * Applies [f] to each key-value pair of the map.
 * @description Tries to pass function that returns something.
 * @author iarkh@unipro.ru
 */
import "dart:collection";

main() {
  UnmodifiableMapView view = new UnmodifiableMapView({1 : 3, "2" : 5});

  int f(var x, Object y) {
    return 1;
  }
  
  view.forEach(f);
}
