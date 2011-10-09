// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/** 
 * @assertion finally clauses are evaluated when the try construct is exited.
 * The means of exit is irrelevant, and can be by finishing the execution of the try-body,
 * by jumping out of the construct (with return, break, or continue) or by throwing an exception.
 * @description Checks that finally clauses are evaluated when try construct is exited
 * by jumping out with continue.
 * @author pagolubev
 * @reviewer iefremov
 */


void main() {
  bool fin = false;
  for(int i = 0; i != 1; i=1) {
    try {
      continue;
    } finally {
      fin = true;
    }
  }
  Expect.isTrue(fin);

  fin = false;
  bool caught = false;
  for(int i = 0; i != 1; i=1) {
    try {
      throw 1;
    } catch(var e) {
      Expect.isTrue(e == 1);
      caught = true;
      continue;
    } finally {
      fin = true;
    }
  }
  Expect.isTrue(caught);
  Expect.isTrue(fin);
}
