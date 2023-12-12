// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Switch expression with a list as a matched type can be exhaustive
///
/// @description Check that an extension type with a custom implementation of
/// `List` as a representation type can be exhaustive
/// @author sgrekhov22@gmail.com

import "dart:collection";
import "../../Utils/expect.dart";

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

extension type ET1<T>(MyList<T> _) {}
extension type ET2<T>(MyList<T> _) implements List<T> {}

String test_1(ET1<int> l) =>
  switch (l) {
    [] => "0",
    [_] => "1",
    [_, _] => "2",
    [_, _, ...] => "2+"
  };

String test_2(ET2<int> l) =>
  switch (l) {
    [] => "0",
    [_] => "1",
    [_, _] => "2",
    [_, _, ...] => "2+"
  };

main() {
  Expect.equals("0", test_1(ET1(MyList<int>([]))));
  Expect.equals("1", test_1(ET1(MyList<int>([1]))));
  Expect.equals("2", test_1(ET1(MyList<int>([1, 2]))));
  Expect.equals("2+", test_1(ET1(MyList<int>([1, 2, 3]))));

  Expect.equals("0", test_2(ET2(MyList<int>([]))));
  Expect.equals("1", test_2(ET2(MyList<int>([1]))));
  Expect.equals("2", test_2(ET2(MyList<int>([1, 2]))));
  Expect.equals("2+", test_2(ET2(MyList<int>([1, 2, 3]))));
}
