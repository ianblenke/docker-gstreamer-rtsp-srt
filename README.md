# docker-gstreamer-rtsp-srt

This dockerized container will consume an RTSP video streaming service and re-publish it as an SRT (Secure Reliable Transport) service.

## Usage:

Either edit the `.env` file to change the `RTSP_URL`, or export that environment variable with your desired URL before running:

    docker-compose up -d

Then open up an SRT client connection to the service. VLC4 nightly builds should be able to open up the URL:

- srt://localhost:7001

Alternatively, you can use gstreamer if you have the SRT plugin from gst-plugins-bad installed:

    gst-launch-1.0 srtclientsrc uri=srt://localhost:7001 ! decodebin ! autovideosink

or if you have set a passphrase for encryption:

    gst-launch-1.0 srtclientsrc key-length=${SRT_KEY_LENGTH} passphrase="${SRT_PASSPHRASE}" uri=srt://localhost:7001 ! decodebin ! autovideosink

The localhost example should probably be replaced with a remote host accessing SRT over the network, as SRT was designed to drastically improve video over a poor network connection.

## Advanced usage:

The `RTSP_USER_ID` and `RTSP_USER_PW` variables are for an RTSP URL that requires authentication.

The `SRT_PASSPHRASE` and `SRT_KEY_LENGTH` variables are to enable optional SRT encryption. If you enable these, you will need to ensure that your SRT client uses these same settings.

## More SRT information:

- [SRT](https://www.srtalliance.org/) - https://github.com/Haivision/srt
- https://www.collabora.com/news-and-blog/blog/2018/02/16/srt-in-gstreamer/
- https://www.collabora.com/news-and-blog/blog/2018/02/20/srt-typical-examples/

