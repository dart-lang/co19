/*
 * Copyright (c) 2011-2016, the Dart project authors.  Please see the AUTHORS
 * file for details. All rights reserved. Use of this source code is governed
 * by a BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Future<Isolate> spawnUri(Uri uri,
 *                                     List<String> args,
 *                                     message,
 *                                     { bool paused: false,
 *                                       SendPort onExit,
 *                                       SendPort onError,
 *                                       bool errorsAreFatal,
 *                                       bool checked,
 *                                       Map<String, String> environment,
 *                                       Uri packageRoot,
 *                                       Uri packageConfig,
 *                                       bool automaticPackageResolution: false
 *                                     }
 *                                    )
 *     Creates and spawns an isolate that runs the code from the library with
 *  the specified URI.
 *  ...
 *  If the paused parameter is set to true, the isolate will start up in
 *  a paused state, as if by an initial call of
 *  isolate.pause(isolate.pauseCapability). To resume the isolate, call
 *  isolate.resume(isolate.pauseCapability).
 *
 * @description Check that paused parameter with value true cause isolate to
 * start up in a paused state, i.e. isolate entry function is not executed
 *
 * @author a.semenov@unipro.ru
 */
import "dart:isolate";
import "dart:async";
import "../../../Utils/expect.dart";
import "IsolateUtil.dart";

test() async {
  bool testPassed = true;
  ReceivePort receivePort = new ReceivePort();
  receivePort.listen((_) => testPassed = false);
  await Isolate.spawnUri(
                          new Uri.file("spawnUri_A01_t01_isolate.dart"),
                          ["hello"],
                          receivePort.sendPort,
                          paused: true);
  await new Future.delayed(TWO_SECONDS);
  if (testPassed){
    asyncEnd();
  }
  receivePort.close();
}

main() {
  asyncStart();
  test();
}

