/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion abstract E operator [](int index)
 * Throws [ArgumentError] if [index] is [:null:].
 * @description Checks that the exception is thrown as expected.
 * @author msyabro
 * @reviewer varlax
 */
import "../../../Utils/expect.dart";

void main() {
  var a = const<String>[null];
  try {
    a[null];
    Expect.fail("expected ArgumentError");
  } on ArgumentError catch(ok) {}

  a = new List(0);
  try {
    a[null];
    Expect.fail("expected ArgumentError");
  } on ArgumentError catch(ok) {}

  a = new List();
  try {
    a[null];
    Expect.fail("expected ArgumentError");
  } on ArgumentError catch(ok) {}

  a = new List.from([]);
  try {
    a[null];
    Expect.fail("expected ArgumentError");
  } on ArgumentError catch(ok) {}

  a = [];
  try {
    a[null];
    Expect.fail("expected ArgumentError");
  } on ArgumentError catch(ok) {}
}
