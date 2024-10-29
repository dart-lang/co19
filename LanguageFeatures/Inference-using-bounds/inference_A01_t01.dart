// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion In section Constraint solution for a set of type variables we
/// have the following step:
///
/// Otherwise, let `Bi` be the bound of `Xi`. Then, let `Bi'` be the type schema
/// formed by substituting type schemas `{U0, ..., Ui-1, Ti, ..., Tn}` in place
/// of the type variables `{X0, ..., Xn}` in `Bi`. (That is, we substitute `Uj`
/// for `Xj` when `j < i` and `Tj` for `Xj` when `j >= i`).
/// Then `Ui` is the constraint solution for the type variable `Xi` with respect
/// to the constraint set `C + (X <: Bi')`.
///
/// We could enhance this step such that it works differently when `Bi` is an
/// F-bound, that is, it is a parameterized type where `Xi` occurs. Assume that
/// the bound is `Xi extends A<S1 ... Sk>`.
///
/// In that case we would not find the constraint solution as described. We
/// would instead consider `C` alone, take the least closure of its lower bound,
/// `L`, and search the superinterface graph of `L` to find a parameterized type
/// of the form `A<V1 .. Vk>`.
///
/// For each occurrence of `Xi` in `S1 ... Sk`, find the subterm `W` of
/// `V1 ... Vk` that corresponds to said occurrence in `S1 ... Sk`. Then resolve
/// the constraint `A<S1 .. Sk> <# A<V1 .. Vk>` with respect to `{X0 .. Xn}`,
/// yielding the candidate value of `Xi`; call it `W`.
///
/// Check that `L <: W`, that `W <: A<V1 .. Vk>`, and that `W <: U` where `U` is
/// the greatest closure of the upper bound in `C`. This procedure has failed if
/// that is not the case.
///
/// Otherwise, `Ui` is `W`. That is, we choose `W` as the selected value of
/// `Xi`.
///
/// If any of the steps up to this point fails then we fall back and use the
/// approach which is used today.
///
/// The point is that the binding of `Xi` must be a supertype of `L`, and it
/// must be a subtype of `A<V1 ... Vk>`, and I suspect that `W` is the only
/// candidate to satisfy that constraint. (Note that `L` does not have multiple
/// distinct superinterfaces of the form `A<...>` because that's a compile-time
/// error.)
///
/// @description Checks bounds are taken into account during the inference.
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
