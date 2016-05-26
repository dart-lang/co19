/*
 * Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion abstract class MapMixin<K, V>
 * Mixin implementing a Map.
 * @description Checks that all members of [Map] are implemented.
 * @author sgrekhov@unipro.ru
 */
import "dart:collection";
import "MapMixin.lib.dart";
import "allTests.lib.dart" as mapTests;

MapMixin create([Map content]) {
  if (content == null) {
    return new MapMixinImpl();
  } else {
    return new MapMixinImpl.from(content);
  }
}

main() {
  mapTests.test(create);
}
