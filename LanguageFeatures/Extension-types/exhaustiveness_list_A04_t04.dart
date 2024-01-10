// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion A switch expression with `List` as the matched value type can be
/// exhaustive, which can also make a switch expression with an extension type
/// whose representation type is `List<...>` exhaustive.
///
/// @description Check that an extension type with an implementation of `List`
/// with a negative length as a representation type can be exhaustive
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=inline-class

import "dart:collection";
import "../../Utils/expect.dart";

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

extension type ET1<T>(MisbehavingList<T> _) {}
extension type ET2<T>(MisbehavingList<T> _) implements ListMixin<T> {}

String test_1(ET1<int> ml) =>
  switch (ml) {
    [] => "0",
    [_] => "1",
    [_, _] => "2",
    [_, _, ...] => "2+"
  };

String test_2(ET2<int> ml) =>
  switch (ml) {
    [] => "0",
    [_] => "1",
    [_, _] => "2",
    [_, _, ...] => "2+"
  };

main() {
  Expect.equals("0", test_1(ET1(MisbehavingList<int>([]))));
  Expect.equals("0", test_1(ET1(MisbehavingList<int>([1]))));
  Expect.equals("0", test_1(ET1(MisbehavingList<int>([1, 2]))));
  Expect.equals("0", test_1(ET1(MisbehavingList<int>([1, 2, 3]))));

  Expect.equals("0", test_2(ET2(MisbehavingList<int>([]))));
  Expect.equals("0", test_2(ET2(MisbehavingList<int>([1]))));
  Expect.equals("0", test_2(ET2(MisbehavingList<int>([1, 2]))));
  Expect.equals("0", test_2(ET2(MisbehavingList<int>([1, 2, 3]))));
}
