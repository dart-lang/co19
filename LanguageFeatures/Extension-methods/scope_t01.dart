// Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion An extension is in scope if the name is shadowed by another
/// declaration
///
/// @description Check that an extension is in scope if the name is shadowed by
/// class declaration
/// @author sgrekhov@unipro.ru


import "../../Utils/expect.dart";
import "scope_all_lib.dart";

class Foo {}

main() {
  List<String> list = ["Lily", "was", "here"];
  Foo();
  Expect.equals("foo", list.foo());
}
