// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion A compile-time error occurs if an extension type has a
/// non-extension superinterface whose transitive alias expansion is a type
/// variable, a deferred type, any top type (including dynamic and void), the
/// type Null, any function type, the type Function, any record type, the type
/// Record, or any type of the form T? or FutureOr<T> for any type T.
///
/// @description Checks that it is not an error if an extension type has
/// `implements int` and similar platform types
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=inline-class

import "../../Utils/expect.dart";

typedef StringAlias = String;

extension type ET1(int id) implements int {}

extension type ET2<T extends String>(T id) implements StringAlias {}

main() {
  ET1 et1 = ET1(42);
  Expect.equals(42, et1.id);

  ET2<String> et2 = ET2<String>("42");
  Expect.equals("42", et2.id);
}
