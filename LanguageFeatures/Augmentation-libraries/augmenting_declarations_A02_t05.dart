// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion An augmentation declaration D is a declaration marked with the
/// new built-in identifier `augment`, which makes D augment a declaration D1
/// with the same name and in the same context as D. D1 is determined as being
/// before D and after every other declaration with the same name and in the
/// same context which is before D (that is, D1 is the greatest declaration
/// which is smaller than D, according to the 'after' ordering). A compile-time
/// error occurs if no declaration satisfies the requirements on D1.
///
/// @description Checks that it is a compile-time error if a base declaration is
/// not above the augmentation declaration.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=macros

augment class C {}
//            ^
// [analyzer] unspecified
// [cfe] unspecified

augment mixin M {}
//            ^
// [analyzer] unspecified
// [cfe] unspecified

augment enum E {e0;}
//           ^
// [analyzer] unspecified
// [cfe] unspecified

augment extension Ext {}
//                ^^^
// [analyzer] unspecified
// [cfe] unspecified

augment extension type ET(int _) {}
//                     ^^
// [analyzer] unspecified
// [cfe] unspecified

augment typedef StringAlias = String;
//              ^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

augment typedef void Foo();
//                   ^^^
// [analyzer] unspecified
// [cfe] unspecified

class C {}

mixin M {}

enum E {e0;}

class A {}
extension Ext on A {}

extension type ET(int _) {}

typedef StringAlias = String;

typedef void Foo();

main() {
  print(C);
  print(M);
  print(E);
  print(A);
  print(ET);
  print(StringAlias);
  print(Foo);
}
