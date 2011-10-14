/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Raw string literals are supported by prefixing the literal with a @.
 * Raw strings are not subject to interpretation of meta characters \ and $.
 * @description Checks that string literals prefixed with a @ are allowed and they are not
 * subject to interpretation of characters \ and $.
 * @author pagolubev
 * @reviewer akuznecov
 */


main() {
  Expect.isTrue(@"raw string\t\n" == "raw string\\t\\n");

  Expect.isTrue(@"quotes can't be escaped\" == "quotes can't be escaped\\");

  @"""
""\n\t\n$$""''''''''''''
""";
}
