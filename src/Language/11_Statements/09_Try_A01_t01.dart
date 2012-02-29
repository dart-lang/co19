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
  } catch (int ok) {
  } catch (final ok) {
  } finally {}

  try {
    throw "";
  } catch (final int ok) {
  } catch (var ok) {}

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
  } catch (var ok) {}

  try {
    throw 1;
  }
  catch(int x) {}
  catch(int x) {}

  try {
    throw 1;
  }
  catch(num x) {}
  catch(Object x) {}
  catch(int x) {}
}
