// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Switch expression with a list as a matched type can be exhaustive
///
/// @description Check that an implementation of `List` with a negative length
/// can be exhaustive
/// @author sgrekhov22@gmail.com

import "dart:collection";
import "../../../Utils/expect.dart";

class MisbehavingList<T> with ListMixin<T> implements List<T> {
  List<T> _inner = [];

  MisbehavingList(this._inner);

  @override
  int get length {
    return (-1) * _inner.length;
  }

  @override
  void set length(int newLength) {
    _inner.length = newLength;
  }

  @override
  T operator [](int index) {
    return _inner[index];
  }

  @override
  void operator []=(int index, T value) {
    _inner[index] = value;
  }
}

String test(MisbehavingList<int> ml) =>
  switch (ml) {
    [] => "0",
    [_] => "1",
    [_, _] => "2",
    [_, _, ...] => "2+"
  };

main() {
  Expect.equals("0", test(MisbehavingList<int>([])));
  Expect.equals("0", test(MisbehavingList<int>([1])));
  Expect.equals("0", test(MisbehavingList<int>([1, 2])));
  Expect.equals("0", test(MisbehavingList<int>([1, 2, 3])));
}
