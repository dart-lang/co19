/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion It is a compile-time error if the compilation unit found at the
 * specified URI is not a library declaration.
 * @description Checks that it is a compile-time error when the library being
 * exported does not have a library definition.
 * @compile-error
 * @author rodionov
 */
import "2_Exports_A05_t01_lib.dart";

main() {
  try {
    Expect.equals(1, foo);
  } catch (anything) {}
}
