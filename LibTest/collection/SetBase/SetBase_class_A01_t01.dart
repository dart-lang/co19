/*
 * Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion abstract class SetBase<E>
 * Base implementation of [Set].
 * @description Checks that all members of [Set] are implemented.
 * @author sgrekhov@unipro.ru
 */
import "dart:collection";
import "SetBase.lib.dart";
import "inherited_tests.lib.dart" as set_tests;

SetBase create([Iterable content]) {
  if (content == null) {
    return new SetBaseImpl();
  } else {
    return new SetBaseImpl.from(content);
  }
}

main() {
  set_tests.test(create);
}
