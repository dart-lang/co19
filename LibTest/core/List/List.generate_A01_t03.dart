/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertionfactory List.generate(int length, E generator(int index),
 * {bool growable: true})
 * Generate a List of values.
 * Creates a list with length positions and fills them by values created by
 * calling generator for each index in the range 0 .. [length]-1 in increasing
 * order.
 * The created length's length is fixed unless growable is true.
 * @description Checks that the list created with growable==false cannot change
 * it's size.
 * @author kaigorodov
 */
import "../../../Utils/expect.dart";

typedef Generator(int index);

Generator gengen(List<Object> source) {
  return (int index) {
     return source[index];
   };
}

List<String> failures=new List<String>();
 
check(List l) {
  try {
    l.clear();
    failures.add("clear");
  } on UnsupportedError catch (ok) {}
  try {
    l.length = 123;
    failures.add("set length");
  } on UnsupportedError catch (ok) {}
  try {
    l.add(null);
    failures.add("add");
  } on UnsupportedError catch (ok) {}
  try {
    l.removeLast();
    failures.add("removeLast");
  } on UnsupportedError catch (ok) {}
  try {
    l.removeRange(0,1);
    failures.add("removeRange");
  } on UnsupportedError catch (ok) {}
}

main() {
  check(new List.generate(0, gengen([]), growable:false));
  
  List src = [null, [null], [], [1 ,2, 3], [[null]]];
  List a = new List.generate(src.length, gengen(src), growable:false);
  check(a);
  
  if (failures.isEmpty) return;
  StringBuffer sb = new StringBuffer("following operations do not cause "
      + "UnsupportedError on fixed-sized list:\n");
  sb.writeAll(failures, ", ");
  Expect.fail(sb.toString());
}
