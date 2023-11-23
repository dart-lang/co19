// Copyright (c) 2021, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion For the purposes of errors and warnings, the null aware operators
/// ?., ?.., and ?[] are checked as if the receiver of the operator had
/// non-nullable type. More specifically, if the type of the receiver of a null
/// aware operator is T, then the operator is checked as if the receiver had type
/// NonNull(T).
///
/// @description Check that if the type of the receiver of a null aware operator
/// is T, then the operator is checked as if the receiver had type NonNull(T).
/// Test Function?
/// @issue 38715
/// Language @issue https://github.com/dart-lang/language/issues/711
/// @author sgrekhov@unipro.ru

// Requirements=nnbd-weak
typedef void Foo();

void foo() {}

main() {
  var f1 = foo as Function?;
  f1?.toString();
  f1 ?.. toString();

  var f2 = foo as Foo?;
  f2?.toString();
  f2 ?.. toString();
}
