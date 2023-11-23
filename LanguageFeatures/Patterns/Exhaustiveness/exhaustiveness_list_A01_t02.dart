// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Switch expression with a list as a matched type can be exhaustive
///
/// @description Check that it is no compile-time error if a matched type of a
/// switch expression is a list and all cases are exhaustive. Test rest element
/// at the middle of the list pattern
/// @author sgrekhov22@gmail.com

import "../../../Utils/expect.dart";

String test1(List<int> l) =>
  switch (l) {
    [] => "0",
    <int?>[_] => "1",
    [_, _] => "2",
    [_, ..., _] => "2+"
  };

String test2(List<bool> l) =>
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
  Expect.equals("0", test1([]));
  Expect.equals("1", test1([1]));
  Expect.equals("2", test1([1, 2]));
  Expect.equals("2+", test1([1, 2, 3]));

  Expect.equals("0", test2([]));
  Expect.equals("1_1", test2([true]));
  Expect.equals("1_2", test2([false]));
  Expect.equals("2_1", test2([true, true]));
  Expect.equals("2_2", test2([true, false]));
  Expect.equals("3_1", test2([true, true, true]));
  Expect.equals("3_2", test2([true, false, false]));

}
