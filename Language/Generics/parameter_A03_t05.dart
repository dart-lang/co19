/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion
 *    typeParameter ::= metadata identifier (extends typeNotVoid)?
 *    typeParameters ::= ‘<’ typeParameter (‘,’ typeParameter)* ‘>’
 * ...
 * It is a compile-time error if a type parameter is a supertype of its upper
 * bound when that upper bound is itself a type variable.
 * This prevents circular declarations like [X extends X] and [X extends Y, Y
 * extends X].
 * @description Checks that it is a compile error if function type variable is a
 * supertype of its upper bound.
 * @author iarkh@unipro.ru
 */

void func1<X extends X>(X) {}                                 //# 01: compile-time error
void func2<X extends Y, Y extends X>(X, Y) {}                 //# 02: compile-time error
void func3<X extends Y, Y extends Z, Z extends X>(X, Y, Z) {} //# 03: compile-time error

main() {}
