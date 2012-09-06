/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion The try statement supports the definition of exception handling 
 * code in a structured way.
 * tryStatement:
 *   try block (catchPart+ finallyPart? | finallyPart)
 * ;
 * catchPart:
 *   catch '(' declaredIdentifier (', ' declaredIndentifier)? ')' block
 * ;
 * finallyPart:
 *   finally block
 * ;
 * @description Checks that various valid variations of the try statement do not cause a compile-time error.
 * @author rodionov
 * @reviewer iefremov
 */

#import("../../Utils/dynamic_check.dart");

main() {
  try {
    throw "";
  } on int catch(ok) {
  } catch(ok) {
  } finally {}

  try {
    throw "";
  } catch (final int ok) {
  } catch(ok) {}

  try {
    throw "";
  } catch (int ok, var st) {
  } catch (var ok, final st) {
  } finally {}

  checkTypeError(() {
    try {
      throw "";
    } catch (final int ok, final int st) {
    } catch (final ok, int st) {}
  });

  try {
    try {
      throw "";
    } finally {}
  } catch(ok) {}

  try {
    throw 1;
  }
  on int catch(x) {}
  on int catch(x) {}

  try {
    throw 1;
  }
  on num catch(x) {}
  on Object catch(x) {}
  on int catch(x) {}
}
