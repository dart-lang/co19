/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Constructs a regular expression.
 * @description Checks that using a null flags argument results in NullPointerException
 * @author rodionov
 * @reviewer iefremov
 * @needsreview
 */
 

main() {
  try {
    RegExp re = const RegExp(@".", null);
    Expect.fail("NullPointerException expected");
  } catch (NullPointerException ok) { }
}
