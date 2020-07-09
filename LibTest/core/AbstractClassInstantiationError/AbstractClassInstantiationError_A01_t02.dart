/*
 * Copyright (c) 2020, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion AbstractClassInstantiationError(String _className)
 * Creates a new Object instance.
 * @description Checks that [null] is not allowed as a class name here and
 * causes compile time error.
 * @author iarkh
 */

main() {
  new AbstractClassInstantiationError(null);
//                                    ^
// [analyzer] unspecified
// [cfe] unspecified

}
