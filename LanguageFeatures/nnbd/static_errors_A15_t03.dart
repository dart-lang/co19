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
 * or mixin a type of the form T? for any T. Test legacy pre-NNBD types
 * @author sgrekhov@unipro.ru
 * @issue 40949
 */
// SharedOptions=--enable-experiment=non-nullable
// Requirements=nnbd-weak
import "legacy_lib.dart";

class C1 extends A? {}
//               ^
// [analyzer] unspecified
// [cfe] unspecified
class C2 implements I? {}
//                  ^
// [analyzer] unspecified
// [cfe] unspecified
class C3 = A with M?;
//                ^
// [analyzer] unspecified
// [cfe] unspecified
class C4 = A with M implements I?;
//                             ^
// [analyzer] unspecified
// [cfe] unspecified
class C5 extends A with M? {}
//                      ^
// [analyzer] unspecified
// [cfe] unspecified
mixin M1 on A? {}
//          ^
// [analyzer] unspecified
// [cfe] unspecified
mixin M2 on A, M? {}
//             ^
// [analyzer] unspecified
// [cfe] unspecified
mixin M3 on A implements I? {}
//                       ^
// [analyzer] unspecified
// [cfe] unspecified

main() {
}
