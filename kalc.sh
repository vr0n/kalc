#!/usr/bin/zsh

vared -p "Maffs: " -c MAFF

SPACE=" "

get_ascii() {
  ARG="${1}"
  if [[ $(( ${#ARG} % 2 )) != 0 ]]; then
    ARG="0${ARG}"
  fi
  for char in $(printf "%s" "${ARG}" | sed -e 's/.\{2\}/&\n/g'); do # The newline is the magick here
    printf "\x${char}";
  done
}

if [[ "${MAFF}" =~ "${SPACE}" ]]; then
  echo "Answer: $((${MAFF}))"
else
  DEC="$((${MAFF}))"
  HEX=$(printf "%x" "${DEC}")
  ASCII="$(get_ascii ${HEX})"
  #get_ascii "${HEX}"
  printf "Decimal:\t%d\n"  "${DEC}"
  printf "Hex:\t\t0x%s\n"  "${HEX}"
  printf "Octal:\t\to%o\n" "${DEC}"
  printf "Ascii:\t\t%s\n"  "${ASCII}"
fi

INPUT="0"
while [ 1 ]; do
  read -s -t 0.25 -n INPUT
  if [[ "${INPUT}" == "" ]]; then
    break;
  fi
done

kill -25 "${PPID}"
