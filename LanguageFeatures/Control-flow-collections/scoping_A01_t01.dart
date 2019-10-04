/*
 * Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion If a for element declares a variable, then a new namespace is
 * created on each iteration where that variable is defined. The body of the for
 * element is resolved and evaluated in that namespace. The variable goes out of
 * scope at the end of the for element's body.
 *
 * @description Checks that if a for element declares a variable, then the
 * variable goes out of scope at the end of the for element's body.
 * @author sgrekhov@unipro.ru
 */
import "../../Utils/expect.dart";

main() {
  List<int> list1 = [
    for (var i = 1; i < 4; i++) i,
    for (var i in [1, 2, 3]) i
  ];
  Expect.listEquals([1, 2, 3, 1, 2, 3], list1);

  List<int> list2 = [
    for (var i = 1; i < 3; i++)
      for (var j = 1; j < 3; j++) i + j,
    for (var i in [2, 3])
      for (var j in [1, 2]) i + j
  ];
  Expect.listEquals([2, 3, 3, 4, 3, 4, 4, 5], list2);

  List<int> list3 = [
    for (var i = 1; i < 3; i++)
      for (var j = i; j < 4; j++) i + j,
  ];
  Expect.listEquals([2, 3, 4, 4, 5], list3);
  
  var x = "a";
  List<String> list4 = [
    for (var x in ["b", "c"]) x,
    x
  ];
  Expect.listEquals(["b", "c", "a"], list4);
}
