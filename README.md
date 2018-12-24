# docker-gstreamer-rtsp-srt

This dockerized container will consume an RTSP service and re-publish it as an SRT service.

## Usage:

Either edit the `.env` file to change the `RTSP_URL`, or export that environment variable with your desired URL before running:

    docker-compose up -d

## Advanced usage:

The `RTSP_USER_ID` and `RTSP_USER_PW` variables are for an RTSP URL that requires authentication.

The `SRT_PASSPHRASE` and `SRT_KEY_LENGTH` variables are to enable optional SRT encryption. If you enable these, you will need to ensure that your SRT client uses these same settings.

## SRT

- [SRT](https://www.srtalliance.org/) - https://github.com/Haivision/srt
- https://www.collabora.com/news-and-blog/blog/2018/02/16/srt-in-gstreamer/
- https://www.collabora.com/news-and-blog/blog/2018/02/20/srt-typical-examples/

