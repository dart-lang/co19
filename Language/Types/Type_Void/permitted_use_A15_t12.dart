// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
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
///   value type `void`. Consider a `⟨spreadElement⟩` `S` of the form `...e` or
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
/// @description Check that it is not an error when the element, key, or value
/// type in a `⟨spreadElement⟩` of the form `...?e` is `void`.
/// @author sgrekhov22@gmail.com

List<void>? init() => [print("")];
Map<void, int>? initMap1() => <void, int>{print(""): 1};
Map<int, void>? initMap2() => <int, void>{1: print("")};

main() {
  List<void>? e1 = null;
  List<void>? e2 = init();
  <void>[...?e1];
  <void>[...?e2];
  <void>{...?e1};
  <void>{...?e2};

  Map<void, int>? e3 = null;
  Map<void, int>? e4 = initMap1();
  <void, int>{...?e3};
  <void, int>{...?e4};

  Map<int, void>? e5 = null;
  Map<int, void>? e6 = initMap2();
  <int, void>{...?e5};
  <int, void>{...?e6};
}
