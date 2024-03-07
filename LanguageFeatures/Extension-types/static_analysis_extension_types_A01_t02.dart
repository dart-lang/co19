// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion For the purpose of the static analysis, the extension type is
/// considered to have a final instance variable whose name is the
/// representation name and whose declared type is the representation type.
///
/// @description Checks that an instance variable that an extension type has is
/// final
/// @author sgrekhov22@gmail.com

extension type ET1(int id) {}

extension type ET2<T>(T id) {}

main() {
  ET1(42).id = 0;
//        ^^
// [analyzer] unspecified
// [cfe] unspecified

  ET2<String>("42").id = "";
//                  ^^
// [analyzer] unspecified
// [cfe] unspecified
}
