// Copyright (c) 2021, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It is a compile-time error if $s$ is \code{\RETURN{} $e$;},
///  $T$ is neither \VOID{} nor \DYNAMIC, and $S$ is \VOID.
///
/// Comparing to Dart before null-safety, this means that it is no longer allowed
/// to return a void expression in a regular function if the return type is Null
///
/// @description Check that it is a compile-time error to return a void
/// expression in a regular function if the return type is Null
/// @author sgrekhov@unipro.ru

void g() {}

Null foo() {
  return g();
//       ^^^
// [analyzer] unspecified
// [cfe] unspecified
}

Null bar() => g();
//            ^^^
// [analyzer] unspecified
// [cfe] unspecified

main() {
  foo();
  bar();
}
