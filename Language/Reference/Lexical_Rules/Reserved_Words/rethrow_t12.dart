/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion "rethrow" is a reserved word.
 * A reserved word may not be used as an identifier; it is a compile-time error
 * if a reserved word is used where an identifier is expected.
 * @description Checks that it is a compile-time error when a reserved word
 * "rethrow" is used as an identifier in a part declaration.
 * @compile-error
 * @author rodionov
 * @reviewer kaigorodov
 */
part "rethrow_lib.dart";

void main() {
  try {
    int x = 0;
  } catch (anything) {
  }
}
