/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Type aliases are restricted to function types.
 * @description Checks that it is impossible to introduce alias for an interface type.
 * @author iefremov
 * @reviewer rodionov
 * @compile-error
 */

interface A {}
typedef A B;

main() {
}

