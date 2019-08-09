/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion It is an error for a class to extend, implement, or mixin a type
 * of the form T? for any T.
 *
 * @description Check that it is an error for a class to extend, implement,
 * or mixin a type of the form T? for any T.
 * @author sgrekhov@unipro.ru
 */
// SharedOptions=--enable-experiment=non-nullable
class A {}
class B {}
class C {}

class C1 extends A? {}                //# 01: compile-time error
class C2 implements A? {}             //# 02: compile-time error
class C3 = A with B?;                 //# 03: compile-time error
class C4 = A with B implements C?;    //# 04: compile-time error
class C5 extends A with B? {}         //# 05: compile-time error
mixin M1 on A? {}                     //# 06: compile-time error
mixin M2 on A, B? {}                  //# 07: compile-time error
mixin M3 on A implements B? {}        //# 08: compile-time error

main() {
}
