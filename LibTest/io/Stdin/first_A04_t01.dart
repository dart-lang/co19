/*
 * Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Future<T> first
 * Except for the type of the error, this method is equivalent to
 * [this.elementAt(0)].
 * @description Checks that [first] call result is equivalent to the result of
 * [this.elementAt(0)]
 * @author iarkh@unipro.ru
 */
import "../../../Utils/expect.dart";
import "dart:io";

run_process(String arg) {
  if(arg == "first") {
    stdin.first.then((List<int> l) {
      print(SystemEncoding().decode(l));
    });
  } else {
    stdin.elementAt(0).then((List<int> l) {
      print(SystemEncoding().decode(l));
    });
  }
}

String getResultString(List<int> res) {
  return String.fromCharCodes(res).replaceAll("\r\n", "\n");
}

run_main() async {
  String executable = Platform.resolvedExecutable;
  String eScript = Platform.script.toString();
  String res_first, res_elementAt;

  await Process.start(executable, [eScript, "first"], runInShell: true).then(
      (Process process) async {
        process.stdin.writeln("12345");
        res_first = await process.stdout.transform(systemEncoding.decoder).join();
      });

  await Process.start(executable, [eScript, "elementAt"], runInShell: true).then(
      (Process process) async {
    process.stdin.writeln("12345");
    res_elementAt = await process.stdout.transform(systemEncoding.decoder).join();
  });

  Expect.isTrue("12345\n\n".startsWith(res_first.replaceAll("\r\n", "\n")));
  Expect.isTrue("12345\n\n".startsWith(res_elementAt.replaceAll("\r\n", "\n")));
}

main(List<String> args) { args.length > 0 ? run_process(args[0]) : run_main(); }
