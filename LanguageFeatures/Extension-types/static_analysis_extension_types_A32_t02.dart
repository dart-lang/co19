// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion An extension type V (which may include actual type arguments) can
/// be used in an object pattern (e.g., case V(): ... where V is an extension
/// type). Exhaustiveness analysis will treat such patterns as if they had been
/// an object pattern matching the extension type erasure of V.
///
/// @description Check that an extension type can be used in an object pattern.
/// Test generics
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=inline-class

import "../../Utils/expect.dart";

class C<T> {
  T x;
  C(this.x);
}

extension type ET1<T>(C<T> id) {}
extension type ET2<T>(C<T> id) implements C<T> {}

main() {
  var ET1<num>() = ET1(C(3.14));
  var ET2<int>(x: v1) = ET2<int>(C(1));
  Expect.equals(1, v1);

  var C<String>(x: v2) = ET2<String>(C<String>("2"));
  Expect.equals("2", v2);

  var ET1<String>(id: v3) = ET1(C<String>("3"));
  Expect.equals("3", v3.x);

  var ET2<int>(id: v4) = ET2<int>(C(4));
  Expect.equals(4, v4.x);
}
