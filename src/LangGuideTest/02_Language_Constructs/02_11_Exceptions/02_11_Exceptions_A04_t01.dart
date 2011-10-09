// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/** 
 * @assertion A catch clause has a second optional stack trace parameter.
 * The parameter gives access to the stack trace captured when the exception was thrown.
 * The collected stack trace includes the entire stack starting with the activation that
 * raised the exception.
 * @description Checks that trace length is not a null.
 * @author pagolubev
 * @reviewer iefremov
 */


void main() {
  try {
    throw "test";
  } catch (var exception, var trace) {
    Expect.isTrue(trace.length != 0);
  }
  try {
    throw "test";
  } catch (var exception, StackTrace trace) {
    Expect.isTrue(trace.length != 0);
  }
}
