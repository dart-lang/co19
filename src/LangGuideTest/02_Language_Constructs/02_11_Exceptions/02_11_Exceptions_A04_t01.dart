// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/**
 * @assertion A catch clause has a second optional stack trace parameter.
 * The parameter gives access to the stack trace captured when the exception was thrown.
 * The collected stack trace includes the entire stack starting with the activation that
 * raised the exception.
 * @description Checks that stack trace object is caught (and it is not null).
 * @author pagolubev
 * @reviewer iefremov
 */


main() {
  try {
    throw "test";
  } catch (var exception, var trace) {
    Expect.isTrue(trace != null);
  }
}
