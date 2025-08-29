// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion `toi_promote(declared, promotionChain, tested, written)`, where
/// declared and written are types satisfying `written <: declared`,
/// `promotionChain` is valid for declared type declared, and all types `T` in
/// `promotionChain` satisfy `written <: T`, is the promotion chain
/// `newPromotionChain`, defined as follows. ("toi" stands for "type of
/// interest".)
/// - Let `provisionalType` be the last type in `promotionChain`, or `declared`
///   if `promotionChain` is empty. (This is the type of the variable after
///   demotions, but before type of interest promotion.)
///   - Since the last type in a promotion chain is a subtype of all the others,
///     it follows that all types `T` in `promotionChain` satisfy
///     `provisionalType <: T`.
/// - If `written` and `provisionalType` are the same type, then
///   `newPromotionChain` is `promotionChain`. (No type of interest promotion is
///   necessary in this case.)
/// - Otherwise (when `written` is not `provisionalType`), let `p1` be a set
///   containing the following types:
///   - NonNull(`declared`), if it is not the same as `declared`.
///     - For each type `T` in the `tested` list:
///       - `T`
///       - NonNull(`T`)
///   The types in `p1` are known as the types of interest.
/// - Let `p2` be the set `p1 \ { provisionalType }` (where `\` denotes set
///   difference).
/// - If the `written` type is in `p2`, and `written <: provisionalType`, then
///   `newPromotionChain` is `[...promotionChain, written]`. Writing a value
///    whose static type is a type of interest promotes to that type.
///    - By precondition, `written <: declared` and `written <: T` for all types
///      in `promotionChain`. Therefore, `newPromotionChain` satisfies the
///      definition of a promotion chain, and is valid for declared type
///     `declared`.
///   - Otherwise (when `written` is not in `p2`:
///     - Let `p3` be the set of all types `T` in `p2` such that
///       `written <: T <: provisionalType`.
///     - If `p3` contains exactly one type `T` that is a subtype of all the
///       others, then `promoted` is `[...promotionChain, T]`. Writing a value
///       whose static type is a subtype of a type of interest promotes to that
///       type of interest, provided there is a single "best" type of interest
///       available to promote to.
///       - Since `T <: provisionalType <: declared`, and all types `U` in
///         `promotionChain` satisfy `provisionalType <: U`, it follows that all
///         types `U` in `promotionChain` satisfy `T <: U`. Therefore
///         `newPromotionChain` satisfies the definition of a promotion chain,
///         and is valid for declared type `declared`.
///     - Otherwise, `newPromotionChain` is `promotionChain`. If there is no
///       single "best" type of interest to promote to, then no type of interest
///       promotion is done.
///
/// `assign(x, E, M)` where `x` is a local variable, `E` is an
/// expression of inferred type `T` (which must be a subtype of `x`'s declared
/// type), and `M = FlowModel(r, VI)` is the flow model for `E` is defined to be
/// `FlowModel(r, VI[x -> VM])` where:
/// - `VI(x) = VariableModel(declared, promoted, tested, assigned, unassigned, captured)`
/// - If `captured` is true then:
///   - `VM = VariableModel(declared, promotionChain, tested, true, false, captured)`.
/// - Otherwise:
///   - Let `written = T`.
///   - Let `promotionChain' = demote(promotionChain, written)`.
///   - Let `promotionChain'' = toi_promote(declared, promotionChain', tested, written)`.
///     - The preconditions for toi_promote are satisfied because:
///       - `demote` deletes any elements from `promotionChain` that do not
///         satisfy `written <: T`, therefore every element of `promotionChain'`
///         satisfies `written <: T`.
///       - `written = T` and `T` is a subtype of `x`'s declared type, therefore
///         `written <: declared`.
///   - Then `VM = VariableModel(declared, promotionChain'', tested, true, false, captured)`.
/// ...
/// Local-variable assignment: If `N` is an expression of the form `x = E1`
/// where `x` is a local variable, then:
/// - Let `before(E1) = before(N)`.
/// - Let `E1'` be the result of applying type coercion to `E1`, to coerce it to
///   the declared type of `x`.
/// - Let `after(N) = assign(x, E1', after(E1))`.
///   - Since type coercion to type `T` produces an expression whose static type
///     is a subtype of `T`, the precondition of assign is satisfied, namely
///     that the static type of `E1'` must be a subtype of `x`'s declared type.
///
/// @description Checks static type of a variable after assignment with a
/// supertype of the declared type as type of interest. Test the "diamond"
/// inheritance.
/// @author sgrekhov22@gmail.com
/// @issue 60622

import '../../Utils/static_type_helper.dart';

class A {}
class B extends A {}
class C extends A {}
class D implements B, C {}

void test(Object a, D d){
  a as A;
  if (a is B || a is C) {}
  a = d; // Not promoted: Neither `B` nor `C` is minimal in `{A, B, C}`.
  a.expectStaticType<Exactly<A>>();
}

main() {
  test(A(), D());
}
