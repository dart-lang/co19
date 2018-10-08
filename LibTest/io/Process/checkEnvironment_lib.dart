/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion
 * Future<Process> start(
 *     String executable,
 *     List<String> arguments, {
 *     String workingDirectory,
 *     Map<String, String> environment,
 *     bool includeParentEnvironment: true,
 *     bool runInShell: false,
 *     ProcessStartMode mode: ProcessStartMode.normal
 * })
 *
 * @description Checks that static method [start] starts this file.
 * Used in start_A02_t01.dart, start_A02_t02.dart, start_A03_t01.dart,
 * start_A03_t02.dart.
 * @author ngl@unipro.ru
 */
import "dart:io";

main() {
  stdout.write(Platform.environment);
}
