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
 * @issue 40949
 */
// SharedOptions=--enable-experiment=non-nullable
// Requirements=nnbd-strong
class A {}
class B {}
class C {}

class C1 extends A? {}
//               ^^
// [analyzer] unspecified
// [cfe] unspecified
class C2 implements A? {}
//                  ^^
// [analyzer] unspecified
// [cfe] unspecified
class C3 = A with B?;
//                ^^
// [analyzer] unspecified
// [cfe] unspecified
class C4 = A with B implements C?;
//                             ^^
// [analyzer] unspecified
// [cfe] unspecified
class C5 extends A with B? {}
//                      ^^
// [analyzer] unspecified
// [cfe] unspecified
mixin M1 on A? {}
//          ^^
// [analyzer] unspecified
// [cfe] unspecified
mixin M2 on A, B? {}
//             ^^
// [analyzer] unspecified
// [cfe] unspecified
mixin M3 on A implements B? {}
//                       ^^
// [analyzer] unspecified
// [cfe] unspecified

main() {
}
