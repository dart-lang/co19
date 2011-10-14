// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/** 
 * @assertion finally clauses are evaluated when the try construct is exited.
 * The means of exit is irrelevant, and can be by finishing the execution of the try-body,
 * by jumping out of the construct (with return, break, or continue) or by throwing an exception.
 * @description Checks that finally clauses are evaluated when try-body execution is finished.
 * @author pagolubev
 * @reviewer iefremov
 */


main() {
  bool ok = false;

  try {}
  finally { ok = true; }

  Expect.isTrue(ok);

  ok = false;

  try {
    throw 1;
  } catch (var e) {
  } finally {
    ok = true;
  }

  Expect.isTrue(ok);
}
