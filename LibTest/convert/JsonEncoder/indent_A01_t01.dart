/*
 * Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion String indent
 *  read-only
 *  The string used for indention.
 *
 * When generating multi-line output, this string is inserted once at the
 * beginning of each indented line for each level of indentation.
 *
 * If null, the output is encoded as a single line.
 * @description Checks that this property returns the string used for indention.
 * @author sgrekhov@unipro.ru
 */
import "dart:convert";
import "../../../Utils/expect.dart";

main() {
  JsonEncoder encoder = new JsonEncoder();
  Expect.isNull(encoder.indent);

  encoder = new JsonEncoder.withIndent(null);
  Expect.isNull(encoder.indent);

  encoder = new JsonEncoder.withIndent("");
  Expect.equals("", encoder.indent);

  encoder = new JsonEncoder.withIndent("  ");
  Expect.equals("  ", encoder.indent);

  encoder = new JsonEncoder.withIndent("--");
  Expect.equals("--", encoder.indent);

  encoder = new JsonEncoder.withIndent("Non-ASCII: отступ ");
  Expect.equals("Non-ASCII: отступ ", encoder.indent);
}
