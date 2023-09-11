// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion All name conflicts specified in the language specification
/// section 'Class Member Conflicts' occur as well in an extension type
/// declaration.
///
/// @description Checks that it is a compile-time error error if an extension
/// type declares an instance setter with the same basename as the
/// representation variable but with a not compatible type
/// @author sgrekhov22@gmail.com
/// @issue 53489

// SharedOptions=--enable-experiment=inline-class

extension type ET(int id) {
  void set id(String i) {}
//         ^^
// [analyzer] unspecified
// [cfe] unspecified
}

main() {
  print(ET);
}
