library utilities;
import "dart:html";

// Start the bidding at 42 for no particular reason.
var lastID = 42;

String canonicalize(String url) {
  var id = ++lastID;
  document.body.appendHtml("<a id='$id' href='$url'></a>");
  Element elem = document.getElementById(id.toString());
  String res = (elem as AnchorElement).href;
//  print("'$url'=>'$res'");
  return res;
}

void setBaseURL(url) {
    // Remove any existing base elements.
    var existingBase = document.getElementsByTagName('base');
    while (existingBase.length) {
        var element = existingBase[0];
        element.remove();
    }

    // Add a new base element.
    document.body.appendHtml('<base href="$url">');
}

List segments(String url) {
  var id = ++lastID;
  String idstr=id.toString();
  document.body.appendHtml("<a id='$idstr' href='$url'></a>");
  var elmt = document.getElementById(idstr);
  return [
    elmt.protocol,
    elmt.hostname,
    elmt.port,
    elmt.pathname,
    elmt.search,
    elmt.hash
  ];
}
