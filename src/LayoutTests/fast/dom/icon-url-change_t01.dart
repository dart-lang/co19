/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description 
 */
import "dart:html";
import "../../testcommon.dart";
import "../../../Utils/async_utils.dart";

main() {
  var index;

  setFavIcon(iconURL) {
    var docHead = document.getElementsByTagName("head")[0];
    //var links = docHead.getElementsByTagName("link"); // no such in dart
    var links = docHead.queryAll("link");
    for (var i = index; i < links.length; ++i) {
      var link = links[i];
      if (link.type == "image/x-icon" && link.rel == "shortcut icon") {
        link.remove();
        break; // Assuming only one match at most.
      }
    }
    var link = document.createElement("link");
    link.type = "image/x-icon";
    link.rel = "shortcut icon";
    link.href = iconURL;
    docHead.append(link);
  }

  // test framefork may have some links
  index = document.getElementsByTagName("head")[0].queryAll("link").length;

  document.head.append(new Element.html('''
        <link rel="shortcut icon" type="image/x-icon" href="http://test.com/oldfavicon.ico"/>,
    ''', treeSanitizer: new NullTreeSanitizer()));

  asyncStart();
  window.onLoad.first.then((_) {
    var iconURL = document.getElementsByTagName("head")[0]
      .queryAll("link")[index].href;
    debug('Original iconURL is: ' + iconURL);
    shouldBe(iconURL, 'http://test.com/oldfavicon.ico');

    // change icon to new icon
    var newURL = 'http://test.com/newfavicon.ico';
    debug('Setting new icon URL to: ' + newURL);
    setFavIcon(newURL);
    iconURL = document.getElementsByTagName("link")[index].href;
    debug('New iconURL is: ' + iconURL);
    shouldBe(iconURL, 'http://test.com/newfavicon.ico');

    // change icon back to old icon and ensure it changes properly
    var oldURL = 'http://test.com/oldfavicon.ico';
    debug('Setting icon URL back to: ' + oldURL);
    setFavIcon(oldURL);
    iconURL = document.getElementsByTagName("link")[index].href;
    debug('Original iconURL is still: ' + iconURL);
    shouldBe(iconURL, 'http://test.com/oldfavicon.ico');

    asyncEnd();
  });
}
