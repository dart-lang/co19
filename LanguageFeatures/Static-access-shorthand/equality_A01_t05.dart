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
/// value type of the pattern. Test a class.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=dot-shorthands

import '../../Utils/expect.dart';

class C<T> {
  final T value;
  const C(this.value);
  const C.id(this.value);
  const factory C.f(T t) = C;

  static const C<int> intOne = C(1);

  @override
  bool operator ==(Object other) {
    if (other is C) {
      return value == other.value;
    }
    return false;
  }
}

main() {
  bool success = false;
  void checkSuccess() {
    Expect.isTrue(success);
    success = false;
  }

  C<int> c1 = C(1);
  if (c1 case == const .new(1)) {
    success = true;
  }
  checkSuccess();

  if (c1 case == const .id(1)) {
    success = true;
  }
  checkSuccess();

  if (c1 case == const .f(1)) {
    success = true;
  }
  checkSuccess();

  if (c1 case == .intOne) {
    success = true;
  }
  checkSuccess();

  C<int> c2 = C(2);
  if (c2 case != const .new(1)) {
    success = true;
  }
  checkSuccess();

  if (c2 case != const .id(1)) {
    success = true;
  }
  checkSuccess();

  if (c2 case != const .f(1)) {
    success = true;
  }
  checkSuccess();

  if (c2 case != .intOne) {
    success = true;
  }
  checkSuccess();
}
