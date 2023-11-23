// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It is not an error if the class C has an implementation
/// of the operator == other than the one inherited from Object
///
/// @description Checks that it is not an error if a case expression
/// is a compile-time constant of type double
/// @author msyabro

main() {
  switch (1.0) {
    case 0.5:
  }
}
