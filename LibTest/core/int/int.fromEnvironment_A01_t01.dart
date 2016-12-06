/*
 * Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion const int.fromEnvironment(String name, {int defaultValue})
 * Returns the integer value of the given environment declaration name.
 * The result is the same as would be returned by:
 * int.parse(const String.fromEnvironment(name, defaultValue: ""),
 * (_) => defaultValue)
 * @description Checks that this constructor returns null if there is no
 * environment variable with appropriate name
 * @author sgrekhov@unipro.ru
 */
import "../../../Utils/expect.dart";

main() {
  const someFlag = const int.fromEnvironment("someFlag");
  Expect.isNull(someFlag);
}
