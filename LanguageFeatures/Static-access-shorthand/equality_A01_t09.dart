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
/// value type of the pattern. Test the case when `e2` has additional selector
/// `length`.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=enum-shorthands

import '../../Utils/expect.dart';

class C {
  static const hello = "hello";

  @override
  bool operator ==(Object other) {
    if (other is String) {
      return other == "hello" || other == "world";
    } else if (other is int) {
      return other == 5;
    }
    return false;
  }
}

mixin M on C {
  static const world = "world";
}
class MC = C with M;

enum E {
  e0;
  static const hello = "hello";
}

extension type ET(int id) {
  static const world = "world";
}

main() {
  bool success = false;
  void checkSuccess() {
    Expect.isTrue(success);
    success = false;
  }

  C c = C();
  if (c case == .hello.length) {
    success = true;
  }
  checkSuccess();

  M m = MC();
  if (m case == .world.length) {
    success = true;
  }
  checkSuccess();

  if (E.e0 case != .hello.length) {
    success = true;
  }
  checkSuccess();

  ET et = ET(0);
  if (et case != .world.length) {
    success = true;
  }
  checkSuccess();
}
