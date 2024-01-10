// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion The lifted space union for a pattern with matched value type M is
/// ...
/// Null-check pattern:
/// i. Let S be the expanded spaces of the lifted space union of the subpattern.
/// ii. Remove any unions in S that have type Null. A null-check pattern
///   specifically does not match null, so even if the subpattern would handle
///   it, it will never see it.
/// iii. The result is S.
///
/// @description Check that a null-check pattern removes any unions in `S` that
/// have type `Null`. Test switch expression
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=inline-class

extension type const ObjectET1(Object _) {}
extension type const ObjectET2(Object _) implements Object {}

String test1(ObjectET1? o) => switch (o) {
//                            ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
      Object? _? => "not exhaustive"
    };

String test2(ObjectET2? o) => switch (o) {
//                            ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
      Object? _? => "not exhaustive"
    };

String test3(ObjectET1? o) => switch (o) {
//                            ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
      ObjectET1? _? => "not exhaustive"
    };

String test4(ObjectET1? o) => switch (o) {
//                            ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
      ObjectET2? _? => "not exhaustive"
    };

String test5(ObjectET2? o) => switch (o) {
//                            ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
      ObjectET1? _? => "not exhaustive"
    };

String test6(ObjectET2? o) => switch (o) {
//                            ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
      ObjectET2? _? => "not exhaustive"
    };

String test7(Object? o) => switch (o) {
//                         ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
      ObjectET1? _? => "not exhaustive"
    };

String test8(Object? o) => switch (o) {
//                         ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
      ObjectET2? _? => "not exhaustive"
    };

main() {
  test1(null);
  test2(null);
  test3(null);
  test4(null);
  test5(null);
  test6(null);
  test7(null);
  test8(null);
}
