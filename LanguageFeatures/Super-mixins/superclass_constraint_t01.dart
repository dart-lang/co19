/*
 * Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Only class types that can be subclassed, can be used as
 * super-class constraints. Types like void, dynamic, FutureOr<X> or
 * void Function(X) are not class types, and some platform types, including
 * int, bool and Null, cannot be subclassed, so none of these types can be used
 * as super-class constraints.
 *
 * @description Checks that class types that cannot be subclassed, cannot be
 * used as super-class constraints.
 * @compile-error
 * @author ngl@unipro.ru
 */
typedef F = void Function(int);

abstract class I {}

mixin M1 on void implements I {}    //# 01: compile-time error
mixin M2 on dynamic implements I {}   //# 02: compile-time error
mixin M3 on FutureOr<num> implements I {} //# 03: compile-time error
mixin M4 on F implements I {}  //# 04: compile-time error
mixin M5 on int implements I {}   //# 05: compile-time error
mixin M6 on bool implements I {}  //# 06: compile-time error
mixin M7 on Null implements I {}  //# 07: compile-time error

main() {
}
