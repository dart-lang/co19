// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/** 
 * @assertion The syntax for catch parameters is similar to the syntax of function arguments.
 * @description Validates different forms of catch clauses.
 * @author pagolubev
 * @reviewer iefremov
 */

class A {
}


main() {
  try {}
  catch (A e) {}
  catch (final A e) {}
  catch (final e) {}

  try {}
  catch (var e) {}

  try {}
  catch (Object e, Object trace) {}

  try {}
  catch (var e, var trace) {}

  try {}
  catch (Object e, final Object trace) {}

  try {}
  catch (var e, final trace) {}

}
