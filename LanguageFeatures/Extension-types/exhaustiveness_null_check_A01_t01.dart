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
/// have type `Null`. Test switch statement
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=inline-class

extension type const BoolET1(bool _) {}
extension type const BoolET2(bool _) implements bool {}
extension type const ObjectET1(Object _) {}
extension type const ObjectET2(Object _) implements Object {}

String test1(BoolET1? o) {
  switch (o) {
//^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    case Object? _?:
      return "not exhaustive";
  }
}

String test2(BoolET2? o) {
  switch (o) {
//^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    case Object? _?:
      return "not exhaustive";
  }
}

String test3(BoolET1? o) {
  switch (o) {
//^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    case ObjectET1? _?:
      return "not exhaustive";
  }
}

String test4(BoolET1? o) {
  switch (o) {
//^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    case ObjectET2? _?:
      return "not exhaustive";
  }
}

String test5(BoolET2? o) {
  switch (o) {
//^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    case ObjectET1? _?:
      return "not exhaustive";
  }
}

String test6(BoolET2? o) {
  switch (o) {
//^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    case ObjectET2? _?:
      return "not exhaustive";
  }
}

String test7(bool? o) {
  switch (o) {
//^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    case ObjectET1? _?:
      return "not exhaustive";
  }
}

String test8(bool? o) {
  switch (o) {
//^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    case ObjectET2? _?:
      return "not exhaustive";
  }
}

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
