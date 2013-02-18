/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion 
 * libraryExport:
 *   metadata export uri combinator* `;'
 * ; 
 * @description Checks that it is possible to use metadata with an export declaration.
 * @author rodionov
 * @reviewer kaigorodov
 */
import "../../Utils/expect.dart";

import "2_Exports_A01_t17_lib.dart";

main() {
  Expect.equals(1, foo);
  Expect.equals("show", show);
  Expect.equals("hide", hide);
}
