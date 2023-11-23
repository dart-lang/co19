// Copyright (c) 2020, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion The definitions of least and greatest closure are changed in null
/// safe libraries to substitute [Never] in positions where previously [Null
/// would have been substituted, and [Object?] in positions where previously
/// [Object] or [dynamic] would have been substituted.
/// @description Check the [class C<X extends C<X>>] case.
/// The analyzer explicitly states that [Object?] is the inferred (but
/// non-working) value of [X].
///
/// This matches the specified approach for inference of the return type of a
/// function literal (here () => captureTypeArgument()): The type R is the
/// greatest closure of C<_> which is C<Object?>, so the function literal gets
/// the inferred return type C<Object?>, and inference concludes that X gets the
/// value Object?.
///
/// Also, X == Never would satisfy X <: C<X>, but other possible values of X
/// would be classes implementing C (such as class D extends C<D> {}), and it is
/// not plausible that inference could (or should) choose any such solution. In
/// other words, it is justified for the static analysis to fail to find a
/// suitable value for X.
///
/// But it is not true that Object? <: C<Object?>, and this means that the
/// inferred type does not satisfy the declared bound. A generic function
/// invocation cannot be super-bounded, so the choice must be rejected.
/// Created #44092 to report the basic issue here (which is expressible without
/// any F-bounds).
///
/// @note Read more about the least and greatest closure test template:
/// https://github.com/dart-lang/co19/issues/575#issuecomment-613542349
///
/// @Issue 44073, 44092
/// @author iarkh@unipro.ru


import "../../../../Utils/expect.dart";

abstract class C<X extends C<X>> {}

void main() {
  void f<X extends C<X>>(C<X> Function() g) => g();

  // Verify that the captured type has an `x`.
  f(() => captureTypeArgument());
//^
// [analyzer] unspecified
// [cfe] unspecified
}
