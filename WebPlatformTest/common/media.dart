import 'dart:html';

//
// Returns the URI of a supported video source based on the user agent
//
String getVideoURI(base)
{
    var extension = '.mp4';

    VideoElement videotag = document.createElement("video");

    if ( videotag.canPlayType('video/ogg; codecs="theora, vorbis"') != "")
    {
        extension = '.ogv';
    }

    return base + extension;
}

//
// Returns the URI of a supported audio source based on the user agent
//
String getAudioURI(base)
{
    var extension = '.mp3';

    AudioElement audiotag = document.createElement("audio");

    if ( audiotag.canPlayType('audio/ogg') != "")
    {
        extension = '.oga';
    }

    return base + extension;
}
