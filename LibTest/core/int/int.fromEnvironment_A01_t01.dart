/*
 * Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion const int.fromEnvironment(String name, {int defaultValue})
 * Returns the integer value of the given environment declaration name.
 * The result is the same as would be returned by:
 * int.tryParse(const String.fromEnvironment(name, defaultValue: ""))
 *   ?? defaultValue
 * @description Checks that this constructor returns null if there is no
 * environment variable with appropriate name
 * @author sgrekhov@unipro.ru
 */
import "../../../Utils/expect.dart";

const ENV_VAR = "SOME_ENV_VARIABLE";

main() {
  const def = bool.hasEnvironment(ENV_VAR) ? const int.fromEnvironment(ENV_VAR) : 0;
  const v1 = const int.fromEnvironment(ENV_VAR);
  Expect.equals(def, v1);

  const def2 = bool.hasEnvironment(ENV_VAR) ? const int.fromEnvironment(ENV_VAR) : 42;
  const v2 = const int.fromEnvironment(ENV_VAR, defaultValue: def2);
  Expect.equals(def2, v2);
}
