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
 * @description Check inference infers the extension type first and then infers
 * method type parameter.
 * @author iarkh@unipro.ru
 */
// SharedOptions=--enable-experiment=extension-methods

import "../../Utils/expect.dart";

int count(String string, int length) => length + string.length;

extension SuperList<T> on List<T> {
  R foldRight<R>(R base, R combine(T element, R accumulator)) {
    for (int i = this.length - 1; i >= 0; i--) {
      base = combine(this[i], base);
    }
    return base;
  }
}

List<List<String>> toTest = [
  ["123"],
  [],
  [""],
  ["", "", "", "", ""],
  ["1", "12", "123", "1234", "12345", "123456", "1234567"],
  ["123", "456", "", "0", "testme", "abcd", ""]
];

main() {
  toTest.forEach((List<String> strings) {
    int len = 0;
    strings.forEach((String str) { len += str.length; });
    Expect.equals(len, strings.foldRight(0, count));
  });
}
