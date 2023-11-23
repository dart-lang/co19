// Copyright (c) 2020, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion An implementation is free to provide additional arguments allowed
/// by the signature of main (the above rules ensure that the corresponding
/// parameters are optional)
///
/// @description Checks that function 'main' may have more than two optional
/// positional argument
/// @author sgrekhov@unipro.ru
/// @issue 43584

main([List<String> args = const [], var i, String s = ""]) {
}
