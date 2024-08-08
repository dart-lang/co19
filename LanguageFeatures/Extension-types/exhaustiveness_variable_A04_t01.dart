// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Exhaustiveness of a variable pattern is determined by the static
/// type of the corresponding variable.
///
/// @description Check static type of a variable pattern
/// @author sgrekhov22@gmail.com

import '../../Utils/static_type_helper.dart';

extension type ET(int i) {}
extension type TO(int i) implements ET {}

main() {
  ET x = ET(1);
  switch (x) {
    case int y:
      x.expectStaticType<Exactly<ET>>;
      y.expectStaticType<Exactly<int>>;
    case TO z:
//  ^^^^
// [analyzer] WARNING.UNREACHABLE_SWITCH_CASE
      x.expectStaticType<Exactly<TO>>;
      z.expectStaticType<Exactly<TO>>;
  }
  switch (42) {
    case ET y:
      x.expectStaticType<Exactly<ET>>;
      y.expectStaticType<Exactly<ET>>;
    case TO z:
//  ^^^^
// [analyzer] WARNING.UNREACHABLE_SWITCH_CASE
      x.expectStaticType<Exactly<ET>>;
      z.expectStaticType<Exactly<TO>>;
  }
}
