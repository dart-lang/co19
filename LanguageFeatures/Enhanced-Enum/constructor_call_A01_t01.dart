// Copyright (c) 2021, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It is a compile-time error to refer to a declared or default
/// generative constructor of an enum declaration in any way, other than:
/// - As the target of a redirecting generative constructor of the same enum
///   declaration (: this(...);/: this.targetName(...);), or
/// - Implicitly in the enum value declarations of the same enum
///   (enumValueName(args)/enumValueName.targetName(args)).
///
/// @description Check that it’s a compile time error to call any of enums
/// generative constructors outside of its declaration
/// @author sgrekhov@unipro.ru

enum E {
  e1,
  e2;

  const E();
}

main() {
  E e = const E();
//            ^
// [analyzer] unspecified
// [cfe] unspecified
}
