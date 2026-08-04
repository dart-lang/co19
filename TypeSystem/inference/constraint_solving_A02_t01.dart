// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion The constraint solution for a type variable `X` with respect to a
/// constraint set `C` is the type schema defined as follows:
/// - let `Mb <: X <: Mt` be the merge of `C` with respect to `X`.
/// - If `Mb` is known (that is, it does not contain `_`) then the solution is
///   `Mb`
/// - Otherwise, if `Mt` is known (that is, it does not contain `_`) then the
///   solution is `Mt`
/// - Otherwise, if `Mb` is not `_` then the solution is `Mb`
/// - Otherwise the solution is `Mt`
///
/// Note that the constraint solution is a type schema, and hence may contain
/// occurrences of the unknown type.
///
/// @description Check that if `Mb` is known and `Mt` is known then the solution
/// is `Mb`.
/// @author sgrekhov22@gmail.com

import '../../Utils/static_type_helper.dart';

X f<X extends num>(X x) => x;

void main() {
  f(1).expectStaticType<Exactly<int>>(); // int <: X <: num
}
