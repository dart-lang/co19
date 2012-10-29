/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Throws a [NoNextElementException] if no element is left.
 * @description Checks that the exception is thrown.
 * @author vasya
 * @reviewer msyabro
 * @reviewer varlax
 */

main() {
  try {
    [].iterator().next();
    Expect.fail("StateError expected when calling it.next()");
  } on StateError catch(ok) { }

  try {
    const [].iterator().next();
    Expect.fail("StateError expected when calling it.next()");
  } on StateError catch(ok) { }

  List a = new List(0);
  Iterator it = a.iterator();
  try {
    it.next();
    Expect.fail("StateError expected when calling it.next()");
  } on StateError catch(ok) { }

  a = new List(null);
  a.add(null);
  it = a.iterator();
  it.next();
  try {
    it.next();
    Expect.fail("StateError expected when calling it.next()");
  } on StateError catch(ok) { }
}
