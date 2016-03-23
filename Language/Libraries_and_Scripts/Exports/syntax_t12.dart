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
 * @description Checks that the URI denoting the library being exported can be
 * a raw string literal.
 * @author rodionov
 * @reviewer kaigorodov
 */
import "../../../Utils/expect.dart";

import "syntax_t12_lib.dart";

main() {
  Expect.equals("hide", hide);
  Expect.equals("show", show);
  Expect.equals(1, foo);
}
