// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion An extension type `V` is a proper subtype of `Object?`. It is
/// potentially non-nullable, unless it implements `Object` or a subtype thereof
///
/// @description Checks that an extension type is not-nullable even if its
/// representation type is nullable
/// @author sgrekhov22@gmail.com

import "dart:async" show FutureOr;

extension type ET1(int? _) {}

extension type ET2(Null _) {}

extension type ET3(dynamic _) {}

extension type ET4(void _) {}

extension type ET5(FutureOr<Null> _) {}

main() {
  ET1 et11 = null;
//           ^^^^
// [analyzer] unspecified
// [cfe] unspecified
  ET1? et12 = null;

  ET2 et21 = null;
//           ^^^^
// [analyzer] unspecified
// [cfe] unspecified
  ET2? et22 = null;

  ET3 et31 = null;
//           ^^^^
// [analyzer] unspecified
// [cfe] unspecified
  ET3? et32 = null;

  ET4 et41 = null;
//           ^^^^
// [analyzer] unspecified
// [cfe] unspecified
  ET4? et42 = null;

  ET5 et51 = null;
//           ^^^^
// [analyzer] unspecified
// [cfe] unspecified
  ET5? et52 = null;
}
