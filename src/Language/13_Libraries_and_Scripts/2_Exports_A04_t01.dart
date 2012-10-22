/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion It is a compile-time error if a name N is re-exported by a library L and N
 * is introduced into the export namespace of L by more than one export.
 * @description Checks that it is a compile-time error if this library re-exports two other
 * libraries defining the same name.
 * @compile-error
 * @author rodionov
 * @issue 6134
 */
library Exports_A04_t01;

export "2_Exports_A04_lib_p1.dart";
export "2_Exports_A04_lib_p2.dart";

main() {
}
