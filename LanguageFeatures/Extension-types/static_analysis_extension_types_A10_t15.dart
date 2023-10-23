// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion A compile-time error occurs if an extension type has a
/// non-extension superinterface whose transitive alias expansion is a type
/// variable, a deferred type, any top type (including dynamic and void), the
/// type Null, any function type, the type Function, any record type, the type
/// Record, or any type of the form T? or FutureOr<T> for any type T.
///
/// @description Checks that it is not an error if the representation type of an
/// extension type is the type `void` (but it is an error to use this type)
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=inline-class

typedef VoidAlias = void;

extension type ET1(void id) {}

extension type ET2(VoidAlias id) {}

main() {
  print(ET1("42").id);
//                ^^
// [analyzer] unspecified
// [cfe] unspecified

  print(ET2("42").id);
//                ^^
// [analyzer] unspecified
// [cfe] unspecified
}
