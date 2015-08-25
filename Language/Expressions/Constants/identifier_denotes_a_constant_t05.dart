/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion An identifier expression that denotes a constant variable is a
 * constant expression.
 * A simple or qualified identifier denoting a class or a type alias is a
 * constant expression.
 * @description Checks that a qualified identifier that denotes a class or
 * type alias is a constant expression.
 * @author ilya
 */

import '../lib.dart' as prefix;

const a = prefix.A; // class
const b = prefix.B; // type alias

main() {
  a;
  b;
}
