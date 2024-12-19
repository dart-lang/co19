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
/// value type of the pattern. Test a mixin.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=enum-shorthands

import '../../Utils/expect.dart';

class C<T> {
  final T value;
  const C(this.value);

  @override
  bool operator ==(Object other) {
    if (other is C) {
      return value == other.value;
    }
    return false;
  }
}

mixin M<T> on C<T> {
  static const M<int> intOne = MC<int>(1);
}

class MC<T> extends C<T> with M<T> {
  const MC(T t) : super(t);
}

main() {
  bool success = false;
  M<int> m = MC(1);
  if (m case == .intOne) {
    success = true;
  }
  Expect.isTrue(success);

  success = false;
  if (m case != .intOne) {
    success = true;
  }
  Expect.isFalse(success);
}
