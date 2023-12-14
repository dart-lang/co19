// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion A switch expression with `List` as the matched value type can be
/// exhaustive, which can also make a switch expression with an extension type
/// whose representation type is `List<...>` exhaustive.
///
/// @description Check that it is no compile-time error if a matched type of a
/// switch expression is an extension type with a `List` as a representation
/// type  and all cases are exhaustive. Test a rest element at the middle of the
/// list pattern
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=inline-class

import "../../Utils/expect.dart";

extension type ET1<T>(List<T> _) {}
extension type ET2<T>(List<T> _) implements List<T> {}

String test1_1(ET1<int> l) =>
  switch (l) {
    [] => "0",
    <int?>[_] => "1",
    [_, _] => "2",
    [_, ..., _] => "2+"
  };

String test1_2(ET2<int> l) =>
  switch (l) {
    [] => "0",
    <int?>[_] => "1",
    [_, _] => "2",
    [_, ..., _] => "2+"
  };

String test2_1(ET1<bool> l) =>
  switch (l) {
    [] => "0",
    [true] => "1_1",
    [false] => "1_2",
    [_, true] => "2_1",
    [_, false] => "2_2",
    [_, ... var r1, true] => "3_1",
    [_, ... final r2, false] => "3_2"
  };

String test2_2(ET2<bool> l) =>
  switch (l) {
    [] => "0",
    [true] => "1_1",
    [false] => "1_2",
    [_, true] => "2_1",
    [_, false] => "2_2",
    [_, ... var r1, true] => "3_1",
    [_, ... final r2, false] => "3_2"
  };

main() {
  Expect.equals("0", test1_1(ET1([])));
  Expect.equals("1", test1_1(ET1([1])));
  Expect.equals("2", test1_1(ET1<int>([1, 2])));
  Expect.equals("2+", test1_1(ET1([1, 2, 3])));

  Expect.equals("0", test1_2(ET2([])));
  Expect.equals("1", test1_2(ET2([1])));
  Expect.equals("2", test1_2(ET2<int>([1, 2])));
  Expect.equals("2+", test1_2(ET2([1, 2, 3])));

  Expect.equals("0", test2_1(ET1([])));
  Expect.equals("1_1", test2_1(ET1([true])));
  Expect.equals("1_2", test2_1(ET1([false])));
  Expect.equals("2_1", test2_1(ET1([true, true])));
  Expect.equals("2_2", test2_1(ET1([true, false])));
  Expect.equals("3_1", test2_1(ET1([true, true, true])));
  Expect.equals("3_2", test2_1(ET1([true, false, false])));

  Expect.equals("0", test2_2(ET2([])));
  Expect.equals("1_1", test2_2(ET2([true])));
  Expect.equals("1_2", test2_2(ET2([false])));
  Expect.equals("2_1", test2_2(ET2([true, true])));
  Expect.equals("2_2", test2_2(ET2([true, false])));
  Expect.equals("3_1", test2_2(ET2([true, true, true])));
  Expect.equals("3_2", test2_2(ET2([true, false, false])));
}
