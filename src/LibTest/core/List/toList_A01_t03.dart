/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion abstract List<E> toList({bool growable: true})
 * Creates a List containing the elements of this Iterable.
 * The elements will be in iteration order. The list is fixed-length if growable is false.
 * @description Checks that the list created with growable==false cannot change it's size.
 * @author kaigorodov
 */
import "../../../Utils/expect.dart";

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
  check([].toList(growable:false));
  List src = [null, [null], [], [1,2,3], [[null]]];
  List a = src.toList(growable:false);
  check(a);
  if (failures.isEmpty) return;
  StringBuffer sb=new StringBuffer();
  sb.write("following operations do not cause UnsupportedError on fixed-sized list:\n");
  sb.writeAll(failures, ", ");
  Expect.fail(sb.toString());
}
