// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Assume that DV is an inline class declaration named Inline, and
/// V1 occurs as one of the <type>s in the <interfaces> of DV. In this case we
/// say that V1 is a superinterface of DV.
/// ...
/// A compile-time error occurs if any direct or indirect superinterface of DV
/// is the type Inline or a type of the form Inline<...>
///
/// @description Checks that it is a compile-time error if an inline class has a
/// dependency on itself.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=inline-class

inline class V1 implements V2 {
//           ^^
// [analyzer] unspecified
// [cfe] unspecified
  final int id;
  V1(this.id);
}

inline class V2 implements V3 {
//           ^^
// [analyzer] unspecified
// [cfe] unspecified
  final int id;
  V2(this.id);
}

typedef V1Alias = V1;

inline class V3 implements V1Alias {
//           ^^
// [analyzer] unspecified
// [cfe] unspecified
  final int id;
  V3(this.id);
}

main() {
  print(V1);
  print(V2);
  print(V3);
}
