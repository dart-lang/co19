// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/** 
 * @assertion When an exception is raised, the execution stack is searched for the first
 * matching catch clause. An exception matches a clause if (and only if) the exception is an
 * instance of the type specified in the clause or if no type has been specified. When the
 * matching catch clause has been found, the execution stack is unwound up to the activation
 * frame containing the matched catch clause and the execution continues at the start of the
 * catch clause.
 * @description Checks that a code past 'throw' statement inside 'try' scopes will not be executed.
 * @author pagolubev
 * @reviewer iefremov
 */


main() {
  try {
    throw 1;
    Expect.fail("Line past 'throw' statement is reached.");
  } catch (int e) {
    Expect.isTrue(1 == e);
  }
}
