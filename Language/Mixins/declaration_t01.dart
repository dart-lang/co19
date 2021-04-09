/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion It is a compile-time error for the mixin declaration if the MS
 * class declaration would cause a compile-time error
 * @description Checks that it is a compile-time error for the mixin declaration
 * if the MS class declaration would cause a compile-time error
 * @author sgrekhov@unipro.ru
 * @issue 45505
 */
// SharedOptions=--enable-experiment=nonfunction-type-aliases
class C {}
typedef CAlias = C;

mixin CM on C, CAlias {}
//             ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

main() {
}
