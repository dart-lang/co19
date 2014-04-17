/*
 * after web-platform-tests/dom/nodes/Node-appendChild.html
 *
 * @assertion Node.append
 * <link rel=help href="http://dvcs.w3.org/hg/domcore/raw-file/tip/Overview.html#dom-node-append">
 * @description
 */

import 'dart:html';
import "../../Utils/expectWeb.dart";

void main() {
  assert_throws("TypeError", () { document.body.append({'a':'b'}); });
}
