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
 *                                       spawnUri_A02_t01.dart,
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
 * @description Checks that if uri is an integer, then spawnUri throws an
 * exception in checked mode or returned Future instance is completed with
 * error.
 * @author a.semenov@unipro.ru
 */
import "dart:isolate";
import "../../../Utils/expect.dart";

main() {
  dynamic i = 1;
  asyncStart();
  try {
    Isolate.spawnUri(i, ["hello"], "world").then(
        (v) {
          Expect.fail("Isolate.spawnUri(1, ['hello'], 'world') should fail");
        },
        onError: (e) {
          Expect.fail("Future is completed with error: $e");
          asyncEnd();
        }
    );
  } catch (e) {
    print("Caught an error: $e");
    asyncEnd();
  }
}
