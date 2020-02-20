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
 * or mixin the type Never
 * @author sgrekhov@unipro.ru
 */
// SharedOptions=--enable-experiment=non-nullable
// Requirements=nnbd-strong
class A {}
class B {}

class C1 extends Never {}
//               ^^^^^
// [analyzer] unspecified
// [cfe] unspecified
class C2 implements Never {}
//                  ^^^^^
// [analyzer] unspecified
// [cfe] unspecified
class C3 = A with Never;
//                ^^^^^
// [analyzer] unspecified
// [cfe] unspecified
class C4 = A with B implements Never;
//                             ^^^^^
// [analyzer] unspecified
// [cfe] unspecified
class C5 extends A with Never {}
//                      ^^^^^
// [analyzer] unspecified
// [cfe] unspecified
mixin M1 on Never {}
//          ^^^^^
// [analyzer] unspecified
// [cfe] unspecified
mixin M2 on A, Never {}
//             ^^^^^
// [analyzer] unspecified
// [cfe] unspecified
mixin M3 on A implements Never {}
//                       ^^^^^
// [analyzer] unspecified
// [cfe] unspecified

main() {
}
