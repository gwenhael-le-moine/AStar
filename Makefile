default:
#	$(MAKE) icons clean debug run
	$(MAKE) clean debug run

icons:
	mkdir -p res/drawable{,-{l,m,h,xh}dpi}
	convert -resize 36 icon512.png res/drawable-ldpi/icon.png
	convert -resize 48 icon512.png res/drawable-mdpi/icon.png
	convert -resize 72 icon512.png res/drawable-hdpi/icon.png
	convert -resize 96 icon512.png res/drawable-xhdpi/icon.png
	cp res/drawable-mdpi/icon.png res/drawable/icon.png

clean:
	ant clean
debug:
	ant debug install
release:
	ant release
sign:
	jarsigner -digestalg SHA1 -sigalg MD5withRSA -verbose -keystore ~/.android/gwenhael-release-key.keystore bin/AStar-release-unsigned.apk gwenhael-release
	mv bin/AStar-release-unsigned.apk bin/AStar-release-signed.apk
	zipalign -v 4 bin/AStar-release-signed.apk bin/AStar-release.apk

run:
	adb shell am start -a android.intent.action.MAIN -n com.gwenhael.astar/com.gwenhael.astar.AStarActivity
