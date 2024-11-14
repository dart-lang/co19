// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion In support of the notion that the value of an expression with
/// static type `void` should be discarded, such objects can only be used in
/// specific situations: The occurrence of an expression of type `void` is a
/// compile-time error unless it is permitted according to one of the following
/// rules.
/// ...
/// - An actual parameter expression corresponding to a formal parameter whose
///   statically known type annotation is `void` may have type `void`.
///
/// @description Checks that it is not an error to declare a record with a
/// parameter which has a type `void`.
/// @author sgrekhov22@gmail.com

typedef R1 = (void v,);
typedef R2 = ({void v});

main() {
  R1 r1 = (1,);
  R2 r2 = (v: 2);
  (void v,) r3 = (3,);
  ({void v}) r4 = (v: 4);
  print(r1);
  print(r2);
  print(r3);
  print(r4);
}
