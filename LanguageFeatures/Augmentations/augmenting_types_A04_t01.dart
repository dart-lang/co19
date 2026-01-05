// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Also note that an augmentation of an extension can't specify an
/// `on` clause. It always uses the same `on` clause as the introductory
/// declaration.
///
/// @description Checks that it is a compile-time error if an augmenting
/// extension declares an `on` clause.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=augmentations

class C {}

extension Ext on C {
  String foo() => "Extension Ext on C";
}

extension on C {
  String bar() => "Extension on C";
}

augment extension on C {
//                ^^
// [analyzer] unspecified
// [cfe] unspecified
}

augment extension Ext on C {
//                    ^^
// [analyzer] unspecified
// [cfe] unspecified
}

main() {
  print(C);
}
