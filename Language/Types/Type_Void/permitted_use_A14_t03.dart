// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion In support of the notion that the value of an expression with
/// static type `void` should be discarded, such objects can only be used in
/// specific situations: The occurrence of an expression of type `void` is a
/// compile-time error unless it is permitted according to one of the following
/// rules. In the rules, every type under consideration is a static type.
/// ...
/// - In a list or set literal `C` whose actual type argument is `void`, an
///   element at the top level in `C` may have element type `void`. In a map
///   literal `M` whose first actual type argument is `void`, an element at the
///   top level in `M` may have key type `void`. In a map literal `M` whose
///   second actual type argument is `void`, an element at the top level in `M`
///   may have value type `void`.
///
/// @description Checks that in a map literal whose first actual type argument
/// is `void` an element at the top level may have element type `void`.
/// @author sgrekhov22@gmail.com

import '../../../Utils/expect.dart';

main() {
  void v = 42;
  var m = <void, int>{v: 0, print("x"): 1};
  Expect.equals(0, m[42]);
}
