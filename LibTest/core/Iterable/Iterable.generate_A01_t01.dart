// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Iterable.generate(int count, [E generator(int index)])
/// Creates an Iterable that generates its elements dynamically.
/// An Iterator created by iterator will count from zero to count - 1, and call
/// generator with each index in turn to create the next value.
/// If generator is omitted, it defaults to an identity function on integers
/// (int x) => x, so it should only be omitted if the type parameter allows
/// integer values.
/// As an Iterable, new Iterable.generate(n, generator)) is equivalent to
/// const [0, ..., n - 1].map(generator).
/// @description Checks that Iterators created by the Iterable.generate() count
/// from zero to [count]-1 while iterating, and call [generator] with that index
/// to create the next value.
/// Checks that Iterators created by the Iterable contain results of invocations
/// of [generator].
/// @author kaigorodov

import "../../../Utils/expect.dart";

void check(int count) {
 int generator(int index) => index * 3;

 Iterable itbl = new Iterable.generate(count, generator);
 for (var i = 0; i < count; i++) {
   Expect.equals(i * 3, itbl.elementAt(i));
 }

 Expect.equals(count, itbl.length);
}

main() {
  check(0);
  check(1);
  check(10);
  check(1000);
}
