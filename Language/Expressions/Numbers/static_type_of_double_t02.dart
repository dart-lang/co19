/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion The static type of a literal double is double.
 * @description Checks that it is a compile error to assign a double literal
 * to a typed int variable.
 * @compile-error
 * @author iefremov
 * @reviewer rodionov
 */

main() {
  int d = 1.1;
}
