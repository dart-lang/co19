// Copyright (c) 2021, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion EnumName extension Null safety
/// Access to the name of an enum value.
///
/// This method is declared as an extension method instead of an instance method
/// in order to allow enum values to have the name name.
///
/// The name of the enum value.
///
/// The name is a string containing the source identifier used to declare the
/// enum value.
///
/// For example, given a declaration like:
///
/// enum MyEnum {
///   value1,
///   value2
/// }
/// the result of MyEnum.value1.name is the string "value1".
/// @description Check grammar of the enum declaration. Test covariant members
/// @author sgrekhov@unipro.ru

// SharedOptions=--enable-experiment=enhanced-enums

import "../../Utils/expect.dart";

enum E<T extends num> {
  e1,
  e2(),
  e3<int>.named(42);

  const E.named(int x);
}

main() {
  Expect.equals("e1", E.e1.name);
  Expect.equals("e2", E.e2.name);
  Expect.equals("e3", E.e3.name);
}
