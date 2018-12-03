/*
 * Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion String readLineSync({
 *   Encoding encoding: systemEncoding,
 *   bool retainNewlines: false
 *   })
 * The argument [encoding] can be used to changed how the input should be
 * decoded.
 * @description Checks that input string with utf8 encoding is correctly passed.
 * @author iarkh@unipro.ru
 */
import "dart:convert";
import "dart:io";
import "test.lib.dart";

List<int> expected = utf8.encode("TESTME Тест для проверки 1âã");
String str = utf8.decode(expected);

void run_process(String filename, Encoding enc) async {
  String res = stdin.readLineSync(encoding : enc);
  File fl = new File(filename);
  await fl.writeAsString(res);
}

void run(Process process) { process.stdin.writeln(str); }

main(List<String> args) {
  if (args.length > 0) {
    run_process(args[0], utf8);
  } else {
    run_main(run, str);
  }
}
