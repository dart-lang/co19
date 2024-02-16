// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Let e be an expression; e occurs in a constant context iff one of
/// the following applies:
/// • e is an element of a list or set literal whose first token is const, or e
///   is a key or a value of an entry of a map literal whose first token is
///   const.
///
/// @description Checks that an expression `e` is a constant expression if `e`
/// is an element of a list whose first token is `const`. In this case `const`
/// modifier for `e` can be omitted
/// @author sgrekhov22@gmail.com

import '../../../../Utils/expect.dart';

class C {
  final val;
  const C(this.val);
}

main() {
  var c1 = const [C(1)];
  var c2 = const {C(2)};

  Expect.identical(const C(1), c1[0]);
  Expect.identical(const C(2), c2.lookup(const C(2)));
}
