// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion A class, enum, extension type, or mixin augmentation may specify
/// extends, implements, on, and with clauses (when generally supported). The
/// types in these clauses are appended to the original declarations clauses of
/// the same kind, and if that clause did not exist previously then it is added
/// with the new types. All regular rules apply after this appending process, so
/// you cannot have multiple extends on a class, or an on clause on an enum, etc
///
/// @description Checks that a mixin augment may specify an `on` clause and it
/// is a compile-time error to create a mixin application that doesn't take into
/// account this augment
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=macros

import augment 'augmenting_types_A08_t03_lib.dart';

class A {}
class C {}
mixin M on A {}

class BadMA1 = A with M;
//             ^
// [analyzer] unspecified
// [cfe] unspecified

class BadMA2 = C with M;
//             ^
// [analyzer] unspecified
// [cfe] unspecified

main() {
  print(BadMA1);
  print(BadMA2);
}
