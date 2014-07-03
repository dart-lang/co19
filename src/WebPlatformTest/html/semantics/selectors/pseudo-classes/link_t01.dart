/**
 * after web-platform-tests/html/semantics/selectors/pseudo-classes/link.html
 * @assertion
 * http://www.w3.org/html/wg/drafts/html/master/#pseudo-classes
 * @description Selector: pseudo-classes (:link)
 */
import 'dart:html';
import "../../../../Utils/expectWeb.dart";
import "utils.dart";

const String htmlEL = r'''
<a id=link4></a>
<area id=link5></area>
<link id=link6></link>
<a href="http://www.w3.org" id=link7></a>
<area href="http://www.w3.org" id=link8></area>
<link href="http://www.w3.org" id=link9></link>
<a href="http://[" id=link10></a>
''';

void main() {
  document.body.appendHtml(htmlEL);

  testSelector(":link"
    , ["link7", "link8", "link9", "link10"]
    , "Only <a>s, <area>s and <link>s that have a href attribute match ':link'");

  document.getElementById("link9").attributes.remove("href");
  testSelector(":link"
    , ["link7", "link8", "link10"]
    , "':link' doesn't match elements whos href attribute has been removed");
  
  checkTestFailures();
}
