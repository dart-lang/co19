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
 * @description Check that paused parameter with value false cause isolate to
 * start up normally
 *
 * @author a.semenov@unipro.ru
 */
import "dart:isolate";
import "../../../Utils/expect.dart";

main() {
  asyncStart();
  ReceivePort receivePort = new ReceivePort();
  receivePort.listen((_) {
    asyncEnd();
    receivePort.close();
  });
  Isolate.spawnUri(
      new Uri.file("spawnUri_A01_t01_isolate.dart"),
      ["response"],
      receivePort.sendPort,
      paused: false);
}
