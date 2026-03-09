// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion In support of the notion that the value of an expression with
/// static type `void` should be discarded, such objects can only be used in
/// specific situations: The occurrence of an expression of type `void` is a
/// compile-time error unless it is permitted according to one of the following
/// rules. In the rules, every type under consideration is a static type.
/// ...
/// - The expression in an `⟨expressionElement⟩` may have type `void`. The
///   element type of the expression element is then `void`, too, which may or
///   may not be an error in the given context. The same is true for the other
///   kinds of elements which are covered below.
///   In a `⟨mapElement⟩` of the form `e1: e2`, `e1` may have type `void` and
///   `e2` may have type `void`. In a `⟨nullAwareMapElement⟩` of the form
///   `?e1: e2`, `e2` may have type `void`. In a `⟨nullAwareMapElement⟩` of the
///   form `e1: ?e2`, `e1` may have type `void`. In an `⟨ifElement⟩` `I` of the
///   form `if (c) e1` or `if (c) e1 else e2`, `e1` may have element type, key
///   type, or value type `void`, and so may `e2`. In a `⟨forElement⟩` `F` of
///   the form `for (forLoopParts) e`, `e` can have element type, key type, or
///   value type void. Consider a `⟨spreadElement⟩` `S` of the form `...e` or
///   `...?e`. Assume that `e` has a static type that implements `Iterable<T>`,
///   `Map<T, S>`, or `Map<S, T>` for some types `S` and `T`. In the case where
///   `T` is `void`, `S` will have `void` as its element, key, or value type.
///   This may or may not be an error in the given context. On the other hand,
///   it is an error if `e` has type `void`. So there is no need for a rule
///   about spread elements here.
///   Note there is no exception for a `⟨nullAwareExpressionElement⟩`, and for
///   some locations in a `⟨nullAwareMapElement⟩`. The reason is that these
///   element kinds will use the expression value, and hence it is an error if
///   the expression has type `void`.
///
/// @description Checks that it is a compile-time error if in a
/// `⟨nullAwareMapElement⟩` of the form `e1: ?e2`, `e2` has type `void`.
/// @author sgrekhov22@gmail.com
/// @issue 62858

typedef Void = void;

main() {
  void v1 = null;
  <int, void>{0: ?v1};
//                ^^
// [analyzer] unspecified
// [cfe] unspecified

  Void v2 = null;
  <int, Void>{0: ?v2};
//                ^^
// [analyzer] unspecified
// [cfe] unspecified
}
