// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// @dart = 2.9

/// @assertion abstract void addAll(Iterable<E> iterable)
/// Throws an UnsupportedError if this list is not extensible.
/// @description Checks that UnsupportedError is thrown
/// if the list is not extendable.
/// @author vasya

library addAll_A02_t01;

import "../../../Utils/expect.dart";

test(List create([int length])) {

  void check(Iterable content, collection) {
    List list = create(collection.length);
    list.setRange(0, collection.length, collection);
    Expect.throws(() {list.addAll(collection);}, (e) => e is UnsupportedError);
  }

  check(new List.filled(100, null), ["1", "2", "3"]);
  check(new List.from([], growable:false), [null]);
  check(new List.filled(1, [null]), new List.filled(34567, null));
  check(const [], new List.filled(34567, null));
}
