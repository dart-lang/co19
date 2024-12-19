// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion If an expression has the form `e1 == e2` or `e1 != e2`, or a
/// pattern has the form `== e2` or `!= e2`, where the static type of `e1`, or
/// the matched value type of the pattern, is S1, and e2 is precisely a
/// `<staticMemberShorthand>` expression, then assign the type S1 as the
/// shorthand context of the `<staticMemberShorthandHead>` of e2 before
/// inferring its static type the same way as above.
///
/// @description Checks that if a pattern has the form `== e2` or `!= e2` and
/// `e2` is a shorthand expression, then it has context type from the matched
/// value type of the pattern. Test an enum.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=enum-shorthands

import '../../Utils/expect.dart';

enum E<T> {
  e0<int>(0), e1<String>("one");
  final T value;
  const E(this.value);

  static const E intOne = E.e0;
}

main() {
  bool success = false;

  if (E.e0 case == .e0) {
    success = true;
  }
  Expect.isTrue(success);

  if (E.e1 case != .e0) {
    success = true;
  }

  if (E.e0 case == .intOne) {
    success = true;
  }
  Expect.isTrue(success);

  if (E.e1 case != .intOne) {
    success = true;
  }
  Expect.isTrue(success);
}
