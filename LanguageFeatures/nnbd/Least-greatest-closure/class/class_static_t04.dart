// Copyright (c) 2020, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion The definitions of least and greatest closure are changed in null
/// safe libraries to substitute [Never] in positions where previously [Null
/// would have been substituted, and [Object?] in positions where previously
/// [Object] or [dynamic] would have been substituted.
/// @description Check the [class C<X extends C<X>>] case: it is not true that
/// [Object?] <: [C<Object?>], and this means that the inferred type does not
/// satisfy the declared bound. A generic function invocation cannot be
/// super-bounded, so the choice must be rejected. So, compiler error should be
/// thrown for [f<X>(C<X> Function() g) => g()].
/// @note Read more about the least and greatest closure test template:
/// https://github.com/dart-lang/co19/issues/575#issuecomment-613542349
/// @author iarkh@unipro.ru
/// @Issue 44092, 44073

abstract class C<X extends C<X>> {}

void main() {
  void f<X>(C<X> Function() g) => g();
//            ^
// [analyzer] unspecified
// [cfe] unspecified
}
