// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
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
/// have type `Null`
/// @author sgrekhov22@gmail.com

String test1(bool? o) {
  switch (o) {
//^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    case Object? _?:
      return "not exhaustive";
  }
}

String test2(Object? o) => switch (o) {
//                         ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
      Object? _? => "not exhaustive"
    };

main() {
  test1(null);
  test2(null);
}
