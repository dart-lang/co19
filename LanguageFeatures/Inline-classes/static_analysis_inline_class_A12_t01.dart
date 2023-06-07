// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Let DV be an inline class declaration named V with representation
/// type R. Assuming that all types have been fully alias expanded, we say that
/// DV has a representation dependency on an inline class declaration DV2 if R
/// contains an identifier id (possibly qualified) that resolves to DV2, or id
/// resolves to an inline class declaration DV3 and DV3 has a representation
/// dependency on DV2.
///
/// It is a compile-time error if an inline class declaration has a
/// representation dependency on itself.
///
/// @description Checks that it is a compile-time error if an inline class has a
/// representation dependency on itself.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=inline-class

inline class V1 {
//           ^^
// [analyzer] unspecified
// [cfe] unspecified
  final V2 v2;
  V1(this.v2);
}

inline class V2 implements V1 {
//           ^^
// [analyzer] unspecified
// [cfe] unspecified
  final int id;
  V2(this.id);

  V2 get v2 => V2(42);
}

main() {
  print(V1);
  print(V2);
}
