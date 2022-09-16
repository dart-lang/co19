// Copyright (c) 2021, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It’s currently a compile-time error for a class to implement,
/// extend or mix-in the Enum class.
///
/// Because we want to allow interfaces and mixins that are intended to be
/// applied to enum declarations, and therefore to assume Enum to be a
/// superclass, we loosen that restriction to:
/// ...
/// It is a compile-time error if a class implements, extends or mixes-in the
/// class or interface introduced by an enum declaration. (An enum class can’t
/// be used as a mixin since it is not a mixin declaration and the class has a
/// superclass other than Object, but we include “mixes-in” for completeness.)
///
/// @description Check that it is a compile-time error if a class implements
/// a class declared by an enum declaration.
/// @author sgrekhov@unipro.ru

enum E {
  e1,
  e2
}

abstract class E1 implements E {
//                           ^
// [analyzer] unspecified
// [cfe] unspecified
}

class E2 implements E {
//                  ^
// [analyzer] unspecified
// [cfe] unspecified
}

main() {
  E1? e1;
  E2? e2;
}
