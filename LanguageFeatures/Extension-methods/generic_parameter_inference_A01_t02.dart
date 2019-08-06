/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion If both the extension and the method is generic, then inference
 * must infer the extension type parameters first, to figure out whether the
 * extension applies, and only then start inferring method type parameters. As
 * mentioned above, the inference is similar to other cases of chained inference.
 * @description Check that runtime error is thrown if parameter type is
 * incorrect.
 * @author iarkh@unipro.ru
 */
// SharedOptions=--enable-experiment=extension-methods

import "../../Utils/expect.dart";

int count(String string, int length) => length + string.length;
dynamic foo = count;

extension SuperList<T> on List<T> {
  R foldRight<R>(R base, R combine(T element, R accumulator)) {
    for (int i = this.length - 1; i >= 0; i--) {
      base = combine(this[i], base);
    }
    return base;
  }
}

List<List> toTest = [
  [1],
  [null],
  ["", 11],
  [1, 2, 3, 4, 5],
  [["11"], "12"]
];

main() {
  toTest.forEach((List strings) {
    Expect.throws(() { strings.foldRight(0, foo); });
  });
}
