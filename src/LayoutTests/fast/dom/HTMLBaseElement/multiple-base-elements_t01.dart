/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description Test the behavior of multiple base elements.
 * @needsreview What is dart analog for js's document.URL?
 */
import "dart:html";
import "../../../../Utils/expect.dart";
import "../../../testcommon.dart";

//FIXME
getOriginalBase(doc) {
  //return doc.URL.replace(/[^/]*$/, "");
  var a = doc.createElement('a');
  a.href = 'file';
  var ret = a.href.replaceFirst(new RegExp(r'[^/]*$'), '');
  a.remove();
  return ret;
}

main() {
  var originalBase = getOriginalBase(document);

  clean(url)
  {
    if (url.length < originalBase.length)
      return url;
    if (url.substring(0, originalBase.length) != originalBase)
      return url;
    return "http://originalbase.com/" + url.substring(originalBase.length);
  }

  var anchor = document.createElement('a');
  anchor.href = "file";

  document.body.append(anchor);

  shouldBe(clean(anchor.href), 'http://originalbase.com/file');

  var base = document.createElement('base');

  base.href = "http://domain.com/base/";
  document.head.append(base);
  shouldBe(clean(anchor.href), 'http://domain.com/base/file');

  base.href = 'http://domain.com/base-changed/';
  shouldBe(clean(anchor.href), 'http://domain.com/base-changed/file');

  base.remove();
  shouldBe(clean(anchor.href), 'http://originalbase.com/file');


  base.href = "http://domain.com/base/";

  var base2 = document.createElement('base');
  base2.href = "http://domain.com/base2/";

  var base3 = document.createElement('base');
  base3.href = "http://domain.com/base3/";

  document.head.append(base);
  document.head.append(base2);
  shouldBe(clean(anchor.href), 'http://domain.com/base/file');

  base.attributes.remove('href');
  shouldBe(clean(anchor.href), 'http://domain.com/base2/file');

  document.head.append(base3);
  shouldBe(clean(anchor.href), 'http://domain.com/base2/file');

  base.remove();
  base2.remove();
  base3.remove();
}
