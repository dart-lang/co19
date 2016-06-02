/*
 * Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion class MapView<K, V>
 * Wrapper around a class that implements Map that only exposes Map members.
 * @description Checks that all members of [Map] are implemented.
 * @author sgrekhov@unipro.ru
 */
import "dart:collection";
import "inherited_tests.lib.dart" as mapTests;

MapView create([Map content]) {
  if (content == null) {
    return new MapView(new LinkedHashMap());
  } else {
    return new MapView(content);
  }
}

main() {
  mapTests.test(create);
}
