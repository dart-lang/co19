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
 * @description Checks that it is a compile error if class type variable is a
 * supertype of its upper bound.
 * @author iarkh@unipro.ru
 */

class G1<X extends X> {}                           //# 01: compile-time error
class G2<X extends Y, Y extends X> {}              //# 02: compile-time error
class G3<X extends Y, Y extends Z, Z extends X> {} //# 03: compile-time error

main() {}
