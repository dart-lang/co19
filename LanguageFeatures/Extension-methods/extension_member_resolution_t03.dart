// Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion If there is no such member, the operation is currently a
/// compile-time error. In that case, all extensions in scope are checked for
/// whether they apply.
///
/// @description Check that if there is no such member, the operation is
/// currently a compile-time error
/// @author sgrekhov@unipro.ru



import "my_fancy_list_lib.dart";

extension<T> on List<T> {
  String method(int i, String s) {}
//       ^
// [analyzer] unspecified
// [cfe] unspecified
}

main() {
  List<String> list = ["Lily", "was", "here"];
  list.notExiestinMethod();
//     ^
// [analyzer] unspecified
// [cfe] unspecified
}
