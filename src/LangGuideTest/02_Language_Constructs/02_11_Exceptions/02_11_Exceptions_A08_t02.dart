// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/** 
 * @assertion finally clauses are evaluated when the try construct is exited.
 * The means of exit is irrelevant, and can be by finishing the execution of the try-body,
 * by jumping out of the construct (with return, break, or continue) or by throwing an exception.
 * @description Checks that finally clauses are evaluated when try construct is exited
 * by jumping out with return.
 * @author pagolubev
 */


bool fooFin;
bool barFin;
bool caught;

void foo() {
  try {
    return;
  } finally {
    fooFin = true;
  }
}

void bar() {
  try {
    throw 1;
  } catch (var e) {
    Expect.isTrue(e == 1);
    caught = true;
    return;
  } finally {
    barFin = true;
  }
}

main() {
  fooFin = barFin = false;
  caught = false;

  foo();
  Expect.isTrue(fooFin);

  bar();
  Expect.isTrue(caught);
  Expect.isTrue(barFin);
}
