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
/// value type of the pattern. Test an extension type.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=enum-shorthands

import '../../Utils/expect.dart';

extension type const ET<T>(T value) {
  const ET.id(this.value);
  const factory ET.f(T t) = ET;

  static const ET<int> intOne = ET(1);
}

main() {
  bool success = false;
  void checkSuccess() {
    Expect.isTrue(success);
    success = false;
  }

  ET<int> et1 = ET(1);
  if (et1 case == const .new(1)) {
    success = true;
  }
  checkSuccess();

  if (et1 case == const .id(1)) {
    success = true;
  }
  checkSuccess();

  if (et1 case == const .f(1)) {
    success = true;
  }
  checkSuccess();

  if (et1 case == .intOne) {
    success = true;
  }
  checkSuccess();

  ET<int> et2 = ET(2);
  if (et2 case != const .new(1)) {
    success = true;
  }
  checkSuccess();

  if (et2 case != const .id(1)) {
    success = true;
  }
  checkSuccess();

  if (et2 case != const .f(1)) {
    success = true;
  }
  checkSuccess();

  if (et2 case != .intOne) {
    success = true;
  }
  checkSuccess();
}
