/*
 * Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion abstract class MapBase<K, V>
 * Base class for implementing a [Map].
 * @description Checks that all members of [Map] are implemented.
 * @author sgrekhov@unipro.ru
 */
import "dart:collection";
import "mapbase.lib.dart";
import "inherited_tests.lib.dart" as map_tests;

MapBase create([Map content]) {
  if (content == null) {
    return new MapBaseImpl();
  } else {
    return new MapBaseImpl.from(content);
  }
}

main() {
  map_tests.test(create);
}
