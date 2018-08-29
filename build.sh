#!/bin/bash
git pull

docker run -v /root/maybe/buildpace/note/GitBook-Sugar-Notes:/srv/gitbook -v /root/maybe/buildpace/note/GitBook-Sugar-Notes/html:/srv/html fellah/gitbook gitbook build . /srv/html
