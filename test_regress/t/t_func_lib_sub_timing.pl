#!/usr/bin/env perl
if (!$::Driver) { use FindBin; exec("$FindBin::Bin/bootstrap.pl", @ARGV, $0); die; }
# DESCRIPTION: Verilator: Verilog Test driver/expect definition
#
# Copyright 2022 by Antmicro Ltd. This program is free software; you
# can redistribute it and/or modify it under the terms of either the GNU
# Lesser General Public License Version 3 or the Perl Artistic License
# Version 2.0.
# SPDX-License-Identifier: LGPL-3.0-only OR Artistic-2.0

scenarios(vlt => 1);  # UNOPTTHREADS in vltmt

if (!$Self->have_coroutines) {
    skip("No coroutine support");
}
else {
    top_filename("t/t_func_lib_sub.v");

    compile(
        verilator_flags2 => ["--timing"],
        );
}
# No execute
ok(1);
1;
