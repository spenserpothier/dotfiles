#!/bin/sh

# Inspired by https://github.com/adamveld12/laughing-hipster/blob/89ddba06dddbb3f88e605e4cee5598f10529d9e1/sourceme.sh

# Set plugins to load here. Run files_plugins_list to see available plugins.
export FILES_PLUGINS=("brew" "git" "p10k" "ssh" "tmux" "vim" "zsh");

files_plugins_list() {
	for plugin in ${FILES_PLUGINS[@]}; do
		export FILES_PLUGIN_ROOT="${FILES_ROOT}/plugins/${plugin}";
		echo "\"${plugin}\" @ ${FILES_PLUGIN_ROOT}";
		unset FILES_PLUGIN_ROOT;
	done
}

load_env() {
	files_debug_log "[load_env] DEBUG MODE IS ENABLED. Turn if off via:\nunset FILES_DEBUG\n";
	if [[ -d "${1}" ]]; then
		export HOME=${1};
	fi

	if [[ -z "${FILES_ROOT}" ]]; then
		export FILES_ROOT="${HOME}/.files";
	fi

	files_debug_log "[load_env] \$FILES_ROOT = ${FILES_ROOT}";
	export FILES_USER_CONFIG="${HOME}/.config";

	export FILES_CACHE_DIR="${FILES_ROOT}/.tmp/";

	if [[ -d "${FILES_CACHE_DIR}" ]]; then
		files_debug_log "[load env] Setting up cache directory @ ${FILES_CACHE_DIR}";
		mkdir -p ${FILES_CACHE_DIR};
	fi

	if [[ -z "${FILES_PLUGINS}" ]]; then
		export FILES_PLUGINS=("brew" "ssh" "vim" "git-extras" "asdf" "helm" "starship" "extras");
	fi
	files_debug_log "[load_env] using plugins FILES_PLUGINS=${FILES_PLUGINS}";

	files_debug_log "[load_env] \$HOME='$HOME'";
	# load plugns
	for plugin in ${FILES_PLUGINS[@]}; do
       set +b;
		export FILES_PLUGIN_ROOT="${FILES_ROOT}/plugins/${plugin}";
		if [[ -f "${FILES_PLUGIN_ROOT}/${plugin}.sh" ]]; then
			files_debug_log "[PLUGIN] LOADING ${plugin} @ ${FILES_PLUGIN_ROOT}";
			source "${FILES_PLUGIN_ROOT}/${plugin}.sh";
		fi
		unset FILES_PLUGIN_ROOT;
        set -b;
	done

	files_debug_log "[load_env] setting up ${FILES_USER_CONFIG} directory";
	files_linkdir "${FILES_ROOT}/.config" ${FILES_USER_CONFIG};

	[[ -f "${HOME}/.bashrc" ]] && files_install "${HOME}/.bashrc";
	[[ -f "${HOME}/.bash_profile" ]] && files_install "${HOME}/.bash_profile";
	[[ -f "${HOME}/.profile" ]] && files_install "${HOME}/.profile";

	return 0;
}

load_env || true;