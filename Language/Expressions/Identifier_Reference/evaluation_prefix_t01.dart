/*
 * Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Evaluation of an identifier expression e of the form id proceeds
 * as follows:
 * Let d be the innermost declaration in the enclosing lexical scope whose name
 * is id or id=. If no such declaration exists in the lexical scope, let d be
 * the declaration of the inherited member named id if it exists.
 * • If d is a prefix p, a compile-time error occurs unless the token
 *   immediately following d is’.’.
 * @description Checks that reference to a prefix without following '.' causes
 * compile error.
 * @compile-error
 * @author ngl@unipro.ru
 */

import '../lib.dart' as lib;

main() {
  lib;
}
