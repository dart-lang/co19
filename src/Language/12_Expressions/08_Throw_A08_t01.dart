/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion If the object being thrown is an instance of class Error or a
 * subclass thereof, its stackTrace getter will return the stack trace current
 * at the point where the the object was first thrown.
 * @description Checks that if thrown object is an instance of Error or its
 * subclass the stackTrace getter contains the stack trace.
 * @author ilya
 */
import "../../Utils/expect.dart";

class E extends Error {}

foo(x) => throw x;
bar(x) => foo(x);

main() {
  try {
    bar(new Error());
  } on Error catch(e) {
    Expect.isTrue(e.stackTrace.toString().contains('foo'));
    Expect.isTrue(e.stackTrace.toString().contains('main'));
  }
  try {
    bar(new E());
  } on Error catch(e) {
    Expect.isTrue(e.stackTrace.toString().contains('foo'));
    Expect.isTrue(e.stackTrace.toString().contains('main'));
  }
}
