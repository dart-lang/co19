// Copyright (c) 2020, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Evaluation of a throw expression of the form throw e; proceeds as
/// follows:
/// The expression e is evaluated yielding a value v.
/// If v evaluates to null, then a TypeError is thrown. Otherwise, control
/// is transferred to the nearest dynamically enclosing exception handler, with
/// the current exception set to v and the current return value becomes
/// undefined.
///
/// NNBD Spec: It is an error if the static type of [e] in the expression [throw
/// e] is not assignable to [Object].
///
/// @description Checks that attempting to throw null in any manner results in
/// a compile-time error.
/// @author iarkh

main() {
  throw null;
//      ^^^^
// [analyzer] unspecified
// [cfe] unspecified

  throw (true ? null : null);
//              ^^^^
// [analyzer] unspecified
// [cfe] unspecified
}
