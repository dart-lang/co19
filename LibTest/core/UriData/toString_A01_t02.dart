/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion String toString()
 * Returns a string representation of this object.
 * @description Checks that this method returns correct string representation of
 * the data URI. Test data URIs created by fromString() constructor
 * @author sgrekhov@unipro.ru
 */
import "dart:convert";
import "../../../Utils/expect.dart";
import "../Uri/UriDataEncoder.lib.dart";

check(String content, String mimeType, Encoding encoding,
    Map<String, String> parameters, bool base64) {
  UriData uriData = new UriData.fromString(content, mimeType: mimeType,
      encoding: encoding, parameters: parameters, base64: base64);

  Expect.equals("data:" + encodeString(mimeType, encoding: encoding) +
      map2query(parameters) +
      (encoding == null ? "": ";charset=" + encoding.name) +
      (base64 ? ";base64" : "") + "," +
      (base64 ? base64Encode(content, encoding) : encodeString(content,
          encoding: encoding)), uriData.toString());
}

String map2query(Map<String, String> map) {
  StringBuffer sb = new StringBuffer();
  Iterator it = map.keys.iterator;
  while (it.moveNext()) {
    sb.write(";" + encodeString(it.current) + "=" +
        encodeString(map[it.current], encoding: Encoding.getByName("utf-8")));
  }
  return sb.toString();
}

String base64Encode(String str, Encoding encoding) {
  List<int> bytes = [];
  Iterator it = str.runes.iterator;
  while (it.moveNext()) {
    int i = it.current;
    if (encoding != null) {
      List<int> codes = encoding.encode(new String.fromCharCode(i));
      bytes.addAll(codes);
    } else {
      bytes.add(i);
    }
  }
  return base64.encode(bytes);
}

main() {
  Encoding utf8 = Encoding.getByName("utf-8");
  check("content", "mime/Type", null, {}, false);
  check("content", "mime/Type", utf8, {}, false);
  check("content", "mime/Type", utf8, {}, true);
  check("content data", "mime / Type ", null, {" a ": " b "}, true);
  check("Кириллица", "mime / Type ", utf8, {}, false);
  check("Кириллица", "mime / Type ", utf8, {}, true);
  check("а", "mime / Type ", utf8, {}, true);
  check(reserved, "mime / Type ", null, {}, true);
  check(reserved, "mime / Type ", null, {}, false);
  check(reserved, "mime / Type ", null, {"charset": "utf-8"}, true);
  check(unreserved, "mime / Type ", null, {}, true);
  check(unreserved, "mime / Type ", null, {}, false);
  check(unreserved, "mime / Type ", null, {"charset": "utf-8"}, true);
  check("content", "кириллица/прекрасна", utf8, {}, true);
  check("content", "кириллица/прекрасна", utf8, {}, false);
  check("content", "image/gif", null, {" a " : " b "}, false);
}
