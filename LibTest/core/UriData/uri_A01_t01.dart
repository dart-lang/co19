/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Uri uri
 * The Uri that this UriData is giving access to.
 *
 * Returns a Uri with scheme data and the remainder of the data URI as path.
 * @description Checks that this property returns correct Uri
 * @issue 28682
 * @author sgrekhov@unipro.ru
 */
import "../../../Utils/expect.dart";

main() {
  UriData uriData = new UriData.fromString("Some data");
  Expect.isNotNull(uriData.uri);
  Expect.equals(uriData.toString(), uriData.uri.data.toString());
  //Expect.equals(uriData, uriData.uri.data);
}
