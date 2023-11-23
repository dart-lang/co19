// Copyright (c) 2021, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion The modifier late is added as a built-in identifier. The grammar
/// of top level variables, static fields, instance fields, and local variables
/// is extended to allow any declaration to include the modifier late.
///
/// @description Checks that the 'late' word cannot be used as a type name
/// @author sgrekhov@unipro.ru

typedef late = int Function(Object a, Object b);
//      ^^^^
// [analyzer] unspecified
// [cfe] unspecified

main() {
  late? l;
//^^^^
// [analyzer] unspecified
// [cfe] unspecified
}
