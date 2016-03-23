/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion A library L exports a namespace, meaning that the declarations in
 * the namespace are made available to other libraries if they choose to import
 * L. The namespace that L exports is known as its exported namespace.
 * libraryExport:
 *   metadata export uri combinator* `;'
 * ;
 * @description Checks that it is possible to use metadata with an export
 * declaration.
 * @author rodionov
 * @reviewer kaigorodov
 */
import "../../../Utils/expect.dart";

import "syntax_t14_lib.dart";

main() {
  Expect.equals(1, foo);
  Expect.equals("show", show);
  Expect.equals("hide", hide);
}
