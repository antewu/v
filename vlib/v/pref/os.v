// Copyright (c) 2019-2020 Alexander Medvednikov. All rights reserved.
// Use of this source code is governed by an MIT license
// that can be found in the LICENSE file.
module pref

pub enum OS {
	_auto // Reserved so .mac cannot be misunderstood as auto
	mac
	linux
	windows
	freebsd
	openbsd
	netbsd
	dragonfly
	js // TODO
	android
	solaris
	haiku
}

// Helper function to convert string names to OS enum
pub fn os_from_string(os_str string) OS {
	match os_str {
		'linux' {
			return .linux
		}
		'windows' {
			return .windows
		}
		'mac' {
			return .mac
		}
		'macos' {
			return .mac
		}
		'freebsd' {
			return .freebsd
		}
		'openbsd' {
			return .openbsd
		}
		'netbsd' {
			return .netbsd
		}
		'dragonfly' {
			return .dragonfly
		}
		'js' {
			return .js
		}
		'solaris' {
			return .solaris
		}
		'android' {
			return .android
		}
		'haiku' {
			return .haiku
		}
		'linux_or_macos' {
			return .linux
		}
		'' {
			return ._auto
		}
		else {
			panic('bad os $os_str')
		}
	}
}

pub fn (o OS) str() string {
	match o {
		._auto {
			return 'RESERVED: AUTO'
		}
		.mac {
			return 'MacOS'
		}
		.linux {
			return 'Linux'
		}
		.windows {
			return 'Windows'
		}
		.freebsd {
			return 'FreeBSD'
		}
		.openbsd {
			return 'OpenBSD'
		}
		.netbsd {
			return 'NetBSD'
		}
		.dragonfly {
			return 'Dragonfly'
		}
		.js {
			return 'JavaScript'
		}
		.android {
			return 'Android'
		}
		.solaris {
			return 'Solaris'
		}
		.haiku {
			return 'Haiku'
		}
		else {
			//TODO Remove when V is smart enough to know that there's no other possibilities
			//should never be reached as all enum types have been enumerated
			panic('unknown OS enum type: $o')
		}
	}
}

pub fn get_host_os() OS {
	$if linux {
		return .linux
	}
	$if macos {
		return .mac
	}
	$if windows {
		return .windows
	}
	$if freebsd {
		return .freebsd
	}
	$if openbsd {
		return .openbsd
	}
	$if netbsd {
		return .netbsd
	}
	$if dragonfly {
		return .dragonfly
	}
	$if solaris {
		return .solaris
	}
	$if haiku {
		return .haiku
	}
	panic('unknown host OS')
}