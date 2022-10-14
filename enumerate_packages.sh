for pkg in `adb shell pm list packages -s -e -f | awk -F= '{sub("package:","");print $1}'`
do
  adb shell /data/local/tmp/aapt d badging $pkg | awk -F: '
      $1 == "package" { split($2,space," ")
      name=space[1];version=space[3]}
      $1 == "application-label" {print name, version, $2 }'
done

