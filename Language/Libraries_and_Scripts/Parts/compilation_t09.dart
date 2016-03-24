/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Compiling a part directive of the form part s; causes the Dart
 * system to attempt to compile the contents of the URI that is the value of s.
 * The top-level declarations at that URI are then compiled by the Dart compiler
 * in the scope of the current library. It is a compile-time error if the
 * contents of the URI are not a valid part declaration.
 * @description Checks that it is a compile-time error when this library
 * references itself in a part directive (and doesn't contain a part
 * declaration).
 * @compile-error
 * @author rodionov
 * @reviewer kaigorodov
 */

library Parts_test_lib;
part "compilation_t09.dart";

main() {
}
