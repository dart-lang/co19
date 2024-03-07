// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion A compile-time error occurs if an extension type has a
/// non-extension superinterface whose transitive alias expansion is a type
/// variable, a deferred type, any top type (including dynamic and void), the
/// type Null, any function type, the type Function, any record type, the type
/// Record, or any type of the form T? or FutureOr<T> for any type T.
///
/// @description Checks that it is a compile-time error if an extension type has
/// a non-extension superinterface whose transitive alias expansion is a type
/// `Never`
/// @author sgrekhov22@gmail.com

typedef NeverAlias = Never;

extension type NeverET1(Object? _) implements Never {}
//                                            ^^^^^
// [analyzer] unspecified
// [cfe] unspecified
extension type NeverET2(Object? _) implements NeverAlias {}
//                                            ^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

main() {
  print(NeverET1);
  print(NeverET2);
}
