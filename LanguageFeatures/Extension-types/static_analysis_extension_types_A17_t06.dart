// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion An extension type `V` is a proper subtype of `Object?`. It is
/// potentially non-nullable, unless it implements `Object` or a subtype thereof
///
/// @description Checks that it is not an error to call a member of an extension
/// type with a nullable representation type
/// @author sgrekhov22@gmail.com
/// @issue 53822

// SharedOptions=--enable-experiment=inline-class

extension type ET1(int? _) {
  foo() {}
}

extension type ET2<T>(T _) {
  foo() {}
}

main() {
  ET1(42).foo();
  ET2<int?>(42).foo();
  ET2<Null>(null).foo();
}
