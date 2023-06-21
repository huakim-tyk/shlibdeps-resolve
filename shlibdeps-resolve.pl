#!/usr/bin/perl
use Getopt::Long GetOptionsFromArray;


my $bin = [];
my $root = [];
my $version;
my $VERSION = "0.1";

GetOptionsFromArray(\@ARGV,  
"binary|b=s" => $bin,
"version|v" => \$version,
"help|h" => \$help,
"root|r=s" => $root);


if ($help){
    help:
    print "Usage: shlibdeps-resolve [<option>...] -b src
    
Options:
    --binary|-b   src - add binary file or directory for scanning 
    --root|-r     src - add directory where libraries are located
    --help|-h         - show help
    --version|-v      - show version
";
} else {
    if ($version) {
        print($VERSION); 
    } else {
        if (scalar @$bin){


            use DPKG::Parse::Info;
            use DPKG::ShlibDeps::Resolve qw(scan_shared_lib);
            my $info = DPKG::Parse::Info->new;
            $info->parse;

            print(join("\n", scan_shared_lib($info, $bin, $root)));
        } else {
            goto help;
        }
    }
}
