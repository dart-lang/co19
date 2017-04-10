/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion List<String> convert(String data)
 * Converts input and returns the result of the conversion.
 * @description Checks that this method splits a String into individual lines.
 * @author sgrekhov@unipro.ru
 */
import "dart:convert";
import "../../../Utils/expect.dart";

main() {
  LineSplitter ls = new LineSplitter();
  Expect.listEquals(["aaa", "bbb"], ls.convert("aaa\nbbb"));
  Expect.listEquals(["aaa", "bbb", "c"], ls.convert("aaa\nbbb\rc"));
  Expect.listEquals(["aaa", "bbb", "c"], ls.convert("aaa\nbbb\r\nc"));
  Expect.listEquals(["aaa\fbbb", "c"], ls.convert("aaa\fbbb\r\nc"));
  Expect.listEquals(["aaa\tbbb", "c"], ls.convert("aaa\tbbb\r\nc"));
  Expect.listEquals(["aaa\tbbb", "c"], ls.convert('aaa\tbbb\r\nc'));
  Expect.listEquals(["aaa", "bbb", "c"], ls.convert('''aaa
bbb
c'''));
  Expect.listEquals(["aaa", "bbb", "c"], ls.convert("""aaa
bbb
c
"""));
  Expect.listEquals(["aaabbbc"], ls.convert("aaa"
    "bbb"
    "c"));
  Expect.listEquals(["", "", "", "", "", ""], ls.convert('\n\r\n\n\r\r\r'));
  Expect.listEquals([r'aaa\tbbb\r\nc'], ls.convert(r'aaa\tbbb\r\nc'));
  Expect.listEquals([r'aaa\tbbb\r\nc'], ls.convert(r"aaa\tbbb\r\nc"));
}
