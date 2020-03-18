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
 * or mixin a type of the form T? for any T. Test type aliases
 * @author sgrekhov@unipro.ru
 * @issue 40949
 */
// SharedOptions=--enable-experiment=non-nullable,nonfunction-type-aliases
// Requirements=nnbd-strong
class A {}
class B {}
class C {}

typedef AAlias = A?;
typedef BAlias = B?;
typedef CAlias = C?;

class C1 extends AAlias {}
//               ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
class C2 implements AAlias {}
//                  ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
class C3 = A with BAlias;
//                ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
class C4 = A with B implements CAlias;
//                             ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
class C5 extends A with BAlias {}
//                      ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
mixin M1 on AAlias {}
//          ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
mixin M2 on A, BAlias {}
//             ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
mixin M3 on A implements BAlias {}
//                       ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

main() {
}
