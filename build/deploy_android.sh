#!/bin/bash

set -e

cp android-build/bin/QtApp-release.apk TvSeriesOrganizer.apk
scp -o StrictHostKeyChecking=no TvSeriesOrganizer.apk download@rom1504.fr:download/TvSeriesOrganizer/android/
command="cp download/TvSeriesOrganizer/android/TvSeriesOrganizer.apk download/TvSeriesOrganizer/android/TvSeriesOrganizer-$commitNumber.apk"
ssh download@rom1504.fr $command
