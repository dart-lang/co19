/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion A final variable is a variable whose declaration includes the modifier final.
 * It is a compile-time error if a final instance variable that has been initialized
 * at its point of declaration is also initialized in a constructor. It is a compile-time
 * error if a final instance variable that has is initialized by means of an initializing
 * formal of a constructor is also initialized elsewhere in the same constructor.
 * It is a compile-time error if a library, static or local variable v is final and v
 * is not initialized at its point of declaration.
 * @description Checks that it is not a compile-time error when a final library variable initialized
 * in its declaration is assigned a new value later in the program. Non-normative text in the spec
 * says it's a NoSuchMethodError and a static warning since there's no setter so that's what's being 
 * expected in this test.
 * @static-warning
 * @author rodionov
 * @reviewer kaigorodov
 * @issue 5885
 */

final v = 1;
final int v2 = 1;

main() {
  try {
    v = 1;
    Expect.fail("NoSuchMethodError expected");
  } on NoSuchMethodError catch(e) {}

  try {
    v = 2;
    Expect.fail("NoSuchMethodError expected");
  } on NoSuchMethodError catch(e) {}

  try {
    v2 = 1;
    Expect.fail("NoSuchMethodError expected");
  } on NoSuchMethodError catch(e) {}

  try {
    v2 = 2;
    Expect.fail("NoSuchMethodError expected");
  } on NoSuchMethodError catch(e) {}
}
