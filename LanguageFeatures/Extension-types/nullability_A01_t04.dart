// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion An extension type `V` is a proper subtype of `Object?`. It is
/// potentially non-nullable, unless it implements `Object` or a subtype thereof
///
/// @description Checks that it is a compile-time error if an extension type
/// does implement a subtype of `Object` and its representation type is nullable
/// @author sgrekhov22@gmail.com

import "dart:async" show FutureOr;

extension type ET1(int? _) implements Object {}
//                                    ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

extension type ET2(Null _) implements Object {}
//                                    ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

extension type ET3(dynamic _) implements Object {}
//                                       ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

extension type ET4(void _) implements Object {}
//                                    ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

extension type ET5(FutureOr<Null> _) implements Object {}
//                                              ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

main() {
  print(ET1);
  print(ET2);
  print(ET3);
  print(ET4);
  print(ET5);
}
