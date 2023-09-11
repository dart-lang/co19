// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion All name conflicts specified in the language specification
/// section 'Class Member Conflicts' occur as well in an extension type
/// declaration.
///
/// @description Checks that it is not an error error if an extension type
/// declares an instance setter with the same basename as the representation
/// variable
/// @author sgrekhov22@gmail.com
/// @issue 53485

// SharedOptions=--enable-experiment=inline-class

extension type I(int id) {
  void set id(int i) {}
}

extension type ET1(int id) {
  void set id(int i) {}
}

extension type ET2(int id) implements I {}

main() {
  ET1 et1 = ET1(1);
  et1.id = 0;

  ET2 et2 = ET2(2);
  et2.id = 0;
}
