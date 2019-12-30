/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion It is an error for a class to extend, implement, or mixin the type
 * Never
 *
 * @description Check that it is an error for a class to extend, implement,
 * or mixin the type Never. Test type aliases
 * @author sgrekhov@unipro.ru
 */
// SharedOptions=--enable-experiment=non-nullable,nonfunction-type-aliases
// Requirements=nnbd-strong
class A {}
class B {}

typedef Neverland = Never;

class C1 extends Neverland {}
//               ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
class C2 implements Neverland {}
//                  ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
class C3 = A with Neverland;
//                ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
class C4 = A with B implements Neverland;
//                             ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
class C5 extends A with Neverland {}
//                      ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
mixin M1 on Neverland {}
//          ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
mixin M2 on A, Neverland {}
//             ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
mixin M3 on A implements Neverland {}
//                       ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

main() {
}
