/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion An unqualified function invocation i has the form
 * id(a1, ..., an, xn+1: an+1, ..., xn+k: an+k), where id is an identifier.
 * If there exists a lexically visible declaration named id, let fid be the
 * innermost such declaration. Then:
 *  • If fid is a prefix object, a compile-time error occurs.
 * . . .
 * @description Checks that if fid is a prefix object, a compile-time error
 * occurs.
 * @compile-error
 * @author ngl@unipro.ru
 */

import 'invocation_lib.dart' as lb;

main() {
  lb("ab");
}
