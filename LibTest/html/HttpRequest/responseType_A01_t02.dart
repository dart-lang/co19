/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion String responseType
 * String telling the server the desired response format.
 * Default is String. Other options are one of 'arraybuffer', 'blob', 'document',
 * 'json', 'text'.
 * Some newer browsers will throw NSERRORDOMINVALIDACCESS_ERR if responseType
 * is set while performing a synchronous request.
 * @description Checks that values 'arraybuffer', 'blob', 'document',
 * 'json', 'text' are allowed.
 */
import "dart:html";
import "../../../UtilsHtml/expect.dart";

const values = const ['arraybuffer', 'blob', 'document', 'json', 'text'];

main() {
  var request = new HttpRequest();
  for (String v in values) {
    request.responseType = v;
    Expect.equals(v, request.responseType);
  }
}
