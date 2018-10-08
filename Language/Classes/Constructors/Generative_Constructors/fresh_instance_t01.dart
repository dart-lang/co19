/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion A fresh instance is an instance whose identity is distinct from
 * any previously allocated instance of its class. A generative constructor
 * always operates on a fresh instance of its immediately enclosing class.
 * @description Checks that instances created using different invocations
 * of a generative constructor are not identical.
 * @author pagolubev
 */
import "../../../../Utils/expect.dart";

class C {}

main() {
  List instances = new List();
  final int total = 100;
  for (var i = 0; i < total; ++i) {
    instances.add(new C());
  }

  for (var i = 0; i < total; ++i) {
    for (var j = i + 1; j < total; ++j) {
      Expect.isFalse(identical(instances[i], instances[j]));
    }
  }
}
