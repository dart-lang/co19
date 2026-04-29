// Copyright (c) 2020, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It is a compile time error to assign a value to a `final`, `late`
/// local variable if it is definitely assigned. Thus, it is not a compile time
/// error to assign to a potentially unassigned `final`, `late` local variable.
///
/// @description Check that it is a compile time error to assign a value to a
/// local variable marked `late` and `final` when the variable is definitely
/// assigned.
/// @author sgrekhov@unipro.ru

main() {
  late final int x = 42;
  x >>>= 1;
//^
// [analyzer] unspecified
// [cfe] unspecified
}
