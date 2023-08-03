// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion For the purpose of the static analysis, the extension type is
/// considered to have a final instance variable whose name is the
/// representation name and whose declared type is the representation type.
///
/// @description Checks that the extension type has a final instance variable
/// whose name is the representation name and whose declared type is the
/// representation type
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=inline-class

import "../../Utils/expect.dart";
import "../../Utils/static_type_helper.dart";

extension type ET1(int id) {}

extension type ET2<T>(T id) {}

main() {
  Expect.equals(42, ET1(42).id);
  ET1(42).id.expectStaticType<Exactly<int>>();

  Expect.equals("42", ET2<String>("42").id);
  ET2<String>("42").id.expectStaticType<Exactly<String>>();
}
