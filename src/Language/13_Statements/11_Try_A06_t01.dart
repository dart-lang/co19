/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion The active stack trace is an object whose toString() method produces a string
 * that is a record of exactly those function activations within the current isolate
 * that had not completed execution at the point where the current exception was
 * thrown.
 *   This implies that no synthetic function activations may be added to the trace,
 * nor may any source level activations be omitted. This means, for example, that
 * any inlining of functions done as an optimization must not be visible in the trace.
 * Similarly, any synthetic routines used by the implementation must not appear in the
 * trace.
 *   Nothing is said about how any native function calls may be represented in the trace.
 *   For each such function activation, the active stack trace includes the name
 * of the function, the bindings of all its formal parameters, local variables and
 * this, and the position at which the function was executing.
 *   The term position should not be interpreted as a line number, but rather as a
 * precise position - the exact character index of the expression that raised the exception.
 * @description Checks that stack trace contains the names of relevant functions. 
 * @author kaigorodov
 * @reviewer rodionov
 * @note Can't really test anything on stack trace even if its toString()
 * contains certain function names due to possible minification.
 */
import "../../Utils/expect.dart";

void func1() {
  throw "foo";
}
void func2() {
  func1();
}

main() {
  try {
    func2();
  } catch (p1, st) {
    Expect.isNotNull(st);
  } 
}
