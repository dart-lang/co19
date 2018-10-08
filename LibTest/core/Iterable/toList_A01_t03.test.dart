/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion abstract List<E> toList({bool growable: true})
 * Creates a List containing the elements of this Iterable.
 * The elements will be in iteration order. The list is fixed-length if growable
 * is false.
 * @description Checks that the list created with growable==false cannot change
 * it's size.
 * @author kaigorodov
 */
library toList_A01_t03;
import "../../../Utils/expect.dart";

List<String> failures = new List<String>();
 
check(List l) {
  try {
    l.clear();
    failures.add("clear");
  } on UnsupportedError {}
  try {
    l.length = 123;
    failures.add("set length");
  } on UnsupportedError {}
  try {
    l.add(null);
    failures.add("add");
  } on UnsupportedError {}
  try {
    l.removeLast();
    failures.add("removeLast");
  } on UnsupportedError {}
  try {
    l.removeRange(0, 1);
    failures.add("removeRange");
  } on UnsupportedError {}
}

test(Iterable create([Iterable content])) {
  check(create([]).toList(growable:false));
  Iterable src = create([null, [null], [], [1, 2, 3], [[null]]]);
  check(src.toList(growable:false));

  src = create([1, 2, 3, 4]);
  check(src.toList(growable:false));

  if (failures.isEmpty) return;
  StringBuffer sb = new StringBuffer();
  sb.write("following operations do not cause UnsupportedError on fixed-sized list:\n");
  sb.writeAll(failures, ", ");
  Expect.fail(sb.toString());
}
