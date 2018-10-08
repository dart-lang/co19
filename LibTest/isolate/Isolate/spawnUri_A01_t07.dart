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
 *     The isolate starts executing the top-level main function of the library
 *  with the given URI.
 *     The target main must be callable with zero, one or two arguments.
 *  Examples:
 *   main()
 *   main(args)
 *   main(args, message)
 *     When present, the parameter args is set to the provided args list. When
 *  present, the parameter message is set to the initial message.
 *
 * @description Checks that the function spawns the isolate that executes the
 * main(args) function (i.e. only one argument).
 *
 * @issue #26738
 * @author a.semenov@unipro.ru
 */

import "dart:isolate";
import "dart:async";
import "../../../Utils/expect.dart";

// Due to issue #26738 it is necessary to keep initial isolate alive,
// so the started isolate could proceed.
void main(List args, SendPort replyPort) {
  asyncStart();
  ReceivePort onExit = new ReceivePort();
  Future.wait([
    Isolate.spawnUri(
            new Uri.file("spawnUri_A01_t07_isolate.dart"),
            ["hello", "world"],
            null,
            onExit:onExit.sendPort
    ),
    onExit.first // keep isolate alive
  ]).then( (_) => true );
}
