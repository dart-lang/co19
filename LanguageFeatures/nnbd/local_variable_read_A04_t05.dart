// Copyright (c) 2020, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It is a compile time error to read a local variable when the
/// variable is definitely unassigned unless the variable is non-final, and
/// non-late, and has nullable type.
///
/// @description Checks that it's a compile time error to read a local late final
/// variable when the variable is definitely unassigned
///
/// @author sgrekhov@unipro.ru


main() {
  late final int x1;
  x1;
//^^
// [analyzer] unspecified
// [cfe] unspecified

  late final int? x2;
  x2;
//^^
// [analyzer] unspecified
// [cfe] unspecified

  late final x3;
  x3;
//^^
// [analyzer] unspecified
// [cfe] unspecified
}
