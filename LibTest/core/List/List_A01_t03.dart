/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion factory List([int length])
 * Creates a list of the given length.
 * The list is a fixed-length list if length is provided, and an empty growable
 * list if length is omitted.
 * @description Checks that created list is not resizable if length is provided.
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
  check(new List<String>(0));
  check(new List(10));
  if (failures.isEmpty) return;
  StringBuffer sb = new StringBuffer();
  sb.write("Following operations do not cause UnsupportedError on "
      + "fixed-sized list:\n");
  sb.writeAll(failures, ", ");
  Expect.fail(sb.toString());
}
