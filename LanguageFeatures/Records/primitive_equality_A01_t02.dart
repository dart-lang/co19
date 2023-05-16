// Copyright (c) 2022, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion A record object has a primitive == operator if all of its field
/// have primitive == operators.
///
/// Note that this is a dynamic property of a record object, not a property of
/// its static type. Since primitive equality only comes into play in constants,
/// the compiler can see the actual field values for a relevant record at
/// compile time because it has the actual constant record value with all of its
/// constant fields. This means a record can be used in a constant set or as a
/// constant map key, but only when its field values could be as well.
///
/// @description Checks that if all of the record fields have a primitive ==
/// operator then it is a compile-time error if two equal records are used in a
/// constant set literal
/// @author sgrekhov22@gmail.com

class C {
  const C();
}

main() {
  const s1 = {
//           ^
// [cfe] unspecified
    const (1, "2", String, C(), Object(), Symbol('foo')),
    (1, "2", String, const C(), const Object(), const Symbol('foo'))
//  ^
// [analyzer] unspecified

  };
  const s2 = {
//           ^
// [cfe] unspecified
 const (one: 1, two: "2", three: String, four: C(), five: Object(),
      six: Symbol('foo')),
    (one: 1, two: "2", three: String, four: const C(), five: const Object(), six: const Symbol('foo'))
//  ^
// [analyzer] unspecified

  };
  const s3 = {
//           ^
// [cfe] unspecified
    const (1, two: "2", String, four: C(), five: Object(), Symbol('foo')),
    (1, two: "2", String, four: const C(), five: const Object(), const Symbol('foo'))
//  ^
// [analyzer] unspecified
  };
}
