// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion In support of the notion that the value of an expression with
/// static type `void` should be discarded, such objects can only be used in
/// specific situations: The occurrence of an expression of type `void` is a
/// compile-time error unless it is permitted according to one of the following
/// rules.
/// - In an `⟨expressionStatement⟩` `e;`, `e` may have type void.
///
/// @description Checks that it is not an error if in an `⟨expressionStatement⟩`
/// of the form `e;`, the static type of `e` is `void`.
/// @author sgrekhov22@gmail.com

void foo() {}

main() {
  var e = foo();
}
