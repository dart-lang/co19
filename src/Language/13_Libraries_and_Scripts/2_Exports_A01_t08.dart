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
 * @description Checks that the URI denoting the library being exported can be
 * enclosed in single quotes as well.
 * @author rodionov
 * @reviewer kaigorodov
 */

import "2_Exports_A01_t08_lib.dart";

main() {
  Expect.equals("hide", hide);
  Expect.equals("show", show);
  Expect.equals(1, foo);
}
