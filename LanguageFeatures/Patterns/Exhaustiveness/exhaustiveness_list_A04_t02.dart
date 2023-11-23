// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Switch expression with a list as a matched type can be exhaustive
///
/// @description Check that a custom implementation of `List` can be exhaustive
/// @author sgrekhov22@gmail.com

import "dart:collection";
import "../../../Utils/expect.dart";

class MyList<T> with ListMixin<T> implements List<T> {
  List<T> _inner = [];

  MyList(this._inner);

  @override
  int get length {
    return _inner.length;
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

String test(MyList<int> l) =>
  switch (l) {
    [] => "0",
    [_] => "1",
    [_, _] => "2",
    [_, _, ...] => "2+"
  };

main() {
  Expect.equals("0", test(MyList<int>([])));
  Expect.equals("1", test(MyList<int>([1])));
  Expect.equals("2", test(MyList<int>([1, 2])));
  Expect.equals("2+", test(MyList<int>([1, 2, 3])));
}
