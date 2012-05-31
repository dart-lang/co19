/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Execution of a throw statement of the form throw e; proceeds as follows:
 * The expression e is evaluated yielding a value v. If v evaluates to null, then a
 * NullPointerException is thrown. Otherwise, control is transferred
 * to the nearest dynamically enclosing exception handler (11.9), with the current
 * exception set to v and the current stack trace set to the series of activations
 * that led to execution of the current function.
 * @description Checks that attempting to throw null in any manner results in 
 * NullPointerException being thrown instead.
 * @author rodionov
 */

n() {
  return null;
}

n2() {}

main() {
  try {
    throw null;
    Expect.fail("NullPointerException expected.");
  } catch (NullPointerException ok) {}

  try {
    throw n();
    Expect.fail("NullPointerException expected.");
  } catch (NullPointerException ok) {}

  try {
    throw n2();
    Expect.fail("NullPointerException expected.");
  } catch (NullPointerException ok) {}

  try {
    throw (true ? null : null);
    Expect.fail("NullPointerException expected.");
  } catch (NullPointerException ok) {}
}
