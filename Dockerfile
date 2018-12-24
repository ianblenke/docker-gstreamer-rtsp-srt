FROM ubuntu:disco

RUN apt-get update
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y libgstreamer1.0-0 gstreamer1.0-plugins-base gstreamer1.0-plugins-good gstreamer1.0-plugins-bad gstreamer1.0-plugins-ugly gstreamer1.0-libav gstreamer1.0-doc gstreamer1.0-tools gstreamer1.0-x gstreamer1.0-alsa gstreamer1.0-gl gstreamer1.0-gtk3 gstreamer1.0-qt5 gstreamer1.0-pulseaudio
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y srt-tools libsrt-dev git gtk-doc-tools libgstreamer-plugins-base1.0-dev libssl1.0-dev
RUN git clone -b 1.14.4 https://github.com/GStreamer/gst-plugins-bad
WORKDIR gst-plugins-bad
RUN ./autogen.sh
WORKDIR ext/srt
RUN make install
ENV GST_PLUGIN_PATH=/usr/local/lib/gstreamer-1.0/

ADD run.sh /run.sh

CMD /run.sh
