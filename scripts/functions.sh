abort()
{
  MSG=$1
  echo
  echo "ERROR: $MSG"
  echo
  echo "CC=$CC CXX=$CXX CMAKE_FLAGS=$CMAKE_FLAGS"
  echo
  echo "abort."
  exit 1
}

separator()
{
  echo
  echo "==============================================================================="
  echo
}
