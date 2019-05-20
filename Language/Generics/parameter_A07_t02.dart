/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion A type parameter cannot be used to name a constructor in an
 * instance creation expression
 * @description Checks that function type parameter cannot be used in an
 * instance creation expression.
 * @compile-error
 * @author iarkh@unipro.ru
 */

void func<X>() {
  new X();
}

main() {
}
