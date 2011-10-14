/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion It is a resolution error if identifier resolves to anything else than a variable, parameter, field, or accessor.
 * @description Try to assign to unidentified identifier
 * @compile-error
 * @author msyabro
 * @reviewer pagolubev
 */


main() {
  x = 1;
}
