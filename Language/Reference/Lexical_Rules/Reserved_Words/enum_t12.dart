// Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion "enum" is a reserved word.
/// A reserved word may not be used as an identifier; it is a compile-time error
/// if a reserved word is used where an identifier is expected.
/// @description Checks that it is a compile-time error when a reserved word
/// "enum" is used as an identifier in a part declaration.
/// @author ngl@unipro.ru
/// @issue 44990

part "enum_lib.dart";
//   ^
// [analyzer] unspecified
// [cfe] unspecified

void main() {
}
