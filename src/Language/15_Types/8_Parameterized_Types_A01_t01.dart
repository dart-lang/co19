/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Let p = G < A1, ..., An > be a parameterized type. It is a static type warning
 * if G is not a generic type with exactly n type parameters.
 * @description Checks that a static type warning is produced if G is not an accessible type.
 * @static-warning
 * @author iefremov
 * @reviewer rodionov
 */

main() {
  UnknownType<int> a /// static type warning 
    = null;
}
