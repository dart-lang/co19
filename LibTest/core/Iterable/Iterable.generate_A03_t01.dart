/*
 * Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Iterable.generate(int count, [E generator(int index)])
 * Creates an Iterable that generates its elements dynamically.
 * An Iterator created by iterator will count from zero to count - 1, and call
 * generator with each index in turn to create the next value.
 * If generator is omitted, it defaults to an identity function on integers
 * (int x) => x, so it should only be omitted if the type parameter allows
 * integer values.
 * As an Iterable, new Iterable.generate(n, generator)) is equivalent to
 * const [0, ..., n - 1].map(generator).
 * @description Checks that Iterators created by the Iterable.generate() is
 * equivalent to const [0, ..., n - 1].map(generator)
 * @author sgrekhov@unipro.ru
 */
import "../../../Utils/expect.dart";

int generator(int index) => index * 2;

main() {
  const arr = const [0, 1, 2, 3, 4, 5];
  Iterable i1 = arr.map(generator);
  Iterable i2 = new Iterable.generate(arr.length, generator);

  Expect.equals(arr.length, i1.length);
  Expect.equals(arr.length, i2.length);
  for (var i = 0; i < arr.length; i++) {
    Expect.equals(i1.elementAt(i), i2.elementAt(i));
  }
}
