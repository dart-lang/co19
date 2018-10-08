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
 * @description Checks that [systemEncoding] string is passed OK
 * @author iarkh@unipro.ru
 */

import "dart:io";
import "test.lib.dart";
import "../file_utils.dart";

List<int> expected = [1, 2, 3, 50, 60, 100, 124, 125, 126, 127];
String str = systemEncoding.decode(expected);


run_process(String filename) {
  String res = stdin.readLineSync(encoding: systemEncoding);
  File fl = new File(filename);
  fl.openWrite();
  fl.writeAsString(res);
}

String run(Process process) {
  process.stdin.writeln(str);
  return str;
}

main(List<String> args) {
  String filename = Directory.systemTemp.path + Platform.pathSeparator +
      getTempFileName();
  args.length > 0 ? run_process(args[0]) : run_main(filename, run, str);
}
