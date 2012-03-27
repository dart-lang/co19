/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion A catch clause of one of the forms catch (T1 p1, T2 p2) s, catch (T1 p1,
 * final p2) s, catch (T1 p1, final T2 p2) s, catch (T1 p1, var p2) s, catch ( final T1
 * p1, T2 p2) s, catch ( final T1 p1, final p2) s, catch ( final T1 p1, final T2 p2) s
 * or catch ( final T1 p1, var p2) s matches an object o if o is null or if the type
 * of o is a subtype of T1.
 * @description Checks that a catch clause matches an object o if o is null.
 * @author vasya
 * @reviewer rodionov
 * @reviewer iefremov
 * @note issue 1295, 1693
 */

class T1 {}

main() {
  bool success = false;
  try {
    throw null;
  } catch (T1 p1) {
    success = true;
  }
  Expect.isTrue(success);

  success = false;
  try {
    throw null;
  } catch (var p1) {
    success = true;
  }
  Expect.isTrue(success);

  success = false;
  try {
    throw null;
  } catch (final p1, var st) {
    success = true;
  }
  Expect.isTrue(success);

  success = false;
  try {
    throw null;
  } catch (final int p1, final st) {
    success = true;
  }
  Expect.isTrue(success);
}
