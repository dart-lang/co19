/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Iterable<String> split (String lines, [int start = 0, int end])
 * Split lines into individual lines.
 * If start and end are provided, only split the contents of
 * lines.substring(start, end). The start and end values must specify a valid
 * sub-range of lines (0 <= start <= end <= lines.length).
 *
 * @description Checks that method split splits lines into individual lines.
 * Splits the contents of lines.substring(start, end), if start and end are
 * provided.
 * @author ngl@unipro.ru
 */
import "dart:convert";
import "../../../Utils/expect.dart";

main() {
  String s1 = """
abc
defg
hijkl
""";
  List<String> list = List.from(LineSplitter.split(s1));
  Expect.listEquals(["abc", "defg", "hijkl"], list);
  list = List.from(LineSplitter.split(s1, 3, 7));
  Expect.listEquals(["", "def"], list);
  list = List.from(LineSplitter.split(s1, 2));
  Expect.listEquals(["c", "defg", "hijkl"], list);
}
