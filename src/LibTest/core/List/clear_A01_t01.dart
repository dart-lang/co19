/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Removes all elements in the list. The length of the list
 * becomes zero. 
 * @description Checks that the length of the list becomes zero.
 * @author vasya
 * @reviewer msyabro 
 * @reviewer varlax
 */
import "../../../Utils/expect.dart";

main() {
  List a = new List();
  Expect.isTrue(a.length == 0);
  a.clear();
  Expect.isTrue(a.length == 0);
  a.add(null);
  Expect.isTrue(a.length == 1);
  a.clear();
  Expect.isTrue(a.length == 0);

  a.addAll([1,2,3]);
  Expect.isTrue(a.length == 3);
  a.clear();
  Expect.isTrue(a.length == 0);

  a.addAll(["one", "two", "three", "four"]);
  Expect.isTrue(a.length == 4);
  a.clear();
  Expect.isTrue(a.length == 0);
  a.clear();
  Expect.isTrue(a.length == 0);

  for(var i = 0; i < 96756; i++) {
    a.add(i);
  }
  Expect.isTrue(a.length == 96756);
  a.clear();
  Expect.isTrue(a.length == 0);

  a = new List.from([[],[null],[1,2,3,4],["one", "two", "three", "four"]]);
  Expect.isTrue(a.length == 4);
  a.clear();
  Expect.isTrue(a.length == 0);

  a = [[],[null],[1,2,3,4],["one", "two", "three", "four"]];
  Expect.isTrue(a.length == 4);
  a.clear();
  Expect.isTrue(a.length == 0);
}
