// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion The constraint solution for a set of type variables
/// `{X0, ..., Xn}` with respect to a constraint set `C` and partial solution
/// `{T0, ..., Tn}`, is defined to be the set of type schemas `{U0, ..., Un}`
/// such that:
///   - If `Ti` is known (that is, does not contain `_`), then `Ui = Ti`. (Note
///     that the upcoming "variance" feature will relax this rule so that it
///     only applies to type variables without an explicitly declared variance.)
///   - Otherwise, let `Vi` be the constraint solution for the type variable
///     `Xi` with respect to the constraint set `C`.
///   - If `Vi` is not known (that is, it contains `_`), then `Ui = Vi`.
///   - Otherwise, if `Xi` does not have an explicit bound, then `Ui = Vi`.
///   - Otherwise, let `Mb <: Xi <: Mt` be the merge of `C` with respect to
///     `Xi`. If `Mb` is not `_`, let `C1` be the constraint set produced by the
///     subtype constraint generation algorithm for `P = Mb`, `Q = B`,
///     `L = {X0, ..., Xn}`. Then `Ui` is the constraint solution for the type
///     variable `Xi` with respect to the constraint set `C + C1`. *Note that
///     `X` is in `L` and that `Mb` doesn't contain any of `X0, ..., Xn`.*
///   - Otherwise, let `Bi` be the bound of `Xi`.  Then, let `Bi'` be the type
///     schema formed by substituting type schemas
///     `{U0, ..., Ui-1, Ti, ..., Tn}` in place of the type variables
///     `{X0, ..., Xn}` in `Bi`. (That is, we substitute `Uj` for `Xj` when
///     `j < i` and `Tj` for `Xj` when `j >= i`). Then `Ui` is the constraint
///     solution for the type variable `Xi` with respect to the constraint set
///     `C + (X <: Bi')`.
///
/// @description Checks bounds are taken into account during the inference.
/// @note The case "Otherwise, let `Mb <: Xi <: Mt` be the merge of `C`..." from
/// the above.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=inference-using-bounds

import '../../Utils/expect.dart';

class A<X extends A<X>> {}
class B extends A<B> {}
class C extends B {}

Type f<X extends A<X>>(X x) => X;

void main() {
  Expect.equals(B, f(B()));
  Expect.equals(B, f<B>(C()));
  Expect.equals(B, f(C()));
}
