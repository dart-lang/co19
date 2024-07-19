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
/// @description Checks that it is a compile-time error if an augmenting
/// declaration appears before non-augmenting one. Test augmented declaration in
/// a main library.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=macros

augment library  'augmenting_declarations_A02_t01.dart';

class C {}
//    ^
// [analyzer] unspecified
// [cfe] unspecified

mixin M {}
//    ^
// [analyzer] unspecified
// [cfe] unspecified

enum E {e0;}
//   ^
// [analyzer] unspecified
// [cfe] unspecified

class A {}
extension Ext on A {}
//        ^^^
// [analyzer] unspecified
// [cfe] unspecified

extension type ET(int _) {}
//             ^^
// [analyzer] unspecified
// [cfe] unspecified

typedef StringAlias = String;
//      ^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

typedef void Foo();
//           ^^^
// [analyzer] unspecified
// [cfe] unspecified
