/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion factory List.from(Iterable other, {bool growable: true})
 * Creates an list with the elements of other.
 * The order in the list will be the order provided by the iterator of other.
 * The returned list is growable if growable is true, otherwise it's a fixed
 * length list.
 * @description Checks that the list created with growable==false cannot change
 * it's size.
 * @author kaigorodov
 */
import "../../../Utils/expect.dart";

List<String> failures = new List<String>();
 
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
    l.removeRange(0, 1);
    failures.add("removeRange");
  } on UnsupportedError catch (ok) {}
}

main() {
  check(new List.from([], growable:false));
  List src = [null, [null], [], [1, 2, 3], [[null]]];
  List a = new List.from(src, growable:false);
  check(a);
  if (failures.isEmpty) return;
  StringBuffer sb = new StringBuffer();
  sb.write("Following operations do not cause UnsupportedError on fixed-sized "
      + "list:\n");
  sb.writeAll(failures, ", ");
  Expect.fail(sb.toString());
}
