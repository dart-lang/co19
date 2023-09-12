// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion The representation variable is not a subject to promotion
///
/// @description Check that a final local variable with the same name as the
/// representation variable can be promoted
/// @author sgrekhov22@gmail.com
/// @issue 53446

// SharedOptions=--enable-experiment=inline-class

extension type ET1(int? id) {
  void test() {
    final id = this.id;
    if (id != null) {
      id.isOdd;
    }
  }
}

extension type ET2<T>(T id) {
  void test() {
    final id = this.id;
    if (id is int) {
      id.isOdd;
    }
  }
}

main() {
  ET1 et1 = ET1(1);
  et1.test();

  ET2<num?> et2 = ET2(2);
  et2.test();
}
