// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Switch expression with a list as a matched type can be exhaustive
///
/// @description Check that a custom implementation of `List` can be exhaustive
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=patterns

import "dart:collection";
import "../../../Utils/expect.dart";

class MyList<T> extends ListBase<T> {
  List<T> _inner = [];

  MyList(this._inner);

  @override
  int get length {
    return  _inner.length;
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

String test1(List<int> l) =>
  switch (l) {
    [] => "0",
    [_] => "1",
    [_, _] => "2",
    [_, _, ...] => "2+"
  };

String test2(MyList<int> l) =>
  switch (l) {
    [] => "0",
    [_] => "1",
    [_, _] => "2",
    [_, _, ...] => "2+"
  };

main() {
  Expect.equals("0", test1([]));
  Expect.equals("1", test1([1]));
  Expect.equals("2", test1([1, 2]));
  Expect.equals("2+", test1([1, 2, 3]));

  Expect.equals("0", test2([]));
  Expect.equals("1_1", test2([true]));
  Expect.equals("1_2", test2([false]));
  Expect.equals("2_1", test2([true, true]));
  Expect.equals("2_2", test2([true, false]));
  Expect.equals("3_1", test2([true, true, false]));
  Expect.equals("3_2", test2([true, false, false]));
}
