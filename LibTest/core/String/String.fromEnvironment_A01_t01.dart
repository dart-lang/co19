/*
 * Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion const String.fromEnvironment(String name, {String defaultValue})
 * Returns the string value of the environment declaration name.
 * Environment declarations are provided by the surrounding system compiling or
 * running the Dart program. Declarations map a string key to a string value.
 * If name is not declared in the environment, the result is instead
 * defaultValue.
 * @description Checks that if the is no appropriate environment variable then
 * default value is used
 * @author sgrekhov@unipro.ru
 */
import "../../../Utils/expect.dart";

const ENV_VAR = "SOME_ENV_VARIABLE";

main() {
  var s1 = const String.fromEnvironment(ENV_VAR, defaultValue: "No");
  Expect.equals("No", s1);

  var s2 = const String.fromEnvironment(ENV_VAR);
  Expect.equals("", s2);
}
