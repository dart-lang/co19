/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion The static type of a list literal of the form
 * const <E>[e1... en]  or the form <E>[e1... en] is List<E>.
 * @description Checks that a compile error occurs when assigning a list
 * literal to a String variable.
 * @compile-error
 * @author msyabro
 * @reviewer iefremov
 */

main() {
  String s = [1, 2, 3];
}
