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
 * @description Checks that method throws an exception if uri is null,
 * an integer or a List.
 *
 * @description Checks that returned Future is completed with error if URI
 * points to a script that declares a top-level function but it's not named
 * 'main'.
 *
 * @issue #15348
 * @author kaigorodov
  */
import "dart:async";
import "dart:isolate";
import "../../../Utils/expect.dart";

void main() {
  asyncStart();
  Future future = Isolate.spawnUri(
                            new Uri.file("spawnUri_A02_t03_bad_isolate.dart"),
                            [],
                            null
                  );
  future.then(
    (_) {
      Expect.fail("spawnUri(bad library) is expected to fail");
    },
    onError: (error) {
      asyncEnd();
    }
  );
}
