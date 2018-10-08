/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion If a name N is referenced by a library L and N would be introduced
 * into the top level scope of L by imports of two libraries, L1 and L2, and the
 * exported namespace of L1 binds N to a declaration originating in a system
 * library:
 * • The import of L1 is implicitly extended by a hide N clause.
 * • A static warning is issued.
 *
 * @description Checks that if N is referenced by L and N would be introduced
 * by explicit import of 'dart:core' and library whose URI does not begin with
 * 'dart:', then compile error is issued.
 * @static-warning
 * @author ilya
 */
import "../../../Utils/expect.dart";

import 'dart:core'; // explicit import
import "implicit_hide_lib.dart";

main() {
  Expect.equals('MYLIST', List.typename); /// static-type warning
}
