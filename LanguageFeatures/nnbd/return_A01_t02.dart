// Copyright (c) 2021, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It is a compile-time error if $s$ is \code{\RETURN{} $e$;},
///  $T$ is neither \VOID{} nor \DYNAMIC, and $S$ is \VOID.
///
/// Comparing to Dart before null-safety, this means that it is no longer allowed
/// to return a void expression in a regular function if the return type is Null
///
/// @description Check that it is no compile-time error to return non void and
/// non dynamic value from void function in a short notation
/// @author sgrekhov@unipro.ru

void foo() => 42;

main() {
  foo();
}
