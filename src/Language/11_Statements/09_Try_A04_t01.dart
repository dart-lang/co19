/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion A catch clause of one of the forms catch(p1), catch (var p1, T p2) s,
 * catch (var p1, final p2) s, catch (var p1, final T p2) s, catch (var p1, var p2) s, catch (final
 * p1, T p2) s, catch (final p1, final p2) s, catch (final p1, final T p2) s or catch (
 * final p1, var p2) s always matches an object o.
 * @description Checks that a catch clause with no particular type specified for the
 * first exception parameter matches any object.
 * @author rodionov
 * @reviewer iefremov
 */

#import("../../Utils/dynamic_check.dart");

class T1 {}
class T2 extends T1 {}

main() {
  bool success = false;
  try {
    throw new T2();
  } catch(p1) {
    success = true;
  }
  Expect.isTrue(success);

  success = false;
  try {
    throw new T1();
  } catch(p1) {
    success = true;
  }
  Expect.isTrue(success);

  success = false;
  try {
    throw "foo";
  } catch (p1, st) {
    success = true;
  }
  Expect.isTrue(success);

  checkTypeError((){
    success = false;
    try {
      throw 1;
    } catch (p1, st) {
      success = true;
    }
    Expect.isTrue(success);
  });

  success = false;
  try {
    throw success;
  } catch (p1, st) {
    success = true;
  }
  Expect.isTrue(success);

  success = false;
  try {
    throw (){};
  } catch(x) {
    success = true;
  }
  Expect.isTrue(success);
}
