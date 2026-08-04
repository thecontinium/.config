# Output the file name if it is executed at login
[[ -v CONFIG_ZSH_SHOW_EXECUTING ]] && [[ $- == *i* ]] && echo now executing ${(%):-%N}

# Guard Clause: Exit immediately if LibreOffice is not installed
if [[ ! -d "/Applications/LibreOffice.app" && ! -d "${HOME}/Applications/LibreOffice.app" ]]; then
  return 0
fi

# Ultra-Fast Path: Exit immediately if symlinks are already set up 
# OR if LibreOffice profile directory hasn't been generated yet
if [[ -L "${HOME}/Library/Application Support/LibreOffice/4/user/registrymodifications.xcu" || ! -d "${HOME}/Library/Application Support/LibreOffice/4/user" ]]; then
  return 0
fi

# --- One-time setup logic below (only executes on initial run or after clean installs) ---

local macos_dir="${HOME}/Library/Application Support/LibreOffice/4/user"
local xdg_dir="${XDG_CONFIG_HOME:-${HOME}/.config}/libreoffice/4/user"
local -a targets=(registrymodifications.xcu config autotext wordbook)

mkdir -p "${xdg_dir}"

local item src dest
for item in "${targets[@]}"; do
  src="${macos_dir}/${item}"
  dest="${xdg_dir}/${item}"

  # Protect existing XDG configs: move macOS config only if XDG version doesn't exist
  if [[ -e "${src}" && ! -L "${src}" ]]; then
    if [[ -e "${dest}" ]]; then
      rm -rf "${src}"
    else
      mv "${src}" "${dest}"
    fi
  fi

  # Initialize empty target in XDG if missing
  if [[ ! -e "${dest}" ]]; then
    if [[ "${item}" == *.* ]]; then
      touch "${dest}"
    else
      mkdir -p "${dest}"
    fi
  fi

  # Symlink macOS Application Support location -> XDG target
  if [[ ! -L "${src}" ]]; then
    ln -s "${dest}" "${src}"
  fi
done
